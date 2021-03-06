Class Util.JDateUnitTests Extends %UnitTest.TestCase
{

/// セットアップ
/// 　テストを実行するネームスペース上に以下のグローバルを作成する
/// Setup
///   Make the global on the namespace to run the unit test as follows:
/// Set ^UnitTestRoot = "c:\UnitTests"
///  上で設定したディレクトリは存在している必要がある。
///  そのディレクトリの下にJDateというサブディレクトリを作成
///  そのサブディレクトリにこのクラスをxml形式またはudl形式でエクスポート
///  The directory set above needs to exist.
///  Create a subdirectory called JDate under that directory
///  Export this class in xml or udl format to its subdirectory
///  
/// do ##class(%UnitTest.Manager).DebugLoadTestSuite("JDate")
/// do ##class(%UnitTest.Manager).DebugRunTestCase("JDate")
Method TestLogicalToDisplay()
{
	Set tHDate = $ZDH(18671231,8)
	Set tDate = 18671231
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking before Meiji 1")
	Set tHDate = $ZDH(18680101,8)
	Set tDate = "M010101"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Meiji Start 1")	
	Set tHDate = $ZDH(19120729,8)
	Set tDate = "M450729"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Meiji End 1")	
	Set tHDate = $ZDH(19120730,8)
	Set tDate = "T010730"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Taisyo Start 1")	
	Set tHDate = $ZDH(19261224,8)
	Set tDate = "T151224"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Taisyo End 1")	
	Set tHDate = $ZDH(19261225,8)
	Set tDate = "S011225"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Syouwa Start 1")	
	Set tHDate = $ZDH(19890107,8)
	Set tDate = "S640107"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Syouwa End 1")	
	Set tHDate = $ZDH(19890108,8)
	Set tDate = "H010108"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Heisei Start 1")	
	Set tHDate = $ZDH(20190430,8)
	Set tDate = "H310430"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Heisei End 1")	
	Set tHDate = $ZDH(20190501,8)
	Set tDate = "R010501"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Reiwa Start 1")	
	Set tHDate = $ZDH(21180101,8)
	Set tDate = "21180101"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,1),tDate,"Checking Reiwa Range Error")

	Set tHDate = $ZDH(18671231,8)
	Set tDate = 18671231
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking before Meiji 2")
	Set tHDate = $ZDH(18680101,8)
	Set tDate = "明治01年01月01日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Meiji Start 2")	
	Set tHDate = $ZDH(19120729,8)
	Set tDate = "明治45年07月29日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Meiji End 2")	
	Set tHDate = $ZDH(19120730,8)
	Set tDate = "大正01年07月30日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Taisyo Start 2")	
	Set tHDate = $ZDH(19261224,8)
	Set tDate = "大正15年12月24日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Taisyo End 2")	
	Set tHDate = $ZDH(19261225,8)
	Set tDate = "昭和01年12月25日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Syouwa Start 2")	
	Set tHDate = $ZDH(19890107,8)
	Set tDate = "昭和64年01月07日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Syouwa End 2")	
	Set tHDate = $ZDH(19890108,8)
	Set tDate = "平成01年01月08日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Heisei Start 2")
	Set tHDate = $ZDH(20190430,8)
	Set tDate = "平成31年04月30日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Heisei End 2")
	Set tHDate = $ZDH(20190501,8)
	Set tDate = "令和01年05月01日"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Reiwa Start 2")
	Set tHDate = $ZDH(21180101,8)
	Set tDate = "21180101"
	Do $$$AssertEquals(##class(Util.JDate).LogicalToDisplay(tHDate,2),tDate,"Checking Reiwa Range Error")
}

Method TestDisplayToLogical()
{
	Set tHDate = ""
	Set tDate = "18671331"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Before Meiji Format Error")	
	Set tHDate = $ZDH(18671231,8)
	Set tDate = "18671231"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Before Meiji")	
	Set tHDate = $ZDH(18680101,8)
	Set tDate = "M010101"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Meiji Start 1")	
	Set tHDate = $ZDH(19120729,8)
	Set tDate = "M450729"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Meiji End 1")	
	Set tHDate = ""
	Set tDate = "M450730"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Meiji End 1 NO GOOD")
	Set tHDate = ""
	Set tDate = "T010729"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Taisyo Start 1 NO GOOD")	
	Set tHDate = $ZDH(19120730,8)
	Set tDate = "T010730"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Taisyo Start 1")	
	Set tHDate = $ZDH(19261224,8)
	Set tDate = "T151224"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Taisyo End 1")	
	Set tHDate = ""
	Set tDate = "T151225"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Taisyo End 1 NO GOOD")	
	Set tHDate = ""
	Set tDate = "S011224"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Syouwa Start 1 NO GOOD")	
	Set tHDate = $ZDH(19261225,8)
	Set tDate = "S011225"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Syouwa Start 1")	
	Set tHDate = $ZDH(19890107,8)
	Set tDate = "S640107"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Syouwa End 1")	
	Set tHDate = ""
	Set tDate = "S640108"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Syouwa End 1 NO GOOD")	
	Set tHDate = ""
	Set tDate = "H010107"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Heisei Start 1 NO GOOD")	
	Set tHDate = $ZDH(19890108,8)
	Set tDate = "H010108"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Heisei Start 1")	
	Set tHDate = $ZDH(20190430,8)
	Set tDate = "H310430"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Heisei End 1")	
	Set tHDate = ""
	Set tDate = "H310501"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Heisei End 1 NO GOOD")	
	Set tHDate = ""
	Set tDate = "R010430"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Reiwa Start 1 NO GOOD")	
	Set tHDate = $ZDH(20190501,8)
	Set tDate = "R010501"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Reiwa Start 1")	
	Set tHDate = ""
	Set tDate = "R1000203"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Reiwa Range Check 1")	

	Set tHDate = $ZDH(18671231,8)
	Set tDate = "18671231"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Meiji Start 2 NO GOOD")	
	Set tHDate = $ZDH(18680101,8)
	Set tDate = "明治01年01月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Meiji Start 2")	
	Set tHDate = $ZDH(19120729,8)
	Set tDate = "明治45年07月29日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Meiji End 2")	
	Set tHDate = ""
	Set tDate = "明治45年07月30日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Meiji End 1 NO GOOD")
	Set tHDate = ""
	Set tDate = "大正01年07月29日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Taisyo Start 1 NO GOOD")	
	Set tHDate = $ZDH(19120730,8)
	Set tDate = "大正01年07月30日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Taisyo Start 2")	
	Set tHDate = $ZDH(19261224,8)
	Set tDate = "大正15年12月24日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Taisyo End 2")	
	Set tHDate = ""
	Set tDate = "大正15年12月25日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Taisyo End 2 NO GOOD")	
	Set tHDate = ""
	Set tDate = "昭和01年12月24日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Syouwa Start 1 NO GOOD")	
	Set tHDate = $ZDH(19261225,8)
	Set tDate = "昭和01年12月25日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Syouwa Start 2")	
	Set tHDate = $ZDH(19890107,8)
	Set tDate = "昭和64年01月07日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Syouwa End 2")	
	Set tHDate = ""
	Set tDate = "昭和64年01月08日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Syouwa End 2 NO GOOD")	
	Set tHDate = $ZDH(19890108,8)
	Set tDate = "平成01年01月08日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Heisei Start 2")
	Set tHDate = ""
	Set tDate = "平成01年01月07日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Heisei Start 2 NO GOOD")	
	Set tHDate = $ZDH(20190430,8)
	Set tDate = "平成31年04月30日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Heisei End 2")	
	Set tHDate = ""
	Set tDate = "平成31年05月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Heisei End 2 NO GOOD")	
	Set tHDate = $ZDH(20190501,8)
	Set tDate = "令和01年05月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Reiwa Start 2")
	Set tHDate = ""
	Set tDate = "令和01年04月30日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Reiwa Start 2 NO GOOD")	
	Set tHDate = ""
	Set tDate = "令和100年04月30日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Reiwa Range Check 2")	
	Set tHDate = ""
	Set tDate = "平成01年00月00日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 1")
	Set tHDate = ""
	Set tDate = "平成00年01月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 2")
	Set tHDate = ""
	Set tDate = "平静01年01月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 3")
	Set tHDate = ""
	Set tDate = "平成01念01月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 4")
	Set tHDate = ""
	Set tDate = "平成01年01日01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 5")
	Set tHDate = ""
	Set tDate = "平成01年01月01月"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 6")
	Set tHDate = ""
	Set tDate = "平成01年01月1日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 7")
	Set tHDate = ""
	Set tDate = "平成01年1月01日"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 8")
	Set tHDate = ""
	Set tDate = "Z011011"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Format Error 9")
	Set tHDate = ""
	Set tDate = "H11011"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Format Error 10")
	Set tHDate = ""
	Set tDate = "H11011"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Format Error 11")
	Set tHDate = ""
	Set tDate = "H1101011"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,1,.tError),tHDate,"Checking Format Error 12")
	Set tHDate = ""
	Set tDate = "平成11年01月01日1"
	Do $$$AssertEquals(##class(Util.JDate).DisplayToLogical(tDate,2,.tError),tHDate,"Checking Format Error 13")
}

}

