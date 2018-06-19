<template>
<div>
  <el-row>
    <el-col :span="24">
    <div class="grid-content bg-purple-dark main-logo">
      <h1>道のり</h1>
      </div>
    </el-col>
  </el-row>
  <div>
    <p>あなたが今まで「努力」した経験をシェアしませんか？</p>
    <p>「道のり」はあなたが努力した経験を次の世代へ引き継ぎます。</p>
    <p>注意: このサービスは<b>ベータ版</b>です。投稿内容は承諾無しに削除される可能性があります。</p>
  </div>
</div>
</template>

<style lang="scss" scoped>
@font-face {
  font-family: "KouzanSoushoOTF";
  src: url("./KouzanSoushoOTF.otf");
}
.main-logo {
  padding: 40px;
  text-align: center;
  h1 {
    //font-family: "KouzanSoushoOTF";
    margin: 0;
    font-family: "游明朝体", "YuMincho";
    font-size: 4rem;
  }
}
</style>
