
<map>
  <node ID="root" TEXT="算力管理平台V1.3测试点">
    <node TEXT="结算管理（中婷）" ID="c17b559b5325d940807c10dbc93dfbbe" STYLE="bubble" POSITION="right">
      <node TEXT="成本明细" ID="6ec5e2de3466a546c2fb041e8dbe98a1" STYLE="fork">
        <node TEXT="分摊成本（对账类型按月）" ID="4b6a55325e57f5b89bd836d0f256a260" STYLE="fork">
          <node TEXT="默认计算方式" ID="b76316405535c8058cc11504013977ee" STYLE="fork">
            <node TEXT="分摊成本=资源月租*项目分摊时长/当月总时长" ID="300a77985b2f10021fe25b6774ebfe73" STYLE="fork"/>
            <node TEXT="保留2位小数,四舍五入。" ID="2ecfd2737cb46992807c9309624a16cf" STYLE="fork"/>
            <node TEXT="当分摊时长=当月天数时，分摊成本直接拿资源月租" ID="96c3a6487791522715a5d48bd6f93725" STYLE="fork"/>
          </node>
          <node TEXT="对账单异常处理后" ID="ef95d1c8142e0768cc13a9f14ebe910a" STYLE="fork">
            <node TEXT="分摊成本=资源月度对账金额*项目分摊时长/当月总时长" ID="e4a666fd63e8d89aa24e61ccec6eb9e7" STYLE="fork"/>
            <node TEXT="保留2位小数,四舍五入。" ID="e4e428de89ced3f10309c2a1e92b61a0" STYLE="fork"/>
            <node TEXT="当分摊时长=当月天数时，分摊成本直接拿资源月度对账金额" ID="2446cc1bc16ef4ffe11b8c043ce58d4f" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="分摊成本（对账类型按年）" ID="b64fca0c8ecf9de36a27a78abab3a962" STYLE="fork">
          <node TEXT="默认计算方式" ID="9129011b01153628cf7469ec701aa967" STYLE="fork">
            <node TEXT="分摊成本=资源金额/12个月*项目分摊时长/当月总时长" ID="4ed2dfb1be2a36a47a48a1a2370bf29d" STYLE="fork"/>
            <node TEXT="保留2位小数,四舍五入。" ID="006ba3cf1aa28939ba0f098f7e39f4b6" STYLE="fork"/>
            <node TEXT="当分摊时长=当月天数时，分摊成本：资源金额/12个月" ID="8e98aa19ee5e11e67cfd281f796d6ffd" STYLE="fork"/>
          </node>
          <node TEXT="对账单异常处理后" ID="6a219464ec4988ce1148df722cd31fe1" STYLE="fork">
            <node TEXT="分摊成本=资源月度对账金额*项目分摊时长/当月总时长" ID="bab4099bb4ce7388170456dde388a92e" STYLE="fork"/>
            <node TEXT="保留2位小数,四舍五入。" ID="bce5f09e16d804720ee178171d6c934c" STYLE="fork"/>
            <node TEXT="当分摊时长=当月天数时，分摊成本直接拿资源月度对账金额" ID="17203444e3678111a1eb8adb112e3992" STYLE="fork"/>
          </node>
        </node>
      </node>
    </node>
  </node>
</map>