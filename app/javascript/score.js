window.addEventListener('DOMContentLoaded', function(){
  $(function () {
    $(".input-box").on("change", function () {
      var parent = $(this).parents(".score-dend");
      var total = parent.find(".total-box");
      // D ,E、NDのどれか１つでも空白なら「Total」になる
      if ( !$(".d-score").val() || !$(".e-score").val() || !$(".nd").val()){
        total.text("total");
      } else {
        var dscore = parent.find(".d-score").val();
        var escore = parent.find(".e-score").val();
        var ndscore = parent.find(".nd").val();
        var score = parseFloat(dscore) + parseFloat(escore) - parseFloat(ndscore);
        total.text((Math.floor(score * 100)) / 100);
      }
      console.log($(".d-score").val())
      console.log($(".e-score").val())
      console.log($(".nd").val())
    });
  });
});

