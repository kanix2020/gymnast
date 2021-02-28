



  //    Score_btn = document.getElementById("scorebtn");
    
  //    const fxd_input = document.getElementById("fx_d");
  //       fxd_input.addEventListener("input", () => {
  //         const inputValuefxd = fxd_input.value;
  //         const fxe_Input = document.getElementById("fx_e");
  //         const inputValuefxe = fxe_Input.value;
  //         const fxnd_Input = document.getElementById("fx_nd");
  //         const inputValuefxnd = fxnd_Input.value;
  //         // const input_fxd_Value = fxd_Input.value;

  //         const fx_total = document.getElementById("fx_total");
  //         fx_total.innerHTML = parseFloat(inputValuefxd) + parseFloat(inputValuefxe) - parseFloat(inputValuefxnd);
    
  //       })
  //     })





//   // 他のJSファイルの関数定義（以下のmain,calc関数）と被らないように即時関数でスコープを作る
// (function () {
//     // 全体の処理の起点となる関数
//     function main() {
//       // 使う要素を予め全て取得しておく
//       const scorebtn = document.getElementById("scorebtn");
//       // 各列のD-score入力、E-score入力、Total出力の要素をグループ化して取得する
//      // window.addEventListener('load', () => {
//       const scoreGroups = document.getElementsByClassName("score-group");
//       // #scorebtnがクリックされたら処理を開始
//       scorebtn.addEventListener("click", () => {
//         // グループを一つずつ処理
//         for (const scoreGroup of scoreGroups) {
//           // グループ内の出力要素を取得
//           const output = scoreGroup.getElementsByClassName(
//             "output-score-total"
//           )[0];
//           // グループ内のD-score入力要素を取得
//           const inputD = scoreGroup.getElementsByClassName("input-socre-d")[0];
//           // グループ内のE-score入力要素を取得
//           const inputE = scoreGroup.getElementsByClassName("input-socre-e")[0];
//           const inputND = scoreGroup.getElementsByClassName("input-socre-nd")[0];

//           // 上記3つのいずれかの要素が取得出来なかったら、そのグループの計算は行わない
//           if (!output || !inputD || !inputE || !inputND) continue;

//           // 計算を行なう（計算式がわからなかったので、calc関数を調整してください）
//           const result = calc(parseFloat(inputD.value), parseFloat(inputE.value), parseFloat(inputND.value));
//           output.textContent = result;
//         }
//       });
//     // };

//     // 計算式
//     function calc(inputD, inputE, inputND) {
//       const result = inputD + inputE - inputND;
//       // 文字列が入力された場合はnullを返します。
//       // input要素をnumberにすれば必要ないと思います。
//       return isNaN(result) ? null : result;
//     }

//     // loadにすると画像などの読み込みも待ってしまうので、DOMの準備が出来たら開始するように変更しました。
//      document.addEventListener("DOMContentLoaded", main);
//   };
// });