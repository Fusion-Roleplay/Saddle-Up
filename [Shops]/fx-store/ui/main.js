// var buyItems = [
//   {
//     itemName: "notebook",
//     itemLabel: "Not Defteri 4",
//     price: 50
//   },
//   {
//     itemName: "notebook",
//     itemLabel: "Not Defteri 3",
//     price: 50
//   },
//   {
//     itemName: "notebook",
//     itemLabel: "Not Defteri2",
//     price: 50
//   }
// ];
// var sellItems = [
//   {
//     itemName: "notebook",
//     itemLabel: "Not Defteri 4",
//     count: 1,
//     price: 50
//   },
//   {
//     itemName: "notebook",
//     itemLabel: "Not Defteri 3",
//     count: 5,
//     price: 50
//   },
//   {
//     itemName: "notebook",
//     itemLabel: "Not Defteri2",
//     count: 10,
//     price: 50
//   }
// ];
var loaded = false;
var currentActions = "buy";
var currentClass = {};
var currentPrice = 0;
var currentLabel = "";
$(document).ready(function () {
  $('.store-container').hide();
  $('.sellbtn').hide();
  $('.sellpage').hide();
  $('.iteminput').hide();


  function setupBuyPage(buyItems) {
    $("#buyitems").html("");
    let buyitemshtml = "";
    buyItems.forEach(function (item, index) {
      buyitemshtml = buyitemshtml + `<div class="item-container" id="${item.itemName}" label="${item.itemLabel}" price="${item.price}">
      <div id="listitem">
          <div id="listitemimg" style="background-image: url('nui://vorp_inventory/html/img/items/${item.itemName}.png');">
        
          </div>
          <div id="listitemlabel">${item.itemLabel}</div>
          <div id="listitemprice">$${item.price}</div>
      </div>
      </div>`;

    });
    $("#buyitems").html(buyitemshtml);
  }
  function setupSellPage(sellItems) {
    $("#sellitems").html("");
    let sellitemshtml = "";
    sellItems.forEach(function (item, index) {
      sellitemshtml = sellitemshtml + `<div class="item-container" id="${item.itemName}" label="${item.itemLabel}" price="${item.price}">
      <div id="listitem">
          <div id="listitemimg" style="background-image: url('nui://vorp_inventory/html/img/items/${item.itemName}.png');">
          <div id="itemcount">${item.count ? item.count : 0}</div>
          </div>
          <div id="listitemlabel">${item.itemLabel}</div>
          <div id="listitemprice">$${item.price}</div>
      </div>
      </div>`;

    });
    $("#sellitems").html(sellitemshtml);
  }

  function removeActive() {
    var altDivler = $(".itemlist").children(".item-container");
    altDivler.each(function () {
      if ($(this).hasClass("active")) {
        $(this).removeClass("active");
      }
    });
  }


  function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.15;
    audio.play();
  }
  function cancelSetupButtons() {
    $(".closebtn").off("mouseenter"); // hover dinleyicisini kaldır
    $(".craftbtn").off("mouseenter"); // hover dinleyicisini kaldır
    $("#confirm").off("mouseenter"); // hover dinleyicisini kaldır
    $("#confirm").off("click"); // click dinleyicisini kaldır
    $("#inputcount").off("input"); // input dinleyicisini kaldır
    $("#cancel").off("click"); // click dinleyicisini kaldır
    $(".item-container").off("mouseenter"); // hover dinleyicisini kaldır
    $(".item-container").off("click"); // click dinleyicisini kaldır
    $(".buybtn").off("click"); // click dinleyicisini kaldır
    $(".closebtn").off("click"); // click dinleyicisini kaldır
    $(".sellbtn").off("click"); // click dinleyicisini kaldır
  }
  function setupButtons() {
    $(".closebtn").hover(function () {
      playClickSound();
    });
    $(".craftbtn").hover(function () {
      playClickSound();
    });
    $("#confirm").hover(function () {
      playClickSound();
    });
    $("#confirm").click(function () {
      playClickSound();
      $('.iteminput').hide();
      let count = $("#inputcount").val();
      count = Number(count) ? Number(count) : 0;
      $.post(`https://${GetParentResourceName()}/buyorsellactions`, JSON.stringify({
        type: currentActions,
        itemName: currentClass,
        count: count,
        itemLabel: currentLabel,
        price: currentPrice

      }));
    });
    $("#inputcount").on("input", function () {
      var value = $(this).val();
      var parsedValue = parseInt(value);
      if (isNaN(parsedValue) || parsedValue <= 0) {
        $(this).val('');
      }
      if (value.length > 3) {
        $(this).val(value.substring(0, 3));
      }
    });
    $("#cancel").click(function () {
      playClickSound();
      $('.iteminput').fadeOut();
    });
    $(".item-container").hover(function () {
      playClickSound();
    });
    $(".item-container").click(function () {
      playClickSound();
      $('.iteminput').fadeIn();

      removeActive();
      $(this).addClass("active");

      currentClass = $(this).attr("id");
      currentPrice = $(this).attr("price");
      currentLabel = $(this).attr("label");
    });

    $(".buybtn").click(function (e) {
      e.preventDefault();
      $('.buybtn').fadeOut();
      $('.buypage').fadeOut();
      $('.sellbtn').fadeIn();
      $('.sellpage').fadeIn();
      currentActions = "sell";
    })
    $('.closebtn').click(function (e) {
      e.preventDefault();
      $(".store-container").hide();
      $.post(`https://${GetParentResourceName()}/closeUI`, JSON.stringify({}));
    })
    $(".sellbtn").click(function (e) {
      e.preventDefault();
      $('.sellbtn').fadeOut();
      $('.sellpage').fadeOut();
      $('.buybtn').fadeIn();
      $('.buypage').fadeIn();
      currentActions = "buy";
    })
    $("#itemsearch").bind("input", function () {
      var searchFor = $("#itemsearch").val().toLowerCase();
      let div = "#sellitems"
      if (currentActions === "buy") {
        div = "#buyitems"
      }
      $(`${div} .item-container`).each(function () {
        var label = $(this).attr("label");
        if (label) { // Check that label is defined
          label = label.toLowerCase();

          if (label.indexOf(searchFor) < 0) {
            $(this).hide();
          } else {
            $(this).show();
          }
        }
      });
    });
  }

  function Controller(data) {
    if (data.BuyItems.length == 0) {
      $('.buybtn').hide();
      $('.buypage').hide();
      $('.sellbtn').hide();
      $('.sellpage').fadeIn();
      currentActions = "sell";
    } else if (data.SellItems.length == 0) {
      $('.sellbtn').hide();
      $('.sellpage').hide();
      $('.buybtn').hide();
      $('.buypage').fadeIn();
      currentActions = "buy";
    } else {
      $('.sellbtn').fadeOut();
      $('.sellpage').fadeOut();
      $('.buybtn').fadeIn();
      $('.buypage').fadeIn();
      currentActions = "buy";
    }
  }
  window.addEventListener('message', function (event) {
    switch (event.data.action) {
      case 'openMenu':
        $('.store-container').show();
        setupBuyPage(event.data.array.BuyItems);
        setupSellPage(event.data.array.SellItems);
        $("#storepng").attr("src", event.data.array.image);
        $('.sellbtn').hide();
        $('.sellpage').hide();
        $('.buybtn').show();
        $('.buypage').show();
        currentClass = 0;
        currentPrice = 0;
        currentLabel = "";
        Controller(event.data.array);
        cancelSetupButtons();
        setupButtons();
        if (!loaded) {
          loaded = true;
        }
        break;
      case 'updateMenu':
        setupBuyPage(event.data.array.BuyItems);
        setupSellPage(event.data.array.SellItems);
        currentClass = 0;
        currentPrice = 0;
        currentLabel = "";
        cancelSetupButtons();
        setupButtons();
    }
  });
});
