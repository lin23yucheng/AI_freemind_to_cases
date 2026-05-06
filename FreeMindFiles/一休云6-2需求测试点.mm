
<map>
  <node ID="root" TEXT="一休云6.2需求测试点">
    <node TEXT="综合" ID="183aec59faaf697ca84d7cfd3483d1f1" STYLE="bubble" POSITION="right">
      <node TEXT="深度训练任务" ID="59add24b0576d1c4dc6a98d0753da9fc" STYLE="fork">
        <node TEXT="单个训练任务操作下新增【导出任务】按钮" ID="c76566c4f315fcf01b5cd70f69607b38" STYLE="fork">
          <node TEXT="将【删除】和【导出任务】合并到【更多】下" ID="d8d0e04616e4dbf7f30eb51de4eb5e3f" STYLE="fork"/>
          <node TEXT="点击【导出任务】按钮" ID="9ead9dc4a96a75bf356985955f1608ae" STYLE="fork">
            <node TEXT="选择导出的训练记录" ID="f1e723360a0333d56e20d1b2c315bfad" STYLE="fork"/>
            <node TEXT="下方显示：已选择X条（最多不超过10条）！" ID="e864f65cf89b5d97baff8e230accf1c3" STYLE="fork"/>
            <node TEXT="【取消】" ID="11ce3b242d9e549801ca351406c926d5" STYLE="fork">
              <node TEXT="弹框取消" ID="45467cf17d80f8059b9549b21cdb561c" STYLE="fork"/>
            </node>
            <node TEXT="【确认】" ID="ca987bbebc900f6f83860ae252460b20" STYLE="fork">
              <node TEXT="必须选择一条训练记录" ID="4b4afc403bddaca94337bdca8b5d9093" STYLE="fork"/>
              <node TEXT="超过10条提示" ID="6b6c1d0e6bc7072815d2dc08b581dd29" STYLE="fork"/>
              <node TEXT="确认后开始下载" ID="604ce321ba64d93d3709815597f20017" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="新增【导入任务】按钮" ID="a423af7c0ec14b6752be58ed8dbd84a7" STYLE="fork">
          <node TEXT="点击【导入任务】可上传ZIP包" ID="6150cd9ccb71feb34f888161a1a0e1ae" STYLE="fork"/>
          <node TEXT="最大限制10G" ID="abac37e9edc5c2b32513d420d1a394c7" STYLE="fork"/>
          <node TEXT="上传进度完成后，任务显示“处理中”" ID="dac22ae0437e0f31ab0f340618250bc0" STYLE="fork"/>
          <node TEXT="处理完成显示已完成，所有数据与原数据一致，来源为：上传" ID="a1b4dd0167f8a7ba7377966551baae55" STYLE="fork"/>
        </node>
      </node>
    </node>
    <node TEXT="单产品" ID="927f235ea72ff7d586330ea439d60101" STYLE="bubble" POSITION="right">
      <node TEXT="产品标签" ID="d21b0124964743d7c15255fe80c25da0" STYLE="fork">
        <node TEXT="新增产品标签可选择是否同步至其他产品" ID="a5b2aaf786500122097cf8dd37600161" STYLE="fork">
          <node TEXT="下拉可选择该空间下的其他产品" ID="2e9fc94ccd292943dfe18ace0819be50" STYLE="fork"/>
          <node TEXT="确认后将选择的产品标签同步添加到其他产品中" ID="07a45582707dfbea7f9f537ddf56d969" STYLE="fork">
            <node TEXT="如果已存在则过滤不重复添加" ID="c7208c6845a6103c87d9c432318ca738" STYLE="fork"/>
          </node>
        </node>
      </node>
    </node>
  </node>
</map>