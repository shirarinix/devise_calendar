window.addEventListener('DOMContentLoaded', () => {
  const tab = document.getElementById('js-tab');
  const nav = tab.querySelectorAll('[data-nav]');
  const content = tab.querySelectorAll('[data-content]');
  const ACTIVE_CLASS = 'is-active';

  //初期化設定
  const init = () => {
    content[0].style.display = 'block';
  };
  init();
  //クリック時のイベント設定
  const handleClick = (e) => {
    e.preventDefault();

    //クリックされたnavとそのdataを取得
    const $this = e.target;
    const targetVal = $this.dataset.nav;

    //不要なnav・contentwp全て一旦リセットする
    let index = 0;
    while(index < nav.length){
      content[index].style.display = 'none';
      nav[index].classList.remove(ACTIVE_CLASS);
      index++;
    }

    //対象のコンテンツをアクティブ化する
    tab.querySelectorAll('[data-content="' + targetVal + '"]')[0].style.display = 'block';
    nav[targetVal].classList.add(ACTIVE_CLASS);
  };

  //全nav要素に対してのイベント設定
  let index = 0;
  while(index < nav.length){
    nav[index].addEventListener('click', (e) => handleClick(e));
    index++;
  }

});