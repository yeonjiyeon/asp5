# asp5
Micro ORM인 Dapper 다루기
Dapper(Micro ORM)를 사용해 코드 생산성과 유지보수 편의성 높이기
ORM(Object Relational Mapper)프레임워크:
데이터베이스 처리 관련 코드가 상당히 줄어들어 생산성을 향상-Entity Framework, Micro ORM(Dapper)
- Dapper 또는 Dapper.NET이라 불리는 Micro ORM은 스택오버플로(StackOverflow)에서 
만들고 사용하는 오픈 소스이면서 가볍고 빠른 ORM 도구

실습_ Micro ORM인 Dapper를 사용한 DB 코드 간소화==============
전체적인 진행 순서
1. 프로젝트 생성 및 Dapper 참조 추가
2. Model(모델) 클래스 및 LocalDb 생성
3. 데이터 입력, 출력, 상세, 수정, 삭제에 대한 기본 코드 작성
4. ASP.NET 웹 폼에서 CRUD 테스트
DevDapper-Web Forms, MVC, Web API
보기 > 다른 창 > 패키지 관리자 콘솔을 클릭해 패키지 관리자 콘솔을 실행하면 NuGet을 통해 Dapper에 대한 참조를 추가
Install-Package Dapper
 Models 폴더 Maxim.cs란 이름으로 새 클래스를 추가
pp_Data 폴더에서 마우스 오른쪽 버튼을 클릭한 후 추가 > 새 항목
SQL Server 데이터베이스를 선택하고, DevDapper.mdf라는 이름을 지정
DevDapper.mdf 파일에서 마우스 오른쪽 버튼을 클릭해 열기를 실행하면 서버 탐색기를 통해서 데이터베이스가 연결
보기 > SQL Server 개체 탐색기
 (localdb)\MSSQLLocalDB 항목을 선택해 메뉴를 확장
 DevDapper 데이터베이스를 연결한 후 테이블에 마우스 오른쪽 버튼을 클릭한 후 새 테이블 추가
CREATE TABLE [dbo].[Maxims] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (25) NOT NULL,
    [Content] NVARCHAR (140) NOT NULL,
    [CreationDate] DATETIME DEFAULT (getdate()) NULL,
  PRIMARY KEY CLUSTERED ([Id] ASC)
);
Repositories폴더 MaximServiceRepository.cs
• FrmMaximWrite.aspx: 입력 테스트
• FrmMaximList.aspx: 전체 출력 테스트
• FrmMaximView.aspx: 상세보기 테스트
• FrmMaximModify.aspx: 수정 테스트
• FrmMaximDelete.aspx: 삭제 테스트
===========================================


ASP.NET 데이터 컨트롤
 데이터 바인딩
SQL Server의 테이블에 있는 데이터를 ASP.NET 서버 컨트롤에 출력하는 일을 데이터 바인딩(Data Binding)이라고 한다
<%# DataBinder.Eval(Container.DataItem, "필드명", "형식") %>
<%# Eval("필드명", "형식") %>
<%# XPath("요소명") %>
<asp:TextBox ID=“txtInput” runat=“server” Text=’<%# Bind(“UserID”) %>’ />
텍스트박스에 있는 내용을 컨트롤로 전달 받을 때 사용하는 구문의 예

속성과 템플릿
• 속성: 속성은 일반적인 컨트롤이 가지고 있는 기능들을 속성 창에서 바로 설정할 수 있는 기능이다.
• 템플릿: 템플릿은 속성 창에서 다루기 어려운 서버 컨트롤의 모양과 출력에 대한 기능을 세부적으로 정의하고자 할 때 
디자인 보기 영역과 소스 보기 영역에서 설정할 수 있도록 Visual Studio에서 제공하는 기능이다.
=========================================
데이터 소스 컨트롤		설명
-------------------------------------------------------------------
SqlDataSource		SQL Server 같은 관계형 데이터베이스를 사용하려 할 때 사용
AccessDataSource		마이크로소프트사의 Access 데이터베이스를 사용하려 할 때 사용
ObjectDataSource		C#의 클래스 같은 개체를 데이터 원본으로 사용하려 할 때 사용
XmlDataSource		XML 파일을 데이터 원본으로 사용하려 할 때 사용
LinqDataSource		LINQ 쿼리식에 대한 결과를 출력할 용도로 사용
SiteMapDataSource		ASP.NET에서 특별히 사용되는 Web.sitemap 파일을 연결하고자 할 때 사용
EntityDataSource		Entity Framework와 상호작용을 하기 위해 사용
===========================================
데이터 컨트롤처럼 기능이 많은 컨트롤 학습법
 SqlDataSource 컨트롤
실습_ SqlDataSource 컨트롤로 데이터 쉽게 출력하기================
DevDataControl-Web Forms, MVC, Web API
FrmSqlDataSource.aspx
qlDataSource 컨트롤을 선택하면 오른쪽에 작은 삼각형 버튼(스마트 태그)를 클릭
데이터 소스 구성 링크를 클릭
새 연결 버튼을 클릭
Microsoft SQL Server를 선택한 후 계속 버튼을 클릭
 서버 이름에 LocalDb의 인스턴스 이름인 (localdb)\MSSQLLocalDb를 입력
인증은 Windows 인증
DevADONET
데이터 연결 선택 화면에서 연결 문자열 옆의 + 버튼을 누르면 설정된 데이터베이스 연결 문자열이 나타난다.
Data Source=(localdb)\MSSQLLocalDb;Initial Catalog=DevADONET;Integrated Security=True
 Select 문 구성 화면
 테이블 또는 뷰의 열 지정
Num과 Name을 선택한 후 ORDER BY 버튼을 클릭
정렬 기준으로 Num 필드를 선택하고, 내림차순을 선택
쿼리 테스트 버튼을 클릭한다. 테스트가 정상적으로 진행되어 Num와 Name 컬럼이 제대로 조회되면 마침 
DropDownList:데이터 소스 선택 링크를 클릭
데이터 소스 선택에는 앞서 구성한 SqlDataSource 컨트롤의 ID 속성인 sdsMemoName을 지정한다.
 DropDownList에 표시할 데이터 필드 선택에는 Name 필드를, 
내부적으로 저장될 값인 DropDownList의 값에 대한 데이터 필드 선택에는 Num 필드를 선택한 후 확인 
*<%$ %> 구문을 사용해 Web.config 파일에 저장된 데이터베이스 연결 문자열인 DevADONETConnectionString 항목을 지정하는데, 
ConnectionStrings:데이터베이스연결문자열 형식으로 설정
===========================================

Repeater 컨트롤
실습_ Repeater 컨트롤로 간단한 데이터 출력============
FrmRepeater.aspx
qlDataSource 컨트롤에 커서를 두면 스마트 태스크 아이콘이 나타나는데 이를 선택
데이터 소스 구성 링크버튼
데이터 연결 선택 창에서는 앞에서 진행한 실습에서 저장해 놓은 데이터베이스 연결 문자열을 선택
테이블 이름은 Memos, 열은 Num, Name, Title을 선택한 뒤 오른쪽 영역에 있는 ORDER BY 버튼을 클릭
Num을 선택하고 내림차순
===========================================

 DataList 컨트롤
 실습_ DataList 컨트롤을 사용해 효과적으로 데이터 진열================
FrmDataList.aspx
===========================================

DetailsView 컨트롤
실습_ DetailsView 컨트롤을 사용해 단일 데이터 출력하기======
FrmDetailsView.aspx
름은 Memos, 열은 *를 선택하고 WHERE 버튼을 클릭
Where 절 추가 화면에서 다음과 같이 열, 연산자, 소스, 매개 변수 속성 값을 입력한 후 추가 버튼
===========================================

FormView 컨트롤
실습_ FormView 컨트롤을 사용해 단일 데이터 출력============
FrmFormView.aspx
===========================================

GridView 컨트롤
 https://msdn.microsoft.com/ko-kr/library/system.web.ui.webcontrols.gridview(v=vs.110).aspx
실습_ GridView 컨트롤을 사용해 다중 데이터 출력=======================


XmlDataSource 컨트롤===============
실습_ XmlDataSource 컨트롤로 XML 문서 출력======================
FrmXmlDataSource.aspx
FrmXmlDataSource.xml
===========================================

ObjectDataSource 컨트롤
실습_ ObjectDataSource 컨트롤로 메서드 실행 결괏값 받기=====
FrmObjectDataSource.aspx
FrmObjectDataSourceClass.cs
===========================================

 ASP.NET Chart 컨트롤
Chart 사용 샘플 웹 사이트
 http://www.dotnetnote.com/ChartControl
