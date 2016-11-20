2015-01-29
--------------

* Started to continue with this project on Github for better version control.

# Log History
-----------------

### *File: log ZH-CN*

WIP 3.1.1 (2013-12-07)
----------------------
+ 常规
    + 所有消耗品完成
    + 1区怪物AI完成
    + 所有玩家AI完成
    + 所有玩家数据基本调平

- 初步测试完毕，作出如下修改

+ BUG修复
    + BOSS现在正确地免疫控制效果(昏迷，变形，击退)
    + 带光环的单位在死亡以后，光环将不再有效
    + 死亡的玩家单位造成额外仇恨的时候不再会引起错误信息了
    
+ 总体
    + 所有技能的快捷键改为(Q, W, E, R, F, (T))

+ BOSS：娜迦海巫8
    + 雷电风暴的中场半径扩大至450y

+ 玩家英雄
    + 总体
        + 取消所有职业的光环
        + 所有HOT/DOT类技能会因法术急速/攻击速度而增加跳数，当法术急速/攻击速度达到100%时，跳数x2
        + 引导型技能也会因法术急速/攻击速度而增加跳数，但是不会缩短施法时间
    + 血精灵防御者
        + 阳炎风暴 - 降低法力消耗，取消回蓝效果
        + 秘法震击 - 全等级提供未命中DEBUFF，目标造成的伤害会为你恢复法力值
        + 纷争 - 现在降低目标攻击强度的百分比，而不是固定点数，并且会消耗法力值，数值等同盾牌格档，提高施法距离至600y
    + 利爪德鲁依
        对利爪德鲁依的技能进行重新设计，使其更加符合其职业设定
        + 啃食 - 移除
        + 裂伤 - 移除，并被整合到野蛮咆哮里面
        + 割伤 - 替代原狂犬病，提升等级会直接增加伤害，而不是叠加的形式
        + 野蛮咆哮 - 替代原挑战咆哮，并且造成原裂伤效果
        + 自然反射 - 将回血效果分离出来，成为一个新的技能
        + 生存本能 - 一个大幅提升生命值上限的长CD时间技能
        + 丛林治愈 - 一个消耗法力值直接回复生命值的高频使用技能
    + 丛林守护者
        + 回春术 - 冷却时间降低为1秒
        + 生命绽放 - 冷却时间降低为1秒。提升等级会直接提升效果，而不是叠加的形式
        + 愈合 - 从1级开始就能对垂危的目标进行瞬发治疗，内置冷却时间为35,25,15秒
    + 牧师
        + 医疗术 - 冷却时间降低为1秒
    + 黑暗猎手
        + 憎恶之力 - 法力消耗提升为4/5/6
    + 法师
        + 法术偷取 - 冷却时间降低为1秒
    + 地缚者
        + 被还原为中远距离输出法师
        + 风暴鞭笞 - 替代原风暴打击，一个具有与攻击间隔相当的吟唱类法术，造成原伤害效果
        + 附魔图腾 - 所有图腾现在为指定目标点施放的技能
            + 风暴图腾 - 攻击间隔现在受你的攻击速度和法术急速影响
            + 地缚图腾 - 大幅提升减速效果
        
+ 小怪
    + 总体
        + 所有小怪的碰撞体积现在为48
    + 鱼人奴隶
        + 增大体积至1.3倍
        
+ 装备
    + 重铸的坚韧徽章
        + 将影响技能从自然反射修改为生存本能
    + 祈福
        + 不再使愈合祷言能造成医疗术的效果。使医疗术的目标受到治疗增幅的效果翻倍，并且移除护盾术造成的虚弱效果。
    + 塞纳留斯的号角
        + 不再影响生命绽放，而是将瞬发愈合的内置冷却时间缩短10秒
    + 部落旗帜
        + 不再提升暴击光环的效果，转而降低英勇打击的法力消耗5点
    + 正义天使之力
        + 现在有45秒的冷却时间，并且最多只能充能20次
    + 潮汐指环
        + 造成的治疗效果也有概率回蓝


WIP 3.1.0 (2013.02.13)
----------------------
 - 玩家技能完工。
 
WIP 3.0.11 
----------------------
 - 所有光环采用BUFF法
 
WIP 3.0.10 
----------------------
 - 仇恨系统大手术
 
WIP 3.0.9 
----------------------
 - 纳洛拉克的祭坛复古
 
WIP 3.0.7 
----------------------
 - 使用新的水模型

WIP 3.0.6 
----------------------
 - 修正移动速度的改变
 - 注册光环与选择英雄无关
 
WIP 3.0.5 
----------------------
 - 可以修改时间的施法条系统
 
WIP 3.0.4 
----------------------
 - 重做BUFF系统
 - 重做读条施法系统
 
WIP 3.0.3 
----------------------
 - BUFF系统：需要指定生效周期和持续次数。
 - 仇恨系统底层结束，待增手动修改仇恨。
 - TODO 属性影响的躲闪之类
 
WIP 3.0.2 (2012-06-30)
----------------------
 - BUFF系统完毕，仇恨系统底层结束，待增手动修改仇恨。
 - TODO可以修改BUFF的持续时间，生效周期。
 - TODO 属性影响的躲闪之类
                            - 
WIP 3.0.1 (2012-06-26)
----------------------
 - BUFF系统完毕，仇恨系统开始动工
 - TODO 属性影响的躲闪之类
                            
WIP 3.0 (2012-06-16)
----------------------
 - 技能初稿设计完毕。
                          
WIP 3.0 (2012-03 UTC+8:00)
-----------
 - 再次重做
                            
Legacy 2.0 (2011-10 UTC+10:00)
------------------
 - 地形开始重做,使用复杂的BUFF系统/伤害系统.

Legacy 1.4 (2010-10-16 UTC+10:00)
------------------
 - 狂怒咆哮不再使玩家受到的法术伤害增加.
 - 怪物施放技能频率修正.
 - 首领不再随意攻击附近目标.

Legacy 1.3 (2010-07-02 UTC+10:00)
------------------
 - 心灵尖啸的调试信息被移除.
 - 电脑玩家不再被认为是"玩家". 因此,电脑玩家不会导致哈里森不开门的错误.
 - 死亡缠绕的调试信息被移除.

Legacy 1.2 (2010-06-19)
------------------
 - 阿曼尼援兵有人口上限了.
 - 刷新的小龙鹰有人口上限了,所以不会一下子刷一堆怪物把你们淹没.


Initial Release (2010-06-11)
------------------
基本进入调试阶段.以后的都是修正报告.

Initial Release (2010-06-10)
------------------
做物品果然很苦工...还是写技能好...

Initial Release (2010-06-03)
------------------
在wc3c得到了新的算法.额...恩人我忘了你名字,对不起啊.貌似哥可以再也不用愚蠢的游
戏缓存了.太帅了!!!(看触发 - Terror)

Initial Release (2010-06-01)
------------------
请教了TigerCN关于如何做恢复的问题,就是一个单位只能在目标上放一个技能,不可叠加,同
时也在wc3c上发帖了,哎,看晚上的结果吧.用GameCache是在是一件恶心的事情.

Initial Release (2010-05-30)
------------------
哈哈,可以用JassNewGen了,直接导致牧师后面的代码的可读性变得稀烂无比.哎,全部改过来太
花时间了,自己看得懂就行哈.感谢JassNewGen的作者们,感谢TigerCN告诉我这个东西,感谢馄饨
教我使用方法 - 要手动保存才能测图,囧- -!

Initial Release (2010-05-30)
------------------
日,原来被变羊自动恢复的时候有某个空单位对被变羊目标造成伤害...让我晚睡了40分钟!

Initial Release (2010-05-29)
------------------
09年6月20号,我开始很蛋疼地写这个地图,当时还不会JASS,更不知VJASS为何物,花了1个月写了
仇恨系统,纯T的,BUG重重.后来慢慢地好了.

7月份出现了一些变故,导致我今后的一年里都有一点零散的时间来写图,慢慢地,我为了处理单技
能多单位使用的冲突不得不学会了JASS,做图速度算是出现了一点飞跃.

后来技能一点一点地写,图一点点地变大,中间也出现过一些令人窝心的事情,比如小德的变形那
个纠结...不过最终还是用一些方法解决掉了.

12月份开始画地形,有半个月吧,算是把地形画完了.

10年,1月23号,由于种种原因,比如各种BUG,以及代码的可读性奇差无比,各种全局变量以及放在
缓存中的全局变量(真是愚蠢的行为),耐心散尽,地图中止.

5月十几号,某日蛋疼和以前几个制图群里面的人聊了下天,某人要我帮忙做技能,我本来闲,于是
欣然接受,可是此人做图技术比较初级,我为了使我做的技能能达到完美移植,不得不学会了
VJASS,或者是入门了.因为我自认为我的VJASS技术到目前为止可以说算是稀烂.

5月19号,我觉得我做图技术又提升了那么一些,于是,下定决心,将这个图重新,完全用VJASS改写.

### *File: Pending Tasks*


* [地形]
     [植物]香蒲,矮树丛,灌木,海藻,蘑菇,鲜花,葡萄树
     [动物]鱼,苍蝇
     [火]火罐的废墟,废弃的火窖,火焰壁炉
     [堆]垃圾,财宝堆,武器架,武器堆,水槽,装甲架,干草堆,废弃的牢笼,损坏的手推车,系留柱
     [邪恶]钉在尖桩上的尸体,放满头的锅炉,头骨堆,矛上的头
        
* 精神鞭笞读条的时候目标死亡，施法不会终止
* short wall 1 unused
* 潮汐男爵会一直使用DOT，直到挂上为止
O Overpower cannot trigger life rep due to judging by "DamageResult.wasDodgable"
O 任何昏迷效果在被解除的时候将会直接解除昏迷,而不管身上是否还有其他昏迷.因此目前设定为昏迷无解.
+ 新的施法时间变动机制
+ 召唤物掉落装备
+ 脱战以后召唤物会被重置在(0, 0)
+ 2次战斗结束小于10秒会导致复活窗口BUG
[13.12.07]
+ 生存本能免伤效果未完成
+ 蓝色玩家通过变羊来治疗怪物,红色玩家也能看到 (所有治疗浮动文字均未判定LocalPlayer)
+ 带光环的单位死亡以后光环仍然有效.(暂时移除所有光环)
+ 憎恶之力耗蓝过少
+ 命令怪物攻击似乎还是有些抽筋.
+ Boss应该免疫强控
+ 死亡的单位通过DOT对玩家10造成伤害会导致小错误
+ AllianceAIAction disabled to be added in later patch.
+ 仇恨系统,单位死亡以后提示小错误.单位死亡,只剩下图腾(DUMMY),会出现大错误.
    - 尚未发现问题
+ 以dummy进入战斗会导致异常.
    - 尚未发现问题
+ 当玩家10的单位无法攻击,移动的时候(农民也算),魔兽直接弹错.
    - 尚未发现问题
+ 修正施法时间的判定序列,以修正精髓榨取在炽热疾速的情况下变瞬发的问题.
+ 法术偷取的圣光印记无效.无大碍.
    - 因为法术偷取之后,首先将原有的primary set null,然后转移至新的caster,再设置primary时,实际上设置的是新的caster的primary,固原caster不会触发道标效果.
+ 风暴打击严重BUG
    - 动作函数的签名有问题,导致VJASS的函数类型.evaluate()出现问题.应该为function func(Buff buf),实际写为function func().
+ 新的光环算法待实施,使用1秒的BUFF
    - 在光环效果为"添加技能修改属性"的情况下,效率低下

### *File: Credits*

* Mc !
	* Description:
		* ZAM style (ruins) Models.
	* Link:
		* http://www.wc3c.net/showthread.php?t=83467

* RetroSexual
	* Project:
		* Progressbar V2
	* Description:
		* Model, that is meant to be used for various channeling spells and etc. Basic lenght is one second, but it can be scaled via triggers. Idea of using screen button texture is borrowed from Hatebreeder's model, you might want to give him credits too.
	* Link:
		* http://www.hiveworkshop.com
	* Upload Date:
		* 2012-09-30
	* Last Update Date:
		* 2012-09-30

* TKOK Makers
	* Project:
		* TKOK
	* Description:
		* Used the aggro system representation.
	* Link:
		* [TODO]