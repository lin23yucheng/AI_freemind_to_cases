
<map>
  <node ID="root" TEXT="项目交付系统V1.0需求测试点">
    <node TEXT="全局看板（封伟/林禹成）" ID="fc067b3ea921d33578912416123d51d3" STYLE="bubble" POSITION="right">
      <node TEXT="项目类型数量展示区域" ID="9eb86ebc648c4654806f55d220812384" STYLE="fork">
        <node TEXT="数据来源：当前数据统计来源都是一休云质检空间数量" ID="2800b9b5c93efc2cec2fcadd6727db38" STYLE="fork"/>
        <node TEXT="项目状态统计下拉筛选框" ID="36761e226861e47b97dfcf84f92c0e3d" STYLE="fork">
          <node TEXT="枚举值" ID="2d2c110047572958e7d8b3d6c2c05156" STYLE="fork">
            <node TEXT="全部（默认值）" ID="cd498ad814c31f5595d6f9cdf19942b5" STYLE="fork"/>
            <node TEXT="进行中" ID="d1f045c6f993154d5ae40e0bfafce984" STYLE="fork"/>
            <node TEXT="已结项" ID="8da08be58e97b5ba17c4de6ad75c9d84" STYLE="fork"/>
          </node>
          <node TEXT="单选筛选" ID="7895d36fdeeab056036ea306d7b4a65b" STYLE="fork">
            <node TEXT="该筛选条件仅作用于项目类型数量统计" ID="8b53e6497ec70235929e0908efdcb039" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="统计质检项目数量（包含结项）" ID="e880d65322dd3a77b61b9bdadbfb78af" STYLE="fork">
          <node TEXT="一休云质检项目空间总数" ID="3a7778b6150e2c65b2e123fc355d1ea6" STYLE="fork"/>
        </node>
        <node TEXT="操作" ID="b9e205c8a2806b5c2fc008afdb9cff9d" STYLE="fork">
          <node TEXT="暂无，直接是0" ID="b1959ecf6f1a2245306aca20cbce400d" STYLE="fork"/>
        </node>
        <node TEXT="打磨" ID="17186071d17cea8de866298589b80637" STYLE="fork">
          <node TEXT="暂无，直接是0" ID="9dfca002ad73f2ca3da82dd8e6ada929" STYLE="fork"/>
        </node>
        <node TEXT="焊接" ID="83d224795ec18c16bc355a942c56f55e" STYLE="fork">
          <node TEXT="暂无，直接是0" ID="5332d451aaaa07489b5c205fb4e26b21" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="近12个月趋势展示区域" ID="9484b82d224286445c462547ba0a3248" STYLE="fork">
        <node TEXT="项目类型统计下拉筛选框" ID="dda350c1a1d6af62d4182195ffe47763" STYLE="fork">
          <node TEXT="枚举值" ID="cedda9d3430dab7247774c5e3a6d2d51" STYLE="fork">
            <node TEXT="全部（默认值）" ID="ea51cc53a091de35fbdb149753b0bc46" STYLE="fork"/>
            <node TEXT="质检" ID="55cab7f06bbcb9d3306ffdefcb8a352d" STYLE="fork"/>
            <node TEXT="操作" ID="0b499df315f9c62cd4cf90c0be2795ef" STYLE="fork"/>
            <node TEXT="焊接" ID="5932c81a6e6f464a51edbfa9a4fd9893" STYLE="fork"/>
            <node TEXT="打磨" ID="ac571af60ec3b8a2eb0f2ec3ee34be21" STYLE="fork"/>
            <node TEXT="当前只有质检，其他置灰" ID="d8b8c6826dfe61ddb9988b34bff40bee" STYLE="fork"/>
          </node>
          <node TEXT="单选筛选" ID="0fb75a4480e12ec5e36a7cf426bb8301" STYLE="fork"/>
        </node>
        <node TEXT="折线图" ID="39853937ca5ccf3913f93deabe4ef556" STYLE="fork">
          <node TEXT="统计近12个月的项目开始和结项的数量" ID="b8b8839a0221137b789581a26075cc2a" STYLE="fork"/>
          <node TEXT="横轴" ID="76703a8333bedebf5a4ef5cf692d0c99" STYLE="fork">
            <node TEXT="年月（最近12个月）" ID="feb52dfe30ec637d4b190f2b55e5b078" STYLE="fork"/>
          </node>
          <node TEXT="纵轴" ID="fbd4589b1e08839a80e6264431a7d5f1" STYLE="fork">
            <node TEXT="数量" ID="02337251b1768b64442079098acc951c" STYLE="fork"/>
          </node>
          <node TEXT="值：开始数量（橘色），结项数量（浅蓝色）" ID="f27f32dff8b2a30fa97fe81ebb1cbb66" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="行业分布图展示区域" ID="41837d09fd310a09dfd43ebe9b9325b1" STYLE="fork">
        <node TEXT="图表名称：行业分布（TOP5）" ID="99fb27e1aa35b4cf0f0d76add128da9b" STYLE="fork"/>
        <node TEXT="类型：环形图" ID="dab06402b9a6c96c6ecde986621316bd" STYLE="fork">
          <node TEXT="内容：根据项目空间的行业来分类，当前只有3C电子，汽车配件" ID="6563d0df1ce56109a0aaf47153f74fa8" STYLE="fork"/>
          <node TEXT="根据行业分布数量进行统计并计算占比，前五展示出来，后面的所有都算进其他这个分类" ID="7d0474ae101ed602c5bde23b35e16a06" STYLE="fork"/>
          <node TEXT="对应的行业颜色是固定" ID="8eeb65d11b130a0e8206b5a6ac24a94f" STYLE="fork"/>
        </node>
        <node TEXT="行业类型名称（展示在环形图下方，取值前五，最后是其他。）" ID="b940bbd6de0787fa5a08ab7e6f12dfff" STYLE="fork"/>
      </node>
      <node TEXT="最近项目展示区域" ID="a80c7f33711c92d8f82f53593213e811" STYLE="fork">
        <node TEXT="列表展示" ID="83193390f4c8fbdaadad0e95e9df5a6a" STYLE="fork">
          <node TEXT="数据来源：创建时间排序前五的项目（当前只有质检类型空间）" ID="ea0925ad0ac180ceaa20ab225e140e4d" STYLE="fork"/>
          <node TEXT="项目名称" ID="ba8b3a5c0aece8b6df0499fd20ad0b5b" STYLE="fork"/>
          <node TEXT="类型" ID="9d9e698b3844bb76e8268b1ce0a0fa0a" STYLE="fork"/>
          <node TEXT="状态" ID="13dd32a7968188b38946ce86ad930d13" STYLE="fork"/>
          <node TEXT="产品数" ID="b90b8cb0e1d1aaf4d0beac9ad3c123fd" STYLE="fork"/>
          <node TEXT="设备数" ID="6b73a22da9a64677fa248f076c6320e7" STYLE="fork"/>
          <node TEXT="操作" ID="bb069eadb9fa8d26fd8fb75892b68924" STYLE="fork">
            <node TEXT="进入项目" ID="4fc03537404a9ad7d51f11776e01a0ab" STYLE="fork">
              <node TEXT="点击进入项目详情→项目总览页面" ID="155f423253ad6071081ccda08701a6e0" STYLE="fork"/>
            </node>
          </node>
        </node>
      </node>
      <node TEXT="重点关注：老数据的统计" ID="f48082d87026cfa7ddcb564c3f5faae0" STYLE="fork"/>
    </node>
    <node TEXT="项目管理" ID="c9b2d48846b6f72a9e2ecce407c863b1" STYLE="bubble" POSITION="right">
      <node TEXT="列表页按钮&amp;功能（封伟）" ID="99d5aa6161e6c18f70be61df1ac7a21c" STYLE="fork">
        <node TEXT="创建项目空间" ID="a5d26bc7abdfcb1d8e544c2ffa2a1d82" STYLE="fork">
          <node TEXT="创建项目空间弹框" ID="f4c65b97ce90a52bb130a0e7cb409bdf" STYLE="fork">
            <node TEXT="重点关注" ID="498711d0668e02af4ee4c5414683944c" STYLE="fork">
              <node TEXT="版本部署的同时，一休云质检空间的创建，编辑，结项，成员管理的口子全部取消，EIIR这些功能保持不变" ID="ff75fab6cb81d4234624f68c1a76cd4d" STYLE="fork"/>
              <node TEXT="从DMP创建的空间，产品，机器，是否可以正常进行发图收图，策略，标签，光学面配置等功能的正常使用" ID="c91c096eeea6ae7f9b0e655caf3944c0" STYLE="fork"/>
            </node>
            <node TEXT="项目标识" ID="4f040135a0de113e6fc6b6269bbfe926" STYLE="fork">
              <node TEXT="必填项" ID="edccbd0e90e245a2603163991f71da72" STYLE="fork"/>
              <node TEXT="仅支持英文、数字、中划线输入(原一休支持，中横杠和下划线，例：YiXiu4_11-BGHNDZ)" ID="730e763e06018b142065651452b95f4c" STYLE="fork"/>
              <node TEXT="标识唯一" ID="f4ec7a50e41a52b00ad5c0c02748626d" STYLE="fork"/>
              <node TEXT="长度32" ID="d6761a6cee88dd633d1b56e5996ddd0e" STYLE="fork"/>
            </node>
            <node TEXT="项目名称" ID="00651e0df43b9dc4b3ab8399fd59448a" STYLE="fork">
              <node TEXT="必填项" ID="f04f253c027aae44a639fca69dc92604" STYLE="fork"/>
              <node TEXT="仅支持英文、中文，数字、中/下划线输入" ID="4d075bb29920085ad9f89a8f9de3f5bf" STYLE="fork"/>
              <node TEXT="名称唯一" ID="6808768a9821d7fd360c6502f7bd8065" STYLE="fork"/>
              <node TEXT="长度32" ID="d6f2fa1b106fdf193655f7e39e88d9a3" STYLE="fork"/>
            </node>
            <node TEXT="项目类型" ID="d022e9428205eed0665d314a7bf73d8a" STYLE="fork">
              <node TEXT="质检(默认值)" ID="9f700cd9729356cfabca8d4a1cc80699" STYLE="fork"/>
              <node TEXT="操作" ID="776d96630737c49e800c751a433f8ea4" STYLE="fork"/>
              <node TEXT="打磨" ID="ba3c2a4a09c6d6c0c5aeccfef41382e1" STYLE="fork"/>
              <node TEXT="焊接" ID="139a1bd239da7a641e8a78bcb873f7fd" STYLE="fork"/>
              <node TEXT="必选项" ID="ad3c488e8f4d3ce4b25183d728e0091c" STYLE="fork"/>
              <node TEXT="当前只有质检，其他置灰" ID="4a17cf31f3aee3b78b4bea98aa8a6b7d" STYLE="fork"/>
            </node>
            <node TEXT="所属行业" ID="844a243f8bf5e295435343a9c3d521db" STYLE="fork">
              <node TEXT="3C电子" ID="808201341b2db9afc5afc6b3f44ee7d4" STYLE="fork"/>
              <node TEXT="汽车配件" ID="e4f58550ca0a0aabd126db47c552210e" STYLE="fork"/>
              <node TEXT="必选项" ID="1c1e721e7e665875c7efdb3639647308" STYLE="fork"/>
              <node TEXT="原型提供的行业字典链接不存在" ID="bd60ecdc9509e36bf3e08c202917e976" STYLE="fork"/>
            </node>
            <node TEXT="项目描述" ID="52aaa6faeaad2afd84180c33e7b9f0c4" STYLE="fork">
              <node TEXT="文案：请输入不超过250个字符" ID="0531f83c65e17751bc4182111df0a279" STYLE="fork"/>
              <node TEXT="字符无类型限制" ID="e5b8591acbdda351c5c55b2b7aaf1978" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="新增和编辑的幂等验证" ID="dde16867357b25bc0a20474b8918faa4" STYLE="fork"/>
        </node>
        <node TEXT="项目状态筛选框" ID="fe96eae1327f0fd46831e5bb8521e8fa" STYLE="fork">
          <node TEXT="全部状态（默认值）" ID="fd0d8892825298a2b2204e96970bfbc2" STYLE="fork"/>
          <node TEXT="进行中" ID="7978fb9a5a228ed98cc022a3940bcc45" STYLE="fork"/>
          <node TEXT="已结项" ID="2a4182f688e8eae8755b238789a01bef" STYLE="fork"/>
        </node>
        <node TEXT="项目类型筛选框" ID="0b620cb6d9e9beba771463dd62fae292" STYLE="fork">
          <node TEXT="全部类型（默认值）" ID="3a49f439da3b303665d6ba0b2657545c" STYLE="fork"/>
          <node TEXT="质检" ID="008ee378745600f7d033617dcce3aec8" STYLE="fork"/>
          <node TEXT="操作" ID="c7f90e003de822b33a14ff76ad189c44" STYLE="fork"/>
          <node TEXT="打磨" ID="8ff5c859446a200f81507e3e842ff45d" STYLE="fork"/>
          <node TEXT="焊接" ID="a5f09304e0a4154f86d885df33d32166" STYLE="fork"/>
          <node TEXT="当前只有质检，其他置灰" ID="4e8b0123e25b45b882074b82872efe0c" STYLE="fork"/>
        </node>
        <node TEXT="项目名称或者项目标识搜索框" ID="d9c248304a4a68eaffa6badd93047fb6" STYLE="fork">
          <node TEXT="搜索输入框" ID="fe34278ef9911734ba90bfcdcf892a6b" STYLE="fork">
            <node TEXT="根据标识和名称查询项目展示列表" ID="8eb4fb35bff7705b6a3c5e7026c5d176" STYLE="fork"/>
            <node TEXT="点击搜索icon触发查询" ID="e669af82d273eeea46d4751b7d57b640" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="列表页" ID="d4d5f93c94abfa326acd5c1bdb32cba6" STYLE="fork">
          <node TEXT="数据来源：会将一休云项目质检空间老数据刷到DMP" ID="126b89469c88f9ac06dc882c2c27c658" STYLE="fork"/>
          <node TEXT="排序根据创建时间倒序" ID="c2089082e826f636c62574fb880471a0" STYLE="fork"/>
          <node TEXT="项目详情" ID="03dc4e3955dc364be856e5552a8bb920" STYLE="fork">
            <node TEXT="项目标识" ID="46b282bfa5dd42abb1c7e50f5bf59446" STYLE="fork"/>
            <node TEXT="项目名称" ID="e69e28c0506f284df64e2d7ee2974702" STYLE="fork"/>
            <node TEXT="老的空间只有空间名称，同步过来之后，空间名称对应的是项目编码，项目名称自动同步一样的" ID="4a1c235988320f99af5fb53ff2ecd2a1" STYLE="fork"/>
            <node TEXT="项目类型" ID="749d216d9bcbd26b214d6bf3a944127d" STYLE="fork">
              <node TEXT="质检" ID="24c2a8d9606437f31345b7a672aae7cb" STYLE="fork">
                <node TEXT="蓝色" ID="d443aee9ad7f6ebb761b3be9007edce7" STYLE="fork"/>
              </node>
              <node TEXT="EIIR" ID="e87bd358e8c6c207fbda00a8aafde2dd" STYLE="fork">
                <node TEXT="暂无" ID="cfa992753f9b3b14e27ed3954b7f5a62" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="产品数量" ID="f5b8d5f06b98b494d31c58058a55d91d" STYLE="fork">
              <node TEXT="统计项目下的产品数量" ID="b4bf76c781fd1aa5f4d3cae817027ee7" STYLE="fork"/>
            </node>
            <node TEXT="设备数量" ID="62e38159c3674abaeccd4af7380b2e4d" STYLE="fork">
              <node TEXT="统计项目下的设备数量" ID="9f637808bf226aacad61c6db427a5bf4" STYLE="fork"/>
            </node>
            <node TEXT="成员数量" ID="f8b35676efba0a0e2f642b7e5e6adb68" STYLE="fork">
              <node TEXT="统计项目下的成员数量" ID="b05faed72608dc84470138fbd4614a7a" STYLE="fork"/>
            </node>
            <node TEXT="状态" ID="c93cc626435f9e4612137ebfd416973a" STYLE="fork">
              <node TEXT="进行中（绿色）" ID="c66e4e18a678378c50d30d8f0acd89fe" STYLE="fork"/>
              <node TEXT="已结项" ID="ed3d44bf0d33160fc69d340af2246f0c" STYLE="fork"/>
            </node>
            <node TEXT="具体设计根据UI" ID="a627428cbeeec67998fe73c324344c08" STYLE="fork"/>
          </node>
          <node TEXT="操作" ID="074e2b0970d44d84dbc50efa766feba0" STYLE="fork">
            <node TEXT="编辑" ID="ebcbf964ea1d431a409cc38d180a6970" STYLE="fork">
              <node TEXT="编辑项目空间弹框" ID="d3315bc978dcbca2c2c3807cab3de5f4" STYLE="fork">
                <node TEXT="项目标识" ID="e63788f7873bdf5a39a79cbe7d6fa52e" STYLE="fork">
                  <node TEXT="回显" ID="ed66b47f5073142c902c7110e72423a1" STYLE="fork"/>
                  <node TEXT="不可编辑" ID="52a2bba2e6e75f63ad8d3e6eb75497d8" STYLE="fork"/>
                </node>
                <node TEXT="项目名称" ID="5e49adfc3be4fc49d234f87c9625b468" STYLE="fork">
                  <node TEXT="回显" ID="a1743bab3b1773868e95f73cfaa88993" STYLE="fork"/>
                  <node TEXT="同新增校验" ID="1d4c56e90649251f5c8ee0f8d9552867" STYLE="fork"/>
                </node>
                <node TEXT="项目类型" ID="2be832f1786ce82b51f6863c138b789e" STYLE="fork">
                  <node TEXT="回显" ID="7435b479deae5e80564834b0f176f4df" STYLE="fork"/>
                  <node TEXT="质检(默认值)" ID="35ef415dc389a711bc092ed73c326afc" STYLE="fork"/>
                  <node TEXT="操作" ID="1ff26b4b72507f989a34a2d6f097f48b" STYLE="fork"/>
                  <node TEXT="打磨" ID="82883c4b01579dd4dc22238e82bd2701" STYLE="fork"/>
                  <node TEXT="焊接" ID="b08909610f82929809eadc9db68974c3" STYLE="fork"/>
                  <node TEXT="必选项" ID="8c3d86bf1785b737cafbc75496c87119" STYLE="fork"/>
                  <node TEXT="当前只有质检，其他置灰" ID="0b88e846bbb8c05ef72f960104702e86" STYLE="fork"/>
                </node>
                <node TEXT="所属行业" ID="6924099a7807bde20b32075bc8417bd5" STYLE="fork">
                  <node TEXT="回显" ID="7bc36776148e897455a40677ecb3a216" STYLE="fork"/>
                  <node TEXT="3C电子" ID="abd319149d94777ccd6ad74079a1f889" STYLE="fork"/>
                  <node TEXT="汽车配件" ID="3d800fc6ae2f990ca15829f46d01ef12" STYLE="fork"/>
                  <node TEXT="必选项" ID="f7a16651e7a0f0ffb98eb408a55d91ea" STYLE="fork"/>
                </node>
                <node TEXT="项目描述" ID="e411af40a42127f13eadd7b88e117d70" STYLE="fork">
                  <node TEXT="文案：请输入不超过250个字符" ID="87fcdc811ad001776856120c22be0da6" STYLE="fork"/>
                  <node TEXT="字符无类型限制" ID="bcabea2a33251c4da8ad6150ff7c1a8e" STYLE="fork"/>
                </node>
                <node TEXT="确定" ID="8083cd2a2e275a54002bb9b467cdcda6" STYLE="fork">
                  <node TEXT="同新增规则校验重名和必填项" ID="e946c744fcafd3cab7382f4ff2ca4bd4" STYLE="fork"/>
                </node>
                <node TEXT="取消" ID="61beba9cc8871cb1e3ea1fe5b5eecbfd" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="结项" ID="99a02db3fbfbaeec21aa5b9ecf97aead" STYLE="fork">
              <node TEXT="项目空间状态是已结项的置灰" ID="ce7d43b65876e805cbe8a0442542d4d0" STYLE="fork"/>
              <node TEXT="二次确认弹框" ID="4ccecef0721704577ddf929d29e2b13f" STYLE="fork"/>
            </node>
            <node TEXT="重启" ID="e57e6894b1edacd95a03a877e6a7d40a" STYLE="fork">
              <node TEXT="项目空间状态是进行中的置灰" ID="7d6ea3665dffdac9269617ad4f54d17a" STYLE="fork"/>
              <node TEXT="二次确认弹框" ID="d44cd757f74fe6589f0731a5cdfb46ea" STYLE="fork"/>
            </node>
            <node TEXT="进入项目" ID="cea4ff5199d49d7a165e3598a3f066fa" STYLE="fork">
              <node TEXT="点击进入项目详情→项目总览页面" ID="29e1892a19726be52308267cc32dc30f" STYLE="fork"/>
            </node>
          </node>
        </node>
      </node>
      <node TEXT="【进入项目】" ID="aec5e550557de9f3d6fa99eb32fe2596" STYLE="fork">
        <node TEXT="项目总览（徐锴）" ID="c9707410f60e61f81c7b0130d08efcb2" STYLE="fork">
          <node TEXT="项目列表" ID="55edcf909814b8631740d14d9cf615bb" STYLE="fork">
            <node TEXT="项目标识" ID="6b5abb19f9941b556e67a249ae7f6512" STYLE="fork"/>
            <node TEXT="项目类型" ID="401f50ba3282c4517d4ce6e5c88ba96c" STYLE="fork">
              <node TEXT="质检" ID="0308b74f916cf8da5a26764711f81b97" STYLE="fork"/>
              <node TEXT="操作" ID="3b885a9c89d5a72a00f79ff3a11b0d46" STYLE="fork"/>
              <node TEXT="焊接" ID="a18061d984d1c7ffef2cc9a74c792785" STYLE="fork"/>
              <node TEXT="打磨" ID="530ff314c6ccce105f4ce421cc28b921" STYLE="fork"/>
            </node>
            <node TEXT="项目状态" ID="1d6246d8044679d5475e4bb77d24e984" STYLE="fork">
              <node TEXT="进行中" ID="3f67a6a8fea2e21fa3956de6b4007417" STYLE="fork"/>
              <node TEXT="已结项" ID="531744522e53af9028f2a92100175613" STYLE="fork"/>
            </node>
            <node TEXT="创建时间" ID="429930e04db5e96416ea40edc52737bb" STYLE="fork"/>
            <node TEXT="交付组长" ID="5e0d2f323baabd91dec0b075777c7b3d" STYLE="fork">
              <node TEXT="在UUAM中配置的一休系统角色" ID="c5f7434b166c5b62976593d79d2f7030" STYLE="fork"/>
              <node TEXT="展示所有交付组长信息" ID="4a1be7afedafea68d8ea41a00bcf7b4f" STYLE="fork"/>
              <node TEXT="UUAM中新增后，当前页面刷新后会展示" ID="01c23edf397c2ea78d451abed5897c73" STYLE="fork">
                <node TEXT="fat环境需要uuam配置云舟系统角色才能在项目中添加对应成员" ID="4058f1dbea14a211c0400c28cf8221ce" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="算法主管" ID="cf893273d02deb54323174e28c8099cb" STYLE="fork">
              <node TEXT="在UUAM中配置的一休系统角色" ID="19171eccd18bcee84372ecf8f5a0bab2" STYLE="fork"/>
              <node TEXT="展示所有算法主管信息" ID="bd61baeb9e0d7e9ab18601b5ca853fe8" STYLE="fork"/>
              <node TEXT="UUAM中新增后，当前页面刷新后会展示" ID="a02b971a16db8c9c750bd12eb80e8926" STYLE="fork">
                <node TEXT="fat环境需要uuam配置云舟系统角色才能在项目中添加对应成员" ID="ef52e35f3d2bcdb984287a9295bd5f1a" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="成员数量" ID="921eb64ae0ec7dd1fc953e93120fa654" STYLE="fork"/>
          </node>
          <node TEXT="产品数量" ID="19c997de89b178a1393a7494bb41857f" STYLE="fork">
            <node TEXT="交互按钮“前往一休云”" ID="1e13c7b07e69a5a1cf50fd1816e0d4db" STYLE="fork">
              <node TEXT="获取当前dmp登录人员bearer token自动登录？" ID="c3f5e5d830d4f1ff866862fc5febf376" STYLE="fork">
                <node TEXT="统一跳项目空间列表" ID="a0ccc369b1142cfe30c9549747e29a01" STYLE="fork"/>
              </node>
              <node TEXT="该账号无一休系统权限" ID="0f820e657032a4766d4807d05bab1134" STYLE="fork">
                <node TEXT="提示无权限，跳转登录页" ID="2a964954452e4c8e29a9c85775b43468" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="机器数量" ID="afb5a62870530cdcb9195ef8d7914292" STYLE="fork"/>
          <node TEXT="产品维度数据" ID="0300df04d6b151c8971ded94dffea2d4" STYLE="fork">
            <node TEXT="产品选择框" ID="fc55a1077c68b5b2f3e9b82a8b09a0eb" STYLE="fork">
              <node TEXT="默认值“全部”" ID="29b9dff93f49c1d73c05bb09470db690" STYLE="fork"/>
              <node TEXT="单选产品" ID="11454946259c755e2fbf23fa24710c62" STYLE="fork"/>
              <node TEXT="输入筛选功能" ID="b4aebd72b57b1437a83b5fc393b76cd4" STYLE="fork"/>
            </node>
            <node TEXT="标准数据集样本总量" ID="3ca64ecc2838ee385bf37cb09e19921e" STYLE="fork">
              <node TEXT="一休获取" ID="1b625ff065b6bebdd41eb3dfc607e89c" STYLE="fork"/>
            </node>
            <node TEXT="bash数据集样本总量" ID="c888b8eaa051a9c1e0bbf7d1e30d992d" STYLE="fork">
              <node TEXT="一休获取" ID="198cb4564df8177906b907c7c32a51b5" STYLE="fork"/>
            </node>
            <node TEXT="模型版本数量" ID="215689b455033500198857c7ff44bee9" STYLE="fork">
              <node TEXT="一休获取" ID="f155d4548c9aba4d97ceb32b51620bdc" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="机器维度数据" ID="fd14e591235ba4bb606b41b2ff15ea13" STYLE="fork">
            <node TEXT="机器选择框" ID="9ea0187c2762e32c871829c89232ff65" STYLE="fork">
              <node TEXT="默认值“全部”" ID="a0f33b03671a99950e9e729d1d4f01ab" STYLE="fork"/>
              <node TEXT="单选机器" ID="417fb98242a2c679addb811fe4666b59" STYLE="fork"/>
              <node TEXT="输入筛选功能" ID="7a27100020a39a3b6ef8dc751c8b85ad" STYLE="fork"/>
            </node>
            <node TEXT="已完成机电方案数量" ID="e801a4054d9875fe6c12f9510458a849" STYLE="fork">
              <node TEXT="ST获取" ID="49ac5943d219ce2d7158a8777777f32c" STYLE="fork"/>
            </node>
            <node TEXT="已完成光学方案数量" ID="3233b385091b29eb504f995b44f557d7" STYLE="fork">
              <node TEXT="ST获取" ID="a868c83b98245fa75c6e2618b6c1e9f4" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="产品管理（中婷）" ID="f46b28ad5664449cb5e9862144fa60c8" STYLE="fork">
          <node TEXT="【添加产品】" ID="e12dba56aefda2f199c8a417e6dbf334" STYLE="fork">
            <node TEXT="产品标识" ID="932de5d26bc0f43dbfaf26ba1a8fd571" STYLE="fork">
              <node TEXT="对应一休的产品编号、名称" ID="17fc9ed610e26ec0b8fb76c6fcf7b2a8" STYLE="fork"/>
              <node TEXT="英文字母、数字、_" ID="ec854fa320ade04691ce240f9f092a90" STYLE="fork"/>
              <node TEXT="长度限制32位" ID="b0b84b9a4e7e03d30f84315f9537f5ff" STYLE="fork"/>
              <node TEXT="必填" ID="889b88a80e6725cf8e87e55b58c8f555" STYLE="fork"/>
              <node TEXT="不允许重复" ID="6d290ccc1e2a19131b8658fbf6b351b2" STYLE="fork"/>
            </node>
            <node TEXT="产品名称" ID="b9942efdfbd4583c607de8d22355063d" STYLE="fork">
              <node TEXT="对应一休的产品显示名称" ID="59eebe86f61682f706f81b7c3a398923" STYLE="fork"/>
              <node TEXT="中英文字母、数字、_" ID="cf5f337e46252121813cfd1bc02ededf" STYLE="fork"/>
              <node TEXT="长度限制32位" ID="e5ff2a0492b4f8724d9f5fc7230ce508" STYLE="fork"/>
              <node TEXT="必填" ID="d7a1e02d329db2a06c9df3b7eed22fa7" STYLE="fork"/>
              <node TEXT="不允许重复" ID="69a7c74264e42f6faee264f2e4aa18b9" STYLE="fork"/>
            </node>
            <node TEXT="【确定】" ID="c32a4af5daa6d371531e9bc595a9822e" STYLE="fork">
              <node TEXT="校验字段限制" ID="c0234bbf9b6033c9cc5a6a33717326f5" STYLE="fork"/>
              <node TEXT="保存成功，列表对应展示，数据来源为：云" ID="28438a1fd090176f977983b7a05c5042" STYLE="fork"/>
              <node TEXT="新增成功会将数据同步到：一休云（智检精灵获取一休的产品）、数据资产（st、EIIR获取数资的产品)" ID="bd06f457ff82840f6bad527a6e5c92b8" STYLE="fork"/>
            </node>
            <node TEXT="【取消】" ID="2ab1ad6ee18bd567cbf6d3d8aaeaf235" STYLE="fork"/>
          </node>
          <node TEXT="搜索" ID="d7273ca4bd958e7ffaaa7584ba601502" STYLE="fork">
            <node TEXT="创建来源" ID="105f221efe12bc8aee00a78508f940b0" STYLE="fork">
              <node TEXT="下拉选" ID="71524abac5bbe871e94aa33ca530c496" STYLE="fork">
                <node TEXT="全部" ID="c8fbd2a71658e0708ac245c1ab70449a" STYLE="fork">
                  <node TEXT="默认" ID="ae900658041ea7d3ccc135a4bf3edb78" STYLE="fork"/>
                </node>
                <node TEXT="云" ID="4e3b32dee1f03dcf200d4e82ec89f2b0" STYLE="fork"/>
                <node TEXT="本地" ID="00883612c4b2fa3ea6dc6ee2dfa4b8f5" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="名称或标识" ID="c2c3d91fa53f84c8064a8716243dc595" STYLE="fork">
              <node TEXT="模糊搜索" ID="2db8b6fcb7918f2e5da12b19242c0e28" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="列表" ID="09e5298cf5f234868a549c5e3a6544f0" STYLE="fork">
            <node TEXT="产品标识" ID="9eb34fc3e99be25348f3ea818020c2bc" STYLE="fork"/>
            <node TEXT="产品名称" ID="fc91506ef1d6a5cea13e6e4a0683d342" STYLE="fork"/>
            <node TEXT="创建来源" ID="a8c70068b4496fcd5e7901ac6efa3e09" STYLE="fork">
              <node TEXT="通过项目交付系统创建的为：云" ID="15f38d06d8a2a47131c4cfd88575a57a" STYLE="fork"/>
              <node TEXT="通过智检精灵创建的为：本地" ID="963deac27e9a9f8e10498fef631a7def" STYLE="fork"/>
              <node TEXT="一休云创建的为：云" ID="abf79012678ac994a2377de60e1c2099" STYLE="fork">
                <node TEXT="历史数据需要全部同步过来" ID="e3af9abf80252663cc29effd8f19fb04" STYLE="fork"/>
                <node TEXT="后续一休中仅作展示,不可新增、编辑、删除（v6.1）" ID="3d317252c01b15459cf0c27cb361835b" STYLE="fork"/>
                <node TEXT="一休中保留产品相关指标、策略、标签配置" ID="376a4f302e2fdaaff6eaa3ccb18325fe" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="原始标准样本总量" ID="75a7328c28246171fe5dd5030b07141c" STYLE="fork">
              <node TEXT="一休云该产品下原始标准样本数量" ID="6ce5e09485c2a165020b9d0275315598" STYLE="fork"/>
            </node>
            <node TEXT="原始bash样本总量" ID="7f8692f3de271be4156ac68e7d7bd048" STYLE="fork">
              <node TEXT="一休云该产品下原始bash样本数量" ID="32e7443113484cd68565bae91d600bb6" STYLE="fork"/>
            </node>
            <node TEXT="标准数据集样本总量" ID="a15caf521414eee7cbf47a91a4721d42" STYLE="fork">
              <node TEXT="一休云该产品下标准数据集样本数量" ID="fe64062e54c0f26f2b68004654007faf" STYLE="fork"/>
            </node>
            <node TEXT="bash数据集样本总量" ID="c156700a796b3fe81bdbb25c02f69885" STYLE="fork">
              <node TEXT="一休云该产品下bash数据集样本数量" ID="9ca52d9d5f81bb8e8f4ea391dd049095" STYLE="fork"/>
            </node>
            <node TEXT="模型版本数量" ID="12df3f4c633ebc5e57e1e316396fa575" STYLE="fork">
              <node TEXT="一休云该产品下深度模型数量" ID="dc9dbff87f379468432848f520f59812" STYLE="fork"/>
            </node>
            <node TEXT="【编辑】" ID="fd8c13307acf39815fca97e191017ed3" STYLE="fork">
              <node TEXT="产品标识" ID="4e28bb8278af9d657af92dff6cfcba3e" STYLE="fork">
                <node TEXT="不可修改" ID="d0d74cf35e5fd45cc841fe1aed34c9ab" STYLE="fork"/>
              </node>
              <node TEXT="产品名称" ID="8c043944bb8208bab600253827172e72" STYLE="fork">
                <node TEXT="必填" ID="1692fd675be1628e5de3a1fe68348efa" STYLE="fork"/>
                <node TEXT="中英文字母、数字、_" ID="2bc767b98ed4d21538f9f71d3c338e68" STYLE="fork"/>
                <node TEXT="长度限制32位" ID="de0ba21235be9b8c2c656897e135695e" STYLE="fork"/>
                <node TEXT="不允许重复" ID="5f780ad4c8ae0b94acbbce10a85af8bf" STYLE="fork"/>
              </node>
              <node TEXT="【确认】" ID="2804b9782232262deac932a35aeca1d6" STYLE="fork">
                <node TEXT="修改后将数据同步到：一休云（智检精灵获取一休的产品）、数据资产（st、EIIR获取数资的产品)" ID="598286aea785e4b79c2fe46ab1623608" STYLE="fork"/>
              </node>
              <node TEXT="【取消】" ID="2320b04252a1c0c912f49561ef61ad78" STYLE="fork"/>
            </node>
            <node TEXT="【删除】" ID="19b3cea9da311e574248a23eb7eedc26" STYLE="fork">
              <node TEXT="二次确认：你确定要删除该产品吗？" ID="78c89baa5f032f38e30d920aa793cb48" STYLE="fork"/>
              <node TEXT="当该产品已有数据后，删除按钮不展示" ID="23dacb53af35c48faf61c5a10a79b2df" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="机器管理（徐锴/中婷）" ID="1958795e0f23777980f14d9e2448663b" STYLE="fork">
          <node TEXT="`添加机器`按钮" ID="7cca8334e7bd698faab0ef87ee71a8f6" STYLE="fork">
            <node TEXT="`添加机器`弹窗" ID="63ceba1cf450aeee47c68832e8902e37" STYLE="fork">
              <node TEXT="`可选机器`下拉框" ID="ad1b3c934839e88a45c7cd8a24f18042" STYLE="fork">
                <node TEXT="获取数资系统无项目归属的机器列表" ID="31051e536896b5dcfdac4f5554e83e15" STYLE="fork"/>
                <node TEXT="有项目归属的机器不展示" ID="a99cb225191917f1205c83edba46d2a4" STYLE="fork"/>
              </node>
              <node TEXT="`取消`按钮" ID="eb36dfe154ba9adbbedfca47114a664d" STYLE="fork">
                <node TEXT="取消后不会进行机器添加" ID="d905c34fedaba415947b93e06669e525" STYLE="fork"/>
              </node>
              <node TEXT="`确认`按钮" ID="e706778fb616df6409d92381e1c8fd27" STYLE="fork">
                <node TEXT="对应机器与当前项目关联" ID="ee6ca7663e9d1fa58e9e4f6101296834" STYLE="fork">
                  <node TEXT="添加机器后，重新点击`添加机器`按钮，刚添加的机器不展示" ID="edf5fdf44bd66585eba44404b8f0761b" STYLE="fork"/>
                </node>
                <node TEXT="幂等验证" ID="a88e123f001bb39133e7600dabec5c50" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="机器列表" ID="36b834ebed0e6de5d1a42b54286ace9a" STYLE="fork">
            <node TEXT="数据由数资系统获取" ID="cbef1eff0323a5b539af5cf9ad87e700" STYLE="fork"/>
            <node TEXT="机器名称" ID="f4068e16a0e44d9508bc46f6dbdba871" STYLE="fork">
              <node TEXT="与`一休`一致" ID="564c7543b907d415a47fdc1ddfd0b3fe" STYLE="fork"/>
            </node>
            <node TEXT="机器SN" ID="199f0b423b943dfbb0cef557bc9b6cc0" STYLE="fork">
              <node TEXT="与`一休`一致" ID="b6e9ae5f6e3f70df9255b9d6e876ae39" STYLE="fork"/>
            </node>
            <node TEXT="机器ID" ID="c0ac468d68d10db27cb2f5f8c769cfa3" STYLE="fork">
              <node TEXT="与`一休`一致" ID="d6a01e020b6316dde2830d1dde49b3ce" STYLE="fork"/>
            </node>
            <node TEXT="机器型号" ID="62ef60936b5b80049a359c96e6a91d2f" STYLE="fork">
              <node TEXT="与`一休`一致" ID="c0f438c2c8dcb5a1c39c826b17162284" STYLE="fork"/>
            </node>
            <node TEXT="创建时间" ID="ad6ea21c7f9b14ec8f733814e14f505f" STYLE="fork">
              <node TEXT="与`一休`一致" ID="b5a8e14f42c3028a91503f0ff118654e" STYLE="fork"/>
            </node>
            <node TEXT="操作" ID="8971aca1105e214c7886974636de1eee" STYLE="fork">
              <node TEXT="下载token" ID="8f4ac849da47362767aff2767078ffcb" STYLE="fork">
                <node TEXT="同一台机器下载的mqtt账号密码及token每次下载都保持一致" ID="04279393b4e017a4d74433cd1c805b8c" STYLE="fork"/>
                <node TEXT="不同机器的mqtt账号密码及token不一致" ID="c0493f937d80ed3926810ff4050890ca" STYLE="fork"/>
                <node TEXT="同一台机器下载的mqtt账号密码及token与在一休上下载的保持一致" ID="2db7e8d20209ebc24c5d20f1a5eb08cb" STYLE="fork"/>
              </node>
              <node TEXT="移除机器" ID="76a9b0967a7304b25a3cf64dc481845b" STYLE="fork">
                <node TEXT="取消与项目绑定" ID="c2642d7d8faa282a4d402bf26e122412" STYLE="fork"/>
                <node TEXT="移除后，可以重新添加" ID="319cf6acdab7503526acc05af6c043a7" STYLE="fork"/>
              </node>
            </node>
          </node>
        </node>
        <node TEXT="成员管理（林禹成）" ID="8f3715ba650f667e781f12e9a65be9bd" STYLE="fork">
          <node TEXT="一休云系统对应调整" ID="a08a5c19cea1d2adb81affb246e38218" STYLE="fork">
            <node TEXT="空间管理-【成员管理】按钮删除" ID="838610ddb78aa581286d821df039f992" STYLE="fork"/>
          </node>
          <node TEXT="初始化数据" ID="ae53e88cbdea7ea0a1c55edb00d2e2ab" STYLE="fork">
            <node TEXT="将所有空间的对应用户初始化正确，提前截图，用于测试" ID="350a6fa0cf9f50a4df75855443471dea" STYLE="fork"/>
          </node>
          <node TEXT="【添加成员】" ID="dd286817a78a3bdfd2c5abc473b895e0" STYLE="fork">
            <node TEXT="数据来源：调用pms系统uuam用户接口" ID="87326c9ca34a6746204ed2fd23b65d37" STYLE="fork"/>
            <node TEXT="*人员姓名" ID="a73f455cfa50cf6a4610454fcb65ab03" STYLE="fork">
              <node TEXT="点击下拉框显示所有pms系统的用户" ID="2cf47aca21b409ab5e7d45d5ee5e7d46" STYLE="fork">
                <node TEXT="不显示列表页已添加的用户" ID="7690fbf280767fb1fc9c909d5eab66f6" STYLE="fork"/>
              </node>
              <node TEXT="可输入搜索用户" ID="f6e7647973ab5c208f6cb1936d5e88a1" STYLE="fork">
                <node TEXT="不显示列表页已添加的用户" ID="190e826bb1ccf1d804e5cfa3bfea328b" STYLE="fork"/>
              </node>
              <node TEXT="可多选" ID="3be67f1b3ba681d5ab5f3ec6ef201880" STYLE="fork"/>
            </node>
            <node TEXT="【取消】" ID="4202dff90cdef77e58633e8e1479a0dc" STYLE="fork">
              <node TEXT="关闭弹窗，不添加用户" ID="b29e1d3ecb2d53e663cd4c019254b119" STYLE="fork"/>
            </node>
            <node TEXT="【确认】" ID="8d33f70bfb29c6efd400fb00f0ba1f93" STYLE="fork">
              <node TEXT="成功添加用户，显示于列表页" ID="2af7711a8d805643cfdf0918554d7f92" STYLE="fork"/>
              <node TEXT="已添加的用户，在一休云系统可以看到对应的项目空间" ID="4e7f37546ec78b895ec504f38924d549" STYLE="fork"/>
              <node TEXT="幂等" ID="1da5f34b4b568df2b12c67c5c7ce5ece" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="列表页" ID="d4503adcd92f3b7da6268623348d752c" STYLE="fork">
            <node TEXT="成员" ID="2770def038305d15de442d3a18256507" STYLE="fork">
              <node TEXT="显示已添加的用户名称" ID="527181bd5ec530ac57e31e1cf4be658e" STYLE="fork"/>
              <node TEXT="离职员工自动移除" ID="1341be1752bfce184d83bbea68ed3889" STYLE="fork"/>
            </node>
            <node TEXT="系统角色" ID="695a035017d0140a0f9f2bd1ef520757" STYLE="fork">
              <node TEXT="显示已添加的用户在一休云系统中的角色" ID="40f3c94d075762fb158d2d28f1d92918" STYLE="fork"/>
              <node TEXT="显示已添加的用户在ST系统中的角色" ID="b0436fb3c14a907db7d1efaf3353fb82" STYLE="fork"/>
              <node TEXT="可能为空" ID="fa6fe6fd1b4951af153ec43b95e147cb" STYLE="fork"/>
            </node>
            <node TEXT="操作" ID="04bf93c07e80f645877d0bacdef4318f" STYLE="fork">
              <node TEXT="【移除】" ID="a35a06a654762f1914feb3412da17ee9" STYLE="fork">
                <node TEXT="点击弹出“二次确认”弹框" ID="c6b4ee3bebaa30f22e661c46ef7a22bb" STYLE="fork">
                  <node TEXT="你确定要从项目中移除该人员吗？" ID="a73f23533a7b9a59f5c558238063044f" STYLE="fork"/>
                  <node TEXT="【×】" ID="bb4c7fbd05edee29657f208b38193297" STYLE="fork">
                    <node TEXT="关闭弹框，不移除人员" ID="f4942460f1308233fd7d0ff794fb1d2a" STYLE="fork"/>
                  </node>
                  <node TEXT="【确认】" ID="c2a74f9d89eb5955d70048bf12d0f373" STYLE="fork">
                    <node TEXT="移除对应的人员，该用户在一休云系统中看不到对应的项目空间" ID="118eac961bb10ad34f95451a8d8685a9" STYLE="fork"/>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</map>