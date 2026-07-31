
<map>
  <node ID="root" TEXT="V1.0">
    <node TEXT="用户管理（封伟）" ID="bfdb838a517c455e4d7199b3b84c9c12" STYLE="bubble" POSITION="right">
      <node TEXT="查询" ID="45bab3d62268b18d6c7be7014c9c9ccd" STYLE="fork">
        <node TEXT="账号/姓名/手机号，模糊搜索" ID="d42908606e0e9e7a30885fb369f43e13" STYLE="fork">
          <node TEXT="删除文案中的手机号" ID="6e8ced6dcb53200b1a83d73e116f4897" STYLE="fork"/>
        </node>
        <node TEXT="【查询】" ID="47a520aca9ae402574f538f232ecc8c4" STYLE="fork"/>
        <node TEXT="【重置】" ID="d7472472b5816e012fe2fd7c49703416" STYLE="fork">
          <node TEXT="回到默认为空进行查询" ID="308148b8cae028cec59beff3e5fe8025" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="【新建用户】" ID="d1f427bfb3212ae8938d71241492d9bd" STYLE="fork">
        <node TEXT="*账号" ID="6f69df3248f70242213122986c126f05" STYLE="fork">
          <node TEXT="必填项" ID="1772d00e19e181d3d824fd66648a5f5f" STYLE="fork"/>
          <node TEXT="限制：" ID="9b28dd278b9a1c8f6645c44baac3fd50" STYLE="fork">
            <node TEXT="长度 [3,32]" ID="7ba4342d8faa21ed7fc5f2935ad1e82c" STYLE="fork"/>
            <node TEXT="仅支持英文字母、数字、_" ID="d26af89bcc23767495104c307cee8bf3" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="*姓名" ID="fd2ead74c4eb28f1ab2d7a46512316c6" STYLE="fork">
          <node TEXT="必填项" ID="ae671c7daa8680ecde1508c864cbeccf" STYLE="fork"/>
          <node TEXT="限制：" ID="cc6c2d1c19231cb06be3bf2462ffc991" STYLE="fork">
            <node TEXT="长度 [1,16]" ID="06bcdd7d9c6998c653de603beccbf6d7" STYLE="fork"/>
            <node TEXT="仅支持中英文字母、数字" ID="d839d31ba34ace9e4d30aaa599161d9b" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="*角色" ID="203eb8ce2b5fb1c6f3368ebcdc9e6199" STYLE="fork">
          <node TEXT="管理员" ID="2bebb7eb369e0464f177dc070de687d9" STYLE="fork"/>
          <node TEXT="算法工程师" ID="ba934797e5a52e31e6d7aa6b69b14634" STYLE="fork"/>
          <node TEXT="采集工程师" ID="04cec9c3c3eb0ce04499e81c27166d30" STYLE="fork"/>
          <node TEXT="标注工程师" ID="7e9b897d4b6dc05e89d074b7d5bbc3be" STYLE="fork"/>
          <node TEXT="质检工程师" ID="f4688d59207c907796634d499b7c574c" STYLE="fork"/>
        </node>
        <node TEXT="手机号" ID="362deb87706c49dc2edc21a970a02fbc" STYLE="fork">
          <node TEXT="建议删除" ID="89cc2348051b3538190d95d4c705e252" STYLE="fork"/>
        </node>
        <node TEXT="*初始密码" ID="77829aec340060a5fb8c66d7bc0e4871" STYLE="fork">
          <node TEXT="必填项" ID="a1ba1f671f8a3d13e110c36f57fc9a23" STYLE="fork"/>
          <node TEXT="默认：123456" ID="f46b4f87fa0ae850b2bff0b216c21a8b" STYLE="fork"/>
          <node TEXT="可自行修改，限制：" ID="6029455fd94c768f10f5eb0d14a803a5" STYLE="fork">
            <node TEXT="长度 [6,32]" ID="bad368b54ce111b9ed691977c8afdb72" STYLE="fork"/>
            <node TEXT="仅支持英文字母、数字" ID="e0c12da16a9d251ba7635b8dd86b775e" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="【取消】" ID="cfd9f6527ad0665d8597d30422286a67" STYLE="fork">
          <node TEXT="关闭弹框不保存" ID="8e0d04abeb1ab8fc79997c9b8014e3a6" STYLE="fork"/>
        </node>
        <node TEXT="【保存】" ID="906aa165273ba79fb7db32ee68c35590" STYLE="fork">
          <node TEXT="校验" ID="a671ea25a5f0505e40e9921a6aef1180" STYLE="fork">
            <node TEXT="必填项校验" ID="312cd3b8f0557ba8199c2d2b6da4e5e1" STYLE="fork"/>
            <node TEXT="幂等校验" ID="5b0439c01c96eafb7920c4cee7b92a13" STYLE="fork">
              <node TEXT="做并发" ID="795f2e8bac608b633ffd6da610b68fbe" STYLE="fork"/>
            </node>
            <node TEXT="账号唯一性校验" ID="4a3ea8b89bf6753bc5c380c5fbb7d152" STYLE="fork">
              <node TEXT="提示：“该账号已存在”" ID="d0c633906be4258b604beca0143fe960" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="提示：“创建成功”" ID="8468ecc1c187282a8259fbda894051d1" STYLE="fork">
            <node TEXT="列表页最上方显示刚创建的用户信息" ID="4ed1b2ce70922f5fb58bf85105b49a7e" STYLE="fork"/>
          </node>
        </node>
      </node>
      <node TEXT="列表页" ID="f2f88e611ef365fc2ad8ef3ad2634701" STYLE="fork">
        <node TEXT="账号" ID="9666d4271ef0e9e3484d73b5be723fcf" STYLE="fork">
          <node TEXT="新增时填写的账号" ID="e24cfcd578f2d83261939738c2defd16" STYLE="fork"/>
        </node>
        <node TEXT="姓名" ID="550bcfc67dbeee5e235cf96112f2c866" STYLE="fork">
          <node TEXT="新增时填写的姓名" ID="c199ac1425b6b5ad481714dcacaa3a5c" STYLE="fork"/>
        </node>
        <node TEXT="角色" ID="08509a360461626104d45a84fbf32d23" STYLE="fork">
          <node TEXT="新增时选择的所有角色" ID="07043ba066862d57b7293eeeb3b86687" STYLE="fork"/>
        </node>
        <node TEXT="状态" ID="d58e0121fc8885b0a003b6933b386553" STYLE="fork">
          <node TEXT="启用" ID="a19f00454047f4cef34ff6d4d26078e5" STYLE="fork"/>
          <node TEXT="禁用" ID="8a3f92248d7ed039ff491f687580f763" STYLE="fork"/>
        </node>
        <node TEXT="初始密码" ID="89cdbda5990c71eb02cf6430eff0dbcb" STYLE="fork">
          <node TEXT="建议删除" ID="db104aab6e80c1cff8489ac615ec34d0" STYLE="fork"/>
        </node>
        <node TEXT="创建时间" ID="3f8880220b55edfb1fbd5b60313e805a" STYLE="fork">
          <node TEXT="建议展示：年月日 时分秒" ID="02a4894dd599cf312234b09d72b3aff4" STYLE="fork"/>
        </node>
        <node TEXT="操作" ID="676be76e87406ed02ecdbcfd4fbe1455" STYLE="fork">
          <node TEXT="【编辑】" ID="93a2780ae21a44147a66640cdcdb0f22" STYLE="fork">
            <node TEXT="账号" ID="5449f7338123dfae29cc8ffa2133df6e" STYLE="fork">
              <node TEXT="回显置灰，不允许修改" ID="dc5a693aa45f8e0b76023d861025b574" STYLE="fork"/>
            </node>
            <node TEXT="姓名" ID="c46e0c7184c21b30f18ad187f40c9996" STYLE="fork">
              <node TEXT="回显，可修改" ID="01ffc022c0c1a6560dc34082ed04a225" STYLE="fork"/>
            </node>
            <node TEXT="角色" ID="70a50ab4c2d4830974017c76ced37e37" STYLE="fork">
              <node TEXT="回显，可修改" ID="b8a9c570810d8bb20898187ff49ce516" STYLE="fork"/>
            </node>
            <node TEXT="手机号" ID="6cdb1d08e3e8279c45935dcbe1a5bc4c" STYLE="fork">
              <node TEXT="建议删除" ID="87edc63333300151ab2eb1c8e56aff34" STYLE="fork"/>
            </node>
            <node TEXT="【取消】" ID="63034800394f05cd66c93d8c12ae2b5e" STYLE="fork">
              <node TEXT="关闭弹框，不保存" ID="4c46bd00727109634d4911a4c5a311e2" STYLE="fork"/>
            </node>
            <node TEXT="【保存】" ID="ef2ed33532966a3599983871d7cb4e3d" STYLE="fork">
              <node TEXT="校验" ID="edf89cc88fb920dc0a1b7dbccd6a3cf7" STYLE="fork">
                <node TEXT="必填项" ID="1ad8b838999be0881f9515982fc41872" STYLE="fork"/>
              </node>
              <node TEXT="角色修改后" ID="87636f52ef58b131a7bc108f45828359" STYLE="fork">
                <node TEXT="未登录状态" ID="008d9bef6eece4e65c6850b08f7dfe30" STYLE="fork">
                  <node TEXT="登录后展示修改后角色对应的模块" ID="2cda98de5fa73adb05622344e3297aba" STYLE="fork"/>
                </node>
                <node TEXT="已登录状态" ID="5472311955bcff49e6e5721d22f17171" STYLE="fork">
                  <node TEXT="不影响使用，退出后重新登录，展示修改后角色对应的模块" ID="2b9058697dae62b6eaab0b5dcfc7c47a" STYLE="fork"/>
                </node>
              </node>
              <node TEXT="姓名修改后" ID="ef49afea548add3e8176f6fcf1d94d41" STYLE="fork">
                <node TEXT="页面右上角会变更为修改后的姓名" ID="aa63cfe00a0c54e1d0cacafc0e4e7453" STYLE="fork"/>
                <node TEXT="之前被指派的任务，人员姓名会随之变更" ID="cb2a9eec5f64a0253676adb2f2fe7dd5" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="【重置密码】" ID="d4237f05149c53bd32a2333d7d1cac36" STYLE="fork">
            <node TEXT="二次确认" ID="9ea1900b17e482555379b0b975a07fff" STYLE="fork">
              <node TEXT="确定重置 [账号] 的密码吗？" ID="262df93391e8ce3fe154ee733523659b" STYLE="fork">
                <node TEXT="【取消】" ID="60c4e7ed007485ed990456aca322e1b0" STYLE="fork">
                  <node TEXT="关闭弹窗" ID="d4ed6b179bbe12c9d3807f18819067ef" STYLE="fork"/>
                </node>
                <node TEXT="【确定】" ID="cedded67fcf67a3fb83058bf1f3d0e37" STYLE="fork">
                  <node TEXT="该账号的密码重置为123456" ID="f99209c885e8113f9d18bd35cbd46438" STYLE="fork"/>
                  <node TEXT="已登录的用户不影响使用" ID="31a84b006203dc8a865e38c92b28bb26" STYLE="fork"/>
                </node>
              </node>
            </node>
          </node>
          <node TEXT="【启用】/【禁用】" ID="b8cbdc6c67d9348a0364f13ab1af461a" STYLE="fork">
            <node TEXT="点击启用，账号状态为“启用”，可以正常登录使用" ID="5545416dc434b43fc3300de992cccc98" STYLE="fork"/>
            <node TEXT="点击禁用，账号状态为“禁用”" ID="05b3b1233de33fc2c4b9dc900b79166b" STYLE="fork">
              <node TEXT="未登录状态" ID="c7255f48811f0d93c0e499d6c02feaa6" STYLE="fork">
                <node TEXT="提示：“账号或密码错误，或账号已被禁用”" ID="f12f9aed120ef2a0bca7ed6ad214cd75" STYLE="fork"/>
              </node>
              <node TEXT="已登录状态" ID="ef2d61ba4b2fb4840cc09da11afe333c" STYLE="fork">
                <node TEXT="调用接口时，提示：“操作人不存在或已禁用”" ID="e3c9288744b3ced86a8bd4244e277367" STYLE="fork"/>
              </node>
              <node TEXT="指派时，下拉不展示禁用的用户" ID="67d5b71701558132662e3dc81583b977" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="【删除】" ID="9c5e4f5d1259de686eb60209b80faa21" STYLE="fork">
            <node TEXT="二次确认" ID="fcaf4dc2a23e0ac0fb8a640355db0644" STYLE="fork">
              <node TEXT="确定删除 [账号] 吗？" ID="2d9ffa528dfdd073e4f691c7fd6f8423" STYLE="fork">
                <node TEXT="【取消】" ID="6415e1390cf181bc150bc8857c7563ba" STYLE="fork">
                  <node TEXT="关闭弹窗" ID="ee045a42612923e6975d5d8e702eef0c" STYLE="fork"/>
                </node>
                <node TEXT="【确定】" ID="1b06b9c06d506b14e794e3184b354add" STYLE="fork">
                  <node TEXT="提示：“删除成功”" ID="7e652921d6d3d93fd83b516cf7d6565c" STYLE="fork"/>
                  <node TEXT="校验" ID="ae49bb056462e07f5ab92871cf3bf409" STYLE="fork">
                    <node TEXT="已被指派任务的账号，不允许删除" ID="6beaadf1db6df07d7ecf91eaf6d15d9d" STYLE="fork">
                      <node TEXT="提示：“该账号已被指派任务，不允许删除”" ID="9d7c9151fdbbd5fedb471ecdb0642b21" STYLE="fork"/>
                    </node>
                    <node TEXT="未登录状态" ID="690508a74cce1dd745060c63d767f1a3" STYLE="fork">
                      <node TEXT="提示：“账号或密码错误，或账号已被禁用”" ID="8cd504783db006d842d50fa91adcc253" STYLE="fork"/>
                    </node>
                    <node TEXT="已登录状态" ID="38d90862a5fe766a3462773654da044e" STYLE="fork">
                      <node TEXT="调用接口时，提示：“操作人不存在或已禁用”" ID="69b1107335fd61b674ff7f9d29dffd2d" STYLE="fork"/>
                    </node>
                    <node TEXT="指派时，下拉不展示已删除的用户" ID="1f9501a847b6753eabde0604e073478f" STYLE="fork"/>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node TEXT="排序" ID="22014c5ba15ce2b0b999417744a5b2a7" STYLE="fork">
          <node TEXT="创建时间倒序" ID="afd40be014238e73b744b76060392567" STYLE="fork"/>
        </node>
      </node>
    </node>
    <node TEXT="角色管理（封伟）" ID="adc190120fc80a8d2c501439467597ce" STYLE="bubble" POSITION="right">
      <node TEXT="查询" ID="7c36245e90e105cd16e701fdfec5382c" STYLE="fork">
        <node TEXT="角色编码/名称/描述，模糊搜索" ID="bfc3d7748bd398e6a5fdb144b1f9dfdb" STYLE="fork"/>
        <node TEXT="建议删除，角色少，无查询意义" ID="d56163d064e43d6c05228885578e2c08" STYLE="fork"/>
      </node>
      <node TEXT="列表页" ID="5cca9186ee069afab06704d1cf7dbdc8" STYLE="fork">
        <node TEXT="角色编码、角色名称、描述、状态、权限" ID="363ed49f5f1983c262c9ab2696e91708" STYLE="fork">
          <node TEXT="admin" ID="b8001966e9b4490d8e8517011717f144" STYLE="fork">
            <node TEXT="管理员" ID="b18491ffd5f483a37874e2370b8ecad8" STYLE="fork">
              <node TEXT="所有权限" ID="0211819a90db3c18d74f0319a5ea3357" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="algorithm_engineer" ID="0f4dc1ce32de02945465ab69406ea6d3" STYLE="fork">
            <node TEXT="算法工程师" ID="b3f2b1e9059fadaed9cf71d22d0fc88e" STYLE="fork">
              <node TEXT="工作台、任务管理、数据转换、数据可视化权限" ID="623e97ae3249a847a7d94b6818563455" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="collection_engineer" ID="571db852916c36d7032ed3dfbc8571c2" STYLE="fork">
            <node TEXT="采集工程师" ID="bc0947a50e869ad0cba5d985b68e64ca" STYLE="fork">
              <node TEXT="工作台、我的采集权限" ID="4484b51198c151966d558023a8e247f0" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="annotation_engineer" ID="4e56435a44188dea0b58777ef63f816a" STYLE="fork">
            <node TEXT="标注工程师" ID="09cd99f5c014fe4990b1377c3f4b0150" STYLE="fork">
              <node TEXT="工作台、我的标注权限" ID="b973c7ccca2cf77b761d61e738f32e11" STYLE="fork"/>
            </node>
          </node>
          <node TEXT="qc_engineer" ID="f8a7f6270bbd0eb0f4f02ffe0221e893" STYLE="fork">
            <node TEXT="质检工程师" ID="026a55eeac0b0b9c1ba135e93b7bb845" STYLE="fork">
              <node TEXT="工作台、我的质检权限" ID="df23abb6d5e45e39b2f4720a0bce7dc1" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="角色目前写死，不允许增删改" ID="f22853b40c31ecf2951752933188ea49" STYLE="fork"/>
      </node>
    </node>
    <node TEXT="标签管理（林禹成）" ID="8d14fa31bf589dfeca463569f666bd54" STYLE="bubble" POSITION="right">
      <node TEXT="查询" ID="51d1786cae25ade2d2145158cd6abd61" STYLE="fork">
        <node TEXT="标签名称模糊搜索" ID="928be6d89993adb77afe03ba82472cc4" STYLE="fork"/>
        <node TEXT="标签分类[下拉]" ID="785d8d65a97324ba10629330b04b813d" STYLE="fork">
          <node TEXT="质量" ID="c1f3c177e3b4b86e64559097d3670925" STYLE="fork"/>
          <node TEXT="其他" ID="e6b3795c0088e501f1ed6329a229fd52" STYLE="fork"/>
        </node>
        <node TEXT="状态[下拉]" ID="db308905a6c6a68404fa23f40f09509b" STYLE="fork">
          <node TEXT="禁用" ID="846c4e7095770f2fda550f1c7dd59e48" STYLE="fork"/>
          <node TEXT="启用" ID="82c2c80f439a3ff978271bc537ee4f42" STYLE="fork"/>
        </node>
        <node TEXT="【查询】" ID="3de04f47f49d26f8c32e49ae432b0ce4" STYLE="fork"/>
        <node TEXT="【重置】" ID="3cd46ef243d6837acd6fbc113022d664" STYLE="fork">
          <node TEXT="回到默认为空，进行查询" ID="e8ea6b0d5549f16d1111f15836a17bd6" STYLE="fork"/>
        </node>
      </node>
      <node TEXT="【新建标签】" ID="b2b9e5949dea6120b06bfa7358f88b3f" STYLE="fork">
        <node TEXT="* 标签名称" ID="8156d6dcc2ef3800a4a80c995739b906" STYLE="fork">
          <node TEXT="默认文案建议删除" ID="11e54285f405fbf2019601c515f6128f" STYLE="fork"/>
          <node TEXT="限制" ID="6116f0554771fa294b6de5684de4ca55" STYLE="fork">
            <node TEXT="长度 [1,32]" ID="ca9b96b298d9f6f99b1e2e3d5d135efd" STYLE="fork"/>
            <node TEXT="仅支持中英文字母、数字" ID="7527c1ee83994d92a856f1eedf4024d1" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="* 标签分类" ID="02bad2b1d03f6d672e4399fb790d99f6" STYLE="fork">
          <node TEXT="其他" ID="379afa87f6ae5123128b7d23d5a7cd5f" STYLE="fork">
            <node TEXT="默认" ID="5a0d3bf09e0586194ff72f94942af411" STYLE="fork"/>
          </node>
          <node TEXT="质量" ID="d688015f6fd2b76d2fcc145e10e65a75" STYLE="fork"/>
        </node>
        <node TEXT="【取消】" ID="6462572c372b940c2ad129886b020eb0" STYLE="fork">
          <node TEXT="关闭弹框，不保存" ID="1ff2f38d4c2035e1a3a94132ea358f8c" STYLE="fork"/>
        </node>
        <node TEXT="【保存】" ID="791653046a82e8dce57ea7732546a28a" STYLE="fork">
          <node TEXT="校验" ID="ec19bdbe1f520f3c48370029e3fab265" STYLE="fork">
            <node TEXT="必填项校验" ID="9f408b522b0a6a5fdbb638d3072917bd" STYLE="fork"/>
            <node TEXT="标签名称唯一性校验" ID="a778d85db5873210fefb3979b4801c36" STYLE="fork"/>
          </node>
        </node>
      </node>
      <node TEXT="列表页" ID="387973153cd05322827782405115890c" STYLE="fork">
        <node TEXT="标签名称" ID="a68c03ad96a9e309bb7928f2fc775337" STYLE="fork">
          <node TEXT="新增时填写的标签名称" ID="da2a23f64c4afa4ae772d00de310773d" STYLE="fork"/>
        </node>
        <node TEXT="标签分类" ID="472b7c8e54e67ad0586bb793c22f330c" STYLE="fork">
          <node TEXT="新增时选择的标签分类" ID="860e4dd74e6b86925fa5b70172658260" STYLE="fork"/>
        </node>
        <node TEXT="状态" ID="9232c62b2fffbe129ff35a34097773e1" STYLE="fork">
          <node TEXT="启用" ID="8265de0f68ebf1d721b0d55e20224003" STYLE="fork"/>
          <node TEXT="禁用" ID="96304a5adf4c11357722a5b9b9e621bb" STYLE="fork"/>
        </node>
        <node TEXT="创建时间" ID="dc7de4c583c735ef91f7e9f344e0a045" STYLE="fork">
          <node TEXT="显示：年月日 时分秒" ID="146fb1a055aef6ee4fe89559a4f290c5" STYLE="fork"/>
          <node TEXT="新增标签时的时间，不会更新" ID="da669f4c8771e882d9d96d9b959377e4" STYLE="fork"/>
        </node>
        <node TEXT="更新时间" ID="910e1f9f494b421c7183fccad04e046d" STYLE="fork">
          <node TEXT="显示：年月日 时分秒" ID="dc12728c3103935ea85f645e7a6d9b3b" STYLE="fork"/>
          <node TEXT="编辑、禁用操作时，会更新更新时间，刚创建时与创建时间一致" ID="a77f741ed2315df37e4d06311630cf5d" STYLE="fork"/>
        </node>
        <node TEXT="操作" ID="e232191b79c1cd84d564a8e6fd165939" STYLE="fork">
          <node TEXT="【编辑】" ID="5c67e29f41797bb27a6ffc82abd990bb" STYLE="fork">
            <node TEXT="标签名称回显，可修改" ID="3417d59cf5f7d871c4667b1371d4d658" STYLE="fork">
              <node TEXT="限制" ID="0170a1939389be42bdcaa3fef82c794b" STYLE="fork">
                <node TEXT="长度 [1,32]" ID="b2e4171295f95f3edf2093fa0635f0c5" STYLE="fork"/>
                <node TEXT="仅支持中英文字母、数字" ID="612d760131c7960c95ce821853020ff0" STYLE="fork"/>
              </node>
              <node TEXT="标签名称唯一性校验" ID="826f615cea5e7d29d15021156f944ad4" STYLE="fork"/>
            </node>
            <node TEXT="校验" ID="57e9a83e0afbe8653e5f2c57c9b19eb9" STYLE="fork">
              <node TEXT="已被任务使用的标签，不允许修改" ID="8ac0d0382a4f0892e1b8dfbc578fc2e0" STYLE="fork">
                <node TEXT="标签「xxx」正在被未转换任务使用，不能修改" ID="55b0f407e7307c46740d853fdc8ae23f" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="【禁用】/【启用】" ID="0e017c5146c17ef8276e9ac8e985f2c0" STYLE="fork">
            <node TEXT="校验" ID="4720f3cae529f0451c3196ae6156913f" STYLE="fork">
              <node TEXT="已被任务使用的标签，不允许禁用" ID="00b6fb724db6e141cfc3079e5fe2fbf0" STYLE="fork">
                <node TEXT="标签「xxx」正在被未转换任务使用，不能禁用" ID="9d52b37182f044d97c536075286be474" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="【删除】" ID="29df5457e9822053686defa548b12fe6" STYLE="fork">
            <node TEXT="二次确认" ID="3e5e063d2dc0af8d3e9ed63cfb2cc336" STYLE="fork">
              <node TEXT="确定删除标签「xxx」吗？" ID="744fca010d1de4cc0e2abc967690f444" STYLE="fork"/>
            </node>
            <node TEXT="校验" ID="8143bc94296b82ba441f782c0457bced" STYLE="fork">
              <node TEXT="标签「xxx」正在被未转换任务使用，不能删除" ID="b6d5960a6c114e377a741f3ca46250f3" STYLE="fork"/>
            </node>
          </node>
        </node>
        <node TEXT="排序" ID="084f8d7e046c8a9f17b33a4ab5df3f6e" STYLE="fork">
          <node TEXT="创建时间倒序" ID="43301ccd0ef444b5978041662121ed32" STYLE="fork"/>
        </node>
      </node>
    </node>
    <node TEXT="机器人构型配置（林禹成）" ID="c579106df851a532b5a66e09b792a0b1" STYLE="bubble" POSITION="right">
      <node TEXT="查询" ID="aa6a165518c63f4d98ba46312d724b16" STYLE="fork">
        <node TEXT="建议删除" ID="a6e5189e9f998ef331e5724e99ee2325" STYLE="fork"/>
      </node>
      <node TEXT="【新建机器人构型】" ID="27b17c54ede5e402884a35d9ba38d511" STYLE="fork">
        <node TEXT="* 构型名称" ID="bfd5ac82f4e986c826fe3a1a665f23d6" STYLE="fork">
          <node TEXT="限制" ID="bf89cd62fbc7133af6e53efbbc89c053" STYLE="fork">
            <node TEXT="长度 [1，32]" ID="2bc4becc78f2d11785d51322d0c8b3f7" STYLE="fork"/>
            <node TEXT="仅支持中英文字母、数字、_" ID="6ecd101834513d4f6a9bbd97b1d565cb" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="* 机器人型号" ID="5395c9ff0b5063bb00456b75708ea9a6" STYLE="fork">
          <node TEXT="限制" ID="a0c9c549d09c45c7497135ead2ca2af6" STYLE="fork">
            <node TEXT="长度 [1，32]" ID="5bb19140e941ea18021ad3ea055bbe2d" STYLE="fork"/>
            <node TEXT="仅支持中英文字母、数字、_、-" ID="07bced00faae739795fab1177bbf96d8" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="描述" ID="42e703bcc366296222e2b180eebca3c8" STYLE="fork">
          <node TEXT="限制" ID="feddd3adf55f3751682b15cb8176b78c" STYLE="fork">
            <node TEXT="长度&lt;=255" ID="16a1bece783b5ae3fdc537a36f9d5b2c" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="* 配置文件" ID="98a661ae94aa91e935acec374d4d7192" STYLE="fork">
          <node TEXT="仅支持 .json 格式，配置 JSON 必须包含 robot_type 字段" ID="34641765622f7b693ebf93ab51df7d2e" STYLE="fork"/>
        </node>
        <node TEXT="【取消】" ID="af704efb1eb34ecd6913d47e822e4d88" STYLE="fork">
          <node TEXT="关闭弹框，不保存" ID="0de0281499dd37e22f314355662b52b7" STYLE="fork"/>
        </node>
        <node TEXT="【保存】" ID="32bfbb200fc9402ec9894bf6b2751b52" STYLE="fork">
          <node TEXT="校验" ID="b55bf392e8e4f363e3f9a39afb92f587" STYLE="fork">
            <node TEXT="必填项校验" ID="706b2bc68a29870fc6ebc6fe4156c8df" STYLE="fork"/>
            <node TEXT="构型名称唯一性校验" ID="2d5b281e99608cb99951f7d86759a2dd" STYLE="fork"/>
          </node>
        </node>
      </node>
      <node TEXT="列表页" ID="801fe1fe14772dab3df336d5aa520d17" STYLE="fork">
        <node TEXT="构型名称" ID="0ba78233ddb29d346a5b13fdceea6751" STYLE="fork">
          <node TEXT="新增时填写的一致" ID="f70e785c60787d8422752808c49c13e5" STYLE="fork"/>
        </node>
        <node TEXT="机器人型号" ID="63e039ac8d3ca3fe862a4d7b286b204d" STYLE="fork">
          <node TEXT="新增时填写的一致" ID="b73db97d98bfe0b85b63a252c23728f8" STYLE="fork"/>
        </node>
        <node TEXT="描述" ID="5ae32d50ebafac66118c57f816293d1a" STYLE="fork">
          <node TEXT="新增时填写的一致" ID="37e4da809fceff5fa95d4e7600de1fa8" STYLE="fork"/>
        </node>
        <node TEXT="配置文件" ID="be660e49eed5d90545e58755ce342fc5" STYLE="fork">
          <node TEXT="新增时上传的json文件名称" ID="03c8cbe6533d78663caa028180c1fbac" STYLE="fork">
            <node TEXT="可点击查看" ID="06c0ec0e8e3a581925b0e7359979cff0" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="更新时间" ID="d8b3d614bd8f0339ee0d6d806578a928" STYLE="fork">
          <node TEXT="改为“创建时间”" ID="6ead3baa6f5bd8aad1019262069b7c6f" STYLE="fork"/>
        </node>
        <node TEXT="操作" ID="2856513cb988108b49272d2ecabfb20a" STYLE="fork">
          <node TEXT="【查看】" ID="e6c339c0c12d1128830a2a28af7feeb2" STYLE="fork">
            <node TEXT="可查看json文件内容" ID="a0b07830f77df819af55fc9b26aa8d01" STYLE="fork"/>
          </node>
          <node TEXT="【删除】" ID="1121b35b500dcbe7cf90f01f3bf85544" STYLE="fork">
            <node TEXT="校验" ID="14156ff9e976ee60f0ade744174cba7e" STYLE="fork">
              <node TEXT="已被任务使用的机器人构型，不允许删除" ID="be781097542e4bf3927f74483df8b037" STYLE="fork"/>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node TEXT="数据分类管理（林禹成）" ID="ab829fb3987549626734039577931c81" STYLE="bubble" POSITION="right">
      <node TEXT="查询" ID="b1839d75d0c2a76d1086e50cfe5d5e32" STYLE="fork">
        <node TEXT="建议删除" ID="102d007ba9ca016d2959670b3065c538" STYLE="fork"/>
      </node>
      <node TEXT="【新建分类】" ID="f0d7c66bd215ac763fed1aa0b95bf02a" STYLE="fork">
        <node TEXT="* 分类编码" ID="f459c6c71809ecb9f47b579e5197c614" STYLE="fork">
          <node TEXT="限制" ID="50e1b35b4c73de1d9625795650d059ba" STYLE="fork">
            <node TEXT="长度 [1，32]" ID="53ff10b5272231ed1c46673e527d7288" STYLE="fork"/>
            <node TEXT="仅支持英文字母、数字、_" ID="3e9af77c57580ff5406c23af16576d01" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="* 分类名称" ID="d9febbe283bf7d363f8f8aa2631861cf" STYLE="fork">
          <node TEXT="限制" ID="9294422bc93caafb2d19a8851ff6a6bf" STYLE="fork">
            <node TEXT="长度 [1，32]" ID="1e856a0851ad328bb112d725a7e78685" STYLE="fork"/>
            <node TEXT="仅支持中英文字母、数字" ID="f2d87171bbb97621ab7d60c5eb8afa39" STYLE="fork"/>
          </node>
        </node>
        <node TEXT="【取消】" ID="56c864668b221cfff978c77b0dc259b7" STYLE="fork">
          <node TEXT="关闭弹框，不保存" ID="22457ec1c35297d9c9c32929048f4a60" STYLE="fork"/>
        </node>
        <node TEXT="【保存】" ID="874400bca1ecebec993e69f28d5c57a9" STYLE="fork">
          <node TEXT="校验" ID="9b07730bbf89593c09f7f8fb2a3cbcb8" STYLE="fork">
            <node TEXT="必填项" ID="e74ad6ee626693ad14ee099e4c80f91c" STYLE="fork"/>
            <node TEXT="分类编码唯一性校验" ID="be3647aef9b38200e317d0ab0aa45dd3" STYLE="fork"/>
            <node TEXT="分类名称唯一性校验" ID="ed59f8a5708e7f46d6ae86bdc7817802" STYLE="fork"/>
          </node>
        </node>
      </node>
      <node TEXT="列表页" ID="0a29c1f1b389cf7b6248b62a57ad3e69" STYLE="fork">
        <node TEXT="分类编码" ID="7ff09bdb72caec37d1e49ece2ef803b1" STYLE="fork">
          <node TEXT="新增时填写的一致" ID="3ab5c196f8fa010dbe7b37d281d92411" STYLE="fork"/>
        </node>
        <node TEXT="分类名称" ID="dc8d9c86284e844cd7becc7b2b7e10bd" STYLE="fork">
          <node TEXT="新增时填写的一致" ID="1293d9041deda8bcd790cec09ae208e9" STYLE="fork"/>
        </node>
        <node TEXT="样本数" ID="4fdb1b88ae4a9f447f01528f05caa1ac" STYLE="fork"/>
        <node TEXT="视频数" ID="11f53daf98b9b38dd7b33da7eb0fe67f" STYLE="fork"/>
        <node TEXT="更新时间" ID="0471541fd71a74aecf0d6b2bbe6f1e71" STYLE="fork">
          <node TEXT="改为“创建时间”" ID="3543cc2b7b52591ebe3294e2a1d3392c" STYLE="fork"/>
        </node>
        <node TEXT="操作" ID="6e7656037c15c79a1018d54319a889c2" STYLE="fork">
          <node TEXT="【编辑】" ID="74e88c27a125d420e7edb1a5b853a4c4" STYLE="fork">
            <node TEXT="* 分类编码" ID="5ea4e8032b335b0697d5a62184069da4" STYLE="fork">
              <node TEXT="应该置灰，不允许修改" ID="7687bc5438b47401f9609cf6f1dacbd7" STYLE="fork"/>
            </node>
            <node TEXT="* 分类名称" ID="51fcf1e90b32de3bbadd100264cf35b8" STYLE="fork">
              <node TEXT="限制" ID="7ecc175373181ce09a4c2d70ce54fb27" STYLE="fork">
                <node TEXT="长度 [1，32]" ID="2eb89c2852b58720a7c2920d280c8598" STYLE="fork"/>
                <node TEXT="仅支持中英文字母、数字" ID="d6d3f19d45c4d21f00b62005eca5be3a" STYLE="fork"/>
              </node>
            </node>
            <node TEXT="【取消】" ID="f6bb8bdd0d67c2a93c2474a7d4f48363" STYLE="fork">
              <node TEXT="关闭弹框，不保存" ID="603582ab383bf419105dac9bef6f0e3b" STYLE="fork"/>
            </node>
            <node TEXT="【保存】" ID="a367381ed9e9424e19588dd153e24e70" STYLE="fork">
              <node TEXT="校验" ID="5504fbee62950a63eb82a514887cb18f" STYLE="fork">
                <node TEXT="必填项" ID="3c2e47a4cfcd63f896a6b8f2c4755631" STYLE="fork"/>
                <node TEXT="分类名称唯一性校验" ID="e2a39c56873637e21de4f09aeba31a1c" STYLE="fork"/>
              </node>
            </node>
          </node>
          <node TEXT="【删除】" ID="0156035ef129bb01fb8c00b689899c16" STYLE="fork">
            <node TEXT="二次确认“确定删除分类「分类名称」吗？”" ID="af9f8908f607fb7b247d4c2c522e623e" STYLE="fork">
              <node TEXT="【取消】" ID="6a0fed472731fa8fd5d904d6cd7b0240" STYLE="fork">
                <node TEXT="关闭弹框" ID="a3b232e568ab7ec0ed4b0312e630b71d" STYLE="fork"/>
              </node>
              <node TEXT="【确认】" ID="8d3e6622ac5e2b7c2852dc1f062fba30" STYLE="fork">
                <node TEXT="校验" ID="34489fcfb9eb8c6069b23716032b821f" STYLE="fork">
                  <node TEXT="已被任务使用的分类，不允许删除" ID="5ab82cf3d9c6fd88fa1d30ee8d7f239e" STYLE="fork"/>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </node>
</map>