USE [CHLDB]
GO
/****** Object:  Table [dbo].[DimRepaymentMethod]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRepaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_DIMREPAYMENTMETHOD] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimRepaymentMethod'
GO
/****** Object:  Table [dbo].[DimLoanType]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimLoanType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
 CONSTRAINT [PK_DIMLOANTYPE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标种类型表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DimLoanType'
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[RealName] [nvarchar](50) NULL,
	[Mobile] [varchar](20) NULL,
	[Identity] [varchar](20) NULL,
	[Address] [nvarchar](100) NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserID] [int] NULL,
 CONSTRAINT [PK_CUSTOMER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'真实姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'RealName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'身份证号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Identity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'Address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CreateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer'
GO
/****** Object:  Table [dbo].[User]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](50) NULL,
	[Password] [nvarchar](100) NULL,
	[RealName] [nvarchar](20) NULL,
	[CreateTime] [datetime] NULL,
	[IsActive] [bit] NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Type] [smallint] NULL,
	[LoanTypePermission] [varchar](50) NULL,
 CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'LoginName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登录密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否启用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'电子邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机号码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类型1，系统用户；2，营销人员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标种权限 根据借款标类型判断权限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'LoanTypePermission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User'
GO
/****** Object:  Table [dbo].[RepaymentPlan]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepaymentPlan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoanID] [int] NOT NULL,
	[PeNumber] [int] NULL,
	[RePrincipal] [decimal](18, 2) NULL,
	[ReInterest] [decimal](18, 2) NULL,
	[Status] [smallint] NULL,
	[RePayDate] [date] NULL,
	[CreateTime] [datetime] NULL,
 CONSTRAINT [PK_REPAYMENTPLAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款状态 0-未还，1-全额已还，2-作废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentPlan', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款计划表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentPlan'
GO
/****** Object:  Table [dbo].[RepaymentInfoTemp]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepaymentInfoTemp](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SumPrincipal] [decimal](18, 2) NOT NULL,
	[Principal] [decimal](18, 2) NOT NULL,
	[CurrInterest] [decimal](18, 2) NOT NULL,
	[RepaymentTime] [datetime] NOT NULL,
	[status] [int] NOT NULL,
	[Repayment] [int] NOT NULL,
	[LoanID] [int] NOT NULL,
 CONSTRAINT [PK_RepaymentInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'总共要还款的本金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfoTemp', @level2type=N'COLUMN',@level2name=N'SumPrincipal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'剩余本金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfoTemp', @level2type=N'COLUMN',@level2name=N'Principal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前利息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfoTemp', @level2type=N'COLUMN',@level2name=N'CurrInterest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfoTemp', @level2type=N'COLUMN',@level2name=N'RepaymentTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfoTemp', @level2type=N'COLUMN',@level2name=N'status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfoTemp', @level2type=N'COLUMN',@level2name=N'Repayment'
GO
/****** Object:  Table [dbo].[RepaymentInfo]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepaymentInfo](
	[Id] [int] NOT NULL,
	[SumPrincipal] [decimal](18, 2) NOT NULL,
	[Principal] [decimal](18, 2) NOT NULL,
	[startTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Repayment] [int] NOT NULL,
	[LoanRate] [decimal](18, 2) NOT NULL,
	[Status] [int] NOT NULL,
	[AlreadyInterest] [decimal](18, 2) NOT NULL,
	[CurrInterest] [decimal](18, 2) NOT NULL,
	[CalculateDays] [int] NOT NULL,
	[LoandID] [int] NOT NULL,
 CONSTRAINT [PK_RepaymentInfo_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfo', @level2type=N'COLUMN',@level2name=N'Repayment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当期时间段内利息多少' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfo', @level2type=N'COLUMN',@level2name=N'LoanRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当期剩余利息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfo', @level2type=N'COLUMN',@level2name=N'CurrInterest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'计算当期还款时间多少天' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentInfo', @level2type=N'COLUMN',@level2name=N'CalculateDays'
GO
/****** Object:  Table [dbo].[Loan]    Script Date: 05/29/2015 18:18:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Loan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoanCustomerID] [int] NOT NULL,
	[LoanNumber] [varchar](20) NOT NULL,
	[LoanAmount] [decimal](18, 2) NOT NULL,
	[LoanRate] [decimal](18, 2) NOT NULL,
	[LoanTerm] [int] NULL,
	[BorrowMode] [smallint] NULL,
	[RepaymentMethod] [int] NULL,
	[LoanTypeID] [int] NULL,
	[Status] [int] NULL,
	[CreateTime] [datetime] NULL,
	[LoanDate] [date] NULL,
	[UserID] [int] NULL,
	[CalculateHead] [smallint] NULL,
	[IfOnPlan] [bit] NOT NULL,
 CONSTRAINT [PK_LOAN] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款人ID 关联客户表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanCustomerID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanNumber'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款金额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanAmount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'年利率' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanRate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款期限(按月)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanTerm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款期限方式：0：按天借款 1：按月借款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'BorrowMode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'RepaymentMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标种类型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanTypeID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款标状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'LoanDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经办人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0：算头不算尾；1：算头算尾' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'CalculateHead'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否按还款计划还款' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan', @level2type=N'COLUMN',@level2name=N'IfOnPlan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loan'
GO
/****** Object:  UserDefinedFunction [dbo].[GetLoanNumber]    Script Date: 05/29/2015 18:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- =============================================
CREATE FUNCTION [dbo].[GetLoanNumber]
(
	@nowdate datetime
)
RETURNS varchar(20)
AS
BEGIN
	DECLARE @LoanNumber varchar(20)
	DECLARE @MaxLoanNumber varchar(20)
	
	set @MaxLoanNumber = ( select top 1 LoanNumber from dbo.Loan where left(LoanNumber,8) = CONVERT(varchar(8), @nowdate, 112) order by LoanNumber desc)
	set @LoanNumber = (select CONVERT(varchar(8), @nowdate, 112) + right(cast(isnull((right(@MaxLoanNumber,4)),0) as int) +10001,4)  )
	set @LoanNumber = isnull(@LoanNumber,CONVERT(varchar(8), GETDATE(), 112) + '0001')
	RETURN @LoanNumber
END
GO
/****** Object:  Table [dbo].[RepaymentComplete]    Script Date: 05/29/2015 18:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepaymentComplete](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BeginDate] [date] NULL,
	[EndDate] [date] NULL,
	[Interest] [decimal](18, 2) NULL,
	[LoanID] [int] NULL,
	[Status] [smallint] NOT NULL,
 CONSTRAINT [PK_RepaymentComplete] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开始日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentComplete', @level2type=N'COLUMN',@level2name=N'BeginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结束日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentComplete', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'时间段内计算的利息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentComplete', @level2type=N'COLUMN',@level2name=N'Interest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentComplete', @level2type=N'COLUMN',@level2name=N'LoanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1，正常；2，作废' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentComplete', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款完成记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentComplete'
GO
/****** Object:  Table [dbo].[RepaymentRecord]    Script Date: 05/29/2015 18:18:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepaymentRecord](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RepayDate] [datetime] NULL,
	[Principal] [decimal](18, 2) NULL,
	[Interest] [decimal](18, 2) NULL,
	[CreateTime] [datetime] NULL,
	[CreateUserID] [int] NULL,
	[LoanID] [int] NULL,
 CONSTRAINT [PK_RepaymentRecord] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord', @level2type=N'COLUMN',@level2name=N'RepayDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款本金' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord', @level2type=N'COLUMN',@level2name=N'Principal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款利息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord', @level2type=N'COLUMN',@level2name=N'Interest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord', @level2type=N'COLUMN',@level2name=N'CreateUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'借款表ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord', @level2type=N'COLUMN',@level2name=N'LoanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'还款记录表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RepaymentRecord'
GO
/****** Object:  StoredProcedure [dbo].[Proc_CustomerAddValidate]    Script Date: 05/29/2015 18:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,HK,Name>
-- Create date: <Create Date,2015-05-20,>
-- Description:	<Description,客户添加验证,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_CustomerAddValidate]
	@Name VARCHAR(50),
	@Mobile VARCHAR(20),
	@Identity VARCHAR(20),
	@ErrorMsg NVARCHAR(100)='' OUTPUT
AS
BEGIN
	IF EXISTS(SELECT * FROM dbo.Customer WHERE Name=@Name)
	BEGIN
		SET @ErrorMsg = '显示名称已存在'
		SELECT 0
		RETURN;
	END
	IF EXISTS(SELECT * FROM dbo.Customer WHERE Mobile=@Mobile)
	BEGIN
		SET @ErrorMsg = '手机号码已存在'
		SELECT 0
		RETURN;
	END
	IF EXISTS(SELECT * FROM dbo.Customer WHERE [Identity]=@Identity)
	BEGIN
		SET @ErrorMsg = '身份证号码已存在'
		SELECT 0
		RETURN;
	END
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_AddRepaymentInfo]    Script Date: 05/29/2015 18:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,HK,Name>
-- Create date: <Create Date,2015-05-19,>
-- Description:	<Description,添加借款并生成还款计划,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_AddRepaymentInfo]
(
 @loandID int

)
AS
BEGIN
	
	SET XACT_ABORT ON;
	--查询当前的还款方式
	SELECT LoanAmount,b.LoanRate,b.LoanDate,b.LoanTerm,b.RepaymentMethod,b.BorrowMode FROM  Loan AS b
	WHERE ID=@loandID
	
	--查询未生成还款计划的
	SELECT RepaymentTime,* FROM dbo.RepaymentInfoTemp WHERE status=0

	

	--得到还款已还的总利息 总金额
	SELECT ISNULL(SUM(Principal),0)AS TotalPrincipal,ISNULL(SUM(CurrInterest),0) AS TotalCurrInterest FROM dbo.RepaymentInfoTemp WHERE status=1
	
	--查询已经生成还款计划的

	SELECT * FROM RepaymentInfo WHERE LoandID=@LoandID
	


END

--EXEC  [dbo].[Proc_AddRepaymentInfo] 1
GO
/****** Object:  StoredProcedure [dbo].[Proc_AddLoan]    Script Date: 05/29/2015 18:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,HK,Name>
-- Create date: <Create Date,2015-05-30,>
-- Description:	<Description,向RepaymentComplete表插入数据,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_RepaymentCompleteInsert]
	@BeginDate DATE,
	@EndDate DATE,
	@Interest DECIMAL(18,2),
	@LoanID INT
AS
BEGIN
	INSERT INTO dbo.RepaymentComplete
	        ( BeginDate ,
	          EndDate ,
	          Interest ,
	          LoanID ,
	          [Status]
	        )
	VALUES  ( @BeginDate , -- BeginDate - date
	          @EndDate , -- EndDate - date
	          @Interest , -- Interest - decimal
	          @LoanID , -- LoanID - int
	          1  -- Status - smallint
	        )
END
GO
-- =============================================
-- Author:		<Author,HK,Name>
-- Create date: <Create Date,2015-05-19,>
-- Description:	<Description,添加借款并生成还款计划,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_AddLoan]
	@LoanCustomerID INT,						--借款人ID
	@LoanAmount DECIMAL(18,2),					--借款金额
	@LoanTypeID INT,							--借款标类型
	@RepaymentMethod INT,						--还款方式
	@BorrowMode SMALLINT,						--0：按天借款 1：按月借款
	@CalculateHead SMALLINT,					--0：算头不算尾；1：算头算尾
	@LoanTerm INT,								--期数
	@LoanRate DECIMAL(18,12),					--年化利率
	@LoanDate DATETIME,							--计息日期
	@UserID INT									--经办人
AS
BEGIN
	SET XACT_ABORT ON;
	DECLARE @LoanID INT,								--借款ID
			@SumPeNumber INT,							--总期数
			@PeNumber INT,								--期号
			@RepayDate DATETIME,						--还款日期
			@Principal DECIMAL(18,6),					--应收本金
			@Interest DECIMAL(18,2),					--应收利息
			@MonthRate DECIMAL(18,12),					--月利率	
			@DayDiff INT,								--按月还款天数间隔
			@PlanPeReInterest DECIMAL(18,2)				--计划每天应还利息
	
	SET @PeNumber = 1
	SET @SumPeNumber = @LoanTerm
	SET @MonthRate = @LoanRate / 100 / 12
	SET @RepayDate = DATEADD(month,1,@LoanDate)
	
	CREATE TABLE #TmpPlan --创建临时表#TmpPlan
	(
		ID   INT IDENTITY (1,1)     NOT NULL,	--创建列ID,自增1
		PeNumber	INT,						--期号
		RepayDate	DATETIME,					--应还日期
		PrincipalAndInterest	DECIMAL(18,2),	--应还本息
		Principal	DECIMAL(18,2),				--应还本金
		Interest	DECIMAL(18,2),				--应还利息
		RemaindPrincipal	DECIMAL(18,2),		--剩余本金
		PRIMARY KEY (ID)      --定义ID为临时表#TmpPlan的主键      
	);
	CREATE TABLE #TmpDayPlan --创建临时表#TmpDayPlan  存放每天应还利息
	(
		ID   INT IDENTITY (1,1)     NOT NULL,	--创建列ID,自增1
		BeginDate	DATE,						--开始日期
		EndDate	DATE,							--结束日期
		Interest	DECIMAL(18,2),				--应还利息
		PRIMARY KEY (ID)      --定义ID为临时表#TmpDayPlan的主键      
	);
	BEGIN TRY	
		BEGIN TRAN
			--------插入借款数据begin--------
			INSERT INTO dbo.Loan
			        ( LoanCustomerID ,
					  LoanNumber ,
			          LoanAmount ,
			          LoanRate ,
			          LoanTerm ,
			          RepaymentMethod ,
			          BorrowMode ,
			          CalculateHead ,
			          LoanTypeID ,
			          [Status] ,
			          UserID ,
			          CreateTime ,
			          LoanDate 
			        )
			VALUES  ( @LoanCustomerID,
					  dbo.GetLoanNumber(@LoanDate) , -- LoanNumber - varchar(20)
			          @LoanAmount , -- LoanAmount - decimal
			          @LoanRate , -- LoanRate - decimal
			          @LoanTerm , -- LoanTerm - int
			          @RepaymentMethod , -- RepaymentMethod - int
			          @BorrowMode ,
			          @CalculateHead ,
			          @LoanTypeID ,
			          1 , -- Status - int
			          @UserID,  -- UserID - int
			          GETDATE(),
			          @LoanDate
			        )
			SELECT @LoanID=@@IDENTITY
			--------插入借款数据end----------
			--------生成还款计划begin--------
			IF(@RepaymentMethod = 1)--按月付息到期还本 算头不算尾
			BEGIN
				SET @Interest = @LoanAmount * @MonthRate --计算每期利息
				WHILE (@PeNumber <= @SumPeNumber)
				BEGIN
					SET @PlanPeReInterest=@Interest / 30 --每天应还利息
					SET @DayDiff = DATEDIFF(DAY,DATEADD(month,-1,@RepayDate),@RepayDate)
					IF @PeNumber = @SumPeNumber --最后一期
						SET @Principal = @LoanAmount --计算当期本金
					ELSE
						SET @Principal = 0 --计算当期本金
					INSERT INTO #TmpPlan(PeNumber,RepayDate,Principal,Interest)
					VALUES (@PeNumber,@RepayDate,@Principal,@Interest);
					
					IF(@DayDiff <> 30)
					BEGIN
						--插入到最后一天前数据
						INSERT INTO #TmpDayPlan(BeginDate,EndDate,Interest)
						VALUES (DATEADD(month,-1,@RepayDate),DATEADD(day,-2,@RepayDate),@PlanPeReInterest);
						IF(@DayDiff > 30)--31天
							SET @PlanPeReInterest = 0
						ELSE IF(@DayDiff < 30)--28天
							SET @PlanPeReInterest = @PlanPeReInterest * 3
						--插入最后一天数据
						INSERT INTO #TmpDayPlan(BeginDate,EndDate,Interest)
						VALUES (DATEADD(day,-1,@RepayDate),DATEADD(day,-1,@RepayDate),@PlanPeReInterest);
					END
					ELSE
					BEGIN
						INSERT INTO #TmpDayPlan(BeginDate,EndDate,Interest)
						VALUES (DATEADD(month,-1,@RepayDate),DATEADD(day,-1,@RepayDate),@PlanPeReInterest);
					END
					SET @PeNumber = @PeNumber + 1
					SET @RepayDate = DATEADD(month,@PeNumber,@LoanDate)
				END
			END
			IF(@RepaymentMethod = 2)--按月平息 算头不算尾
			BEGIN
				SET @Interest = @LoanAmount * @MonthRate --计算每期利息
				SET @Principal = @LoanAmount / @SumPeNumber --计算每期本金
				WHILE (@PeNumber <= @SumPeNumber)
				BEGIN
					SET @PlanPeReInterest=@Interest / 30 --每天应还利息
					INSERT INTO #TmpPlan(PeNumber,RepayDate,Principal,Interest)
					VALUES (@PeNumber,@RepayDate,@Principal,@Interest);
					SET @DayDiff = DATEDIFF(DAY,DATEADD(month,-1,@RepayDate),@RepayDate)
					IF(@DayDiff <> 30)
					BEGIN
						--插入到最后一天前数据
						INSERT INTO #TmpDayPlan(BeginDate,EndDate,Interest)
						VALUES (DATEADD(month,-1,@RepayDate),DATEADD(day,-2,@RepayDate),@PlanPeReInterest);
						IF(@DayDiff > 30)--31天
							SET @PlanPeReInterest = 0
						ELSE IF(@DayDiff < 30)--28天
							SET @PlanPeReInterest = @PlanPeReInterest * 3
						--插入最后一天数据
						INSERT INTO #TmpDayPlan(BeginDate,EndDate,Interest)
						VALUES (DATEADD(day,-1,@RepayDate),DATEADD(day,-1,@RepayDate),@PlanPeReInterest);
					END
					ELSE
					BEGIN
						INSERT INTO #TmpDayPlan(BeginDate,EndDate,Interest)
						VALUES (DATEADD(month,-1,@RepayDate),DATEADD(day,-1,@RepayDate),@PlanPeReInterest);
					END
					SET @PeNumber = @PeNumber + 1					
					SET @RepayDate = DATEADD(month,@PeNumber,@LoanDate)
				END
			END
			INSERT INTO dbo.RepaymentPlan
			        ( LoanID ,
			          PeNumber ,
			          RePrincipal ,
			          ReInterest ,
			          [Status] ,
			          RePayDate ,
			          CreateTime
			        )
			SELECT @LoanID,PeNumber,Principal,Interest,0,CONVERT(CHAR(10),RepayDate,120),GETDATE() FROM #TmpPlan
			INSERT INTO dbo.RepaymentComplete
			        ( BeginDate ,
			          EndDate ,
			          Interest ,
			          LoanID ,
			          [Status]
			        )
			SELECT BeginDate,EndDate,Interest,@LoanID,1 FROM #TmpDayPlan
			
			--------生成还款计划end---------
		COMMIT TRAN
        RETURN 1;
    END TRY
	BEGIN CATCH
		IF XACT_STATE()=-1
		ROLLBACK TRAN;
		RETURN 0;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Proc_RepaymentRecordAdd]    Script Date: 05/29/2015 18:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,HK,Name>
-- Create date: <Create Date,2015-05-28,>
-- Description:	<Description,添加还款记录并生成新的还款计划,>
-- =============================================
CREATE PROCEDURE [dbo].[Proc_RepaymentRecordAdd]
	@LoanID INT,					--借款标ID
	@RepayDate DATE,				--还款时间
	@Principal DECIMAL(18,2),		--还款金额
	@Interest DECIMAL(18,2),		--还款利息
	@CreateTime DATETIME,			--创建时间
	@CreateUserID INT				--创建人
AS
BEGIN
	SET XACT_ABORT ON;
	BEGIN TRY	
		BEGIN TRAN
			DECLARE @PlanRepayDate DATE,		--还款计划应还日期
					@IfOnPlan BIT,				--是否按还款计划还款
					@BeginDate DATE,			--开始时间
					@EndDate DATE=(SELECT TOP 1 RePayDate FROM dbo.RepaymentPlan WHERE LoanID=@LoanID ORDER BY RePayDate DESC),				--最后还款日期
					@PeNumber INT,				--期数
					@PlanReInterest DECIMAL(18,2),--计划应还利息
					@PlanRePrincipal DECIMAL(18,2),--计划应还本金
					@PlanPeReInterest DECIMAL(18,2),--计划每天应还利息
					@LoanAmount DECIMAL(18,2),		--借款金额
					@LoanRate DECIMAL(18,2),		--借款利率
					@PeSurPrincipal DECIMAL(18,2),		--当期剩余本金
					@CompletePrincipal DECIMAL(18,2),		--已还本金
					@DayDiff INT,				--按月还款天数间隔
					@TempDate DATE,				--临时日期中间变量
					@TempInterest DECIMAL(18,2)				--临时利息中间变量
			SELECT @IfOnPlan=IfOnPlan,@BeginDate=LoanDate,@LoanAmount=LoanAmount,@LoanRate=LoanRate FROM dbo.Loan WHERE ID=@LoanID
			SELECT TOP 1 @PlanRepayDate=RePayDate,@PeNumber=PeNumber,@PlanReInterest=ReInterest,@PlanRePrincipal=RePrincipal FROM dbo.RepaymentPlan WHERE LoanID=@LoanID AND [Status]=0 ORDER BY PeNumber
			IF(@IfOnPlan = 1 AND @PlanRepayDate = @RepayDate AND @PlanRePrincipal=@Principal)--判断是否按还款计划表时间还款
			BEGIN
				--修改还款计划表当期状态为已还				
				UPDATE dbo.RepaymentPlan SET [Status]=1 WHERE LoanID=@LoanID AND PeNumber=@PeNumber
			END
			ELSE--不按还款计划表时间还款
			BEGIN
				SELECT @CompletePrincipal = SUM(Principal) FROM dbo.RepaymentRecord WHERE LoanID=@LoanID--已还本金
				SET @CompletePrincipal += @Principal
				--如果本金
				--IF((@CompletePrincipal+@Principal)=@LoanAmount)
				IF(@RepayDate <= @EndDate)
				BEGIN
					SET @PeSurPrincipal = @LoanAmount-@CompletePrincipal		--当期剩余本金
					SET @PlanPeReInterest = @PeSurPrincipal * @LoanRate / 100 / 360	--当期每天应收利息
					--查询还款时间所在记录
					SELECT @TempDate=BeginDate,@TempInterest=Interest FROM dbo.RepaymentComplete WHERE [Status]=1 AND LoanID=@LoanID AND @RepayDate >= BeginDate AND @RepayDate <= EndDate
					--更新还款时间所在记录及以后记录为作废
					UPDATE dbo.RepaymentComplete SET [Status]=2 WHERE LoanID=@LoanID AND [Status]=1 AND @RepayDate <= EndDate
					--还款时间所在记录处理
					IF(@TempDate < @RepayDate)--如果还款时间所在记录的开始时间小于还款时间
					BEGIN
						SET @BeginDate = DATEADD(day,-1,@RepayDate)--取还款前一天日期
						--插入还款时间所在记录开始时间到还款前一天的计息明细
						EXEC dbo.Proc_RepaymentCompleteInsert @TempDate, -- date
								@BeginDate, -- date
								@TempInterest, -- decimal
								@LoanID -- int
					END
					--插入还款日期到最后计息日期(还款日前一天)的计息明细
					SET @EndDate = DATEADD(day,-1,@EndDate)
					EXEC dbo.Proc_RepaymentCompleteInsert @RePayDate, -- date
							@EndDate, -- date
							@PlanPeReInterest, -- decimal
							@LoanID -- int
					UPDATE dbo.Loan SET IfOnPlan=0 WHERE ID=@LoanID
					UPDATE dbo.RepaymentPlan SET [Status]=2 WHERE LoanID=@LoanID AND [Status]=0
				END
			END
			--------插入还款记录begin--------
			INSERT INTO dbo.RepaymentRecord(
				RepayDate,
				Principal,
				Interest,
				CreateTime,
				CreateUserID,
				LoanID
			)VALUES(
				@RepayDate,
				@Principal,
				@Interest,
				@CreateTime,
				@CreateUserID,
				@LoanID			
			)
			--------插入还款记录end--------
		COMMIT TRAN
        RETURN 1;
    END TRY
	BEGIN CATCH
		IF XACT_STATE()=-1
		ROLLBACK TRAN;
		RETURN 0;
	END CATCH
END
GO
/****** Object:  Default [DF__Repayment__LoanI__5EBF139D]    Script Date: 05/29/2015 18:18:46 ******/
ALTER TABLE [dbo].[RepaymentInfoTemp] ADD  DEFAULT ((0)) FOR [LoanID]
GO
/****** Object:  Default [DF_Loan_IfOnPlan]    Script Date: 05/29/2015 18:18:46 ******/
ALTER TABLE [dbo].[Loan] ADD  CONSTRAINT [DF_Loan_IfOnPlan]  DEFAULT ((1)) FOR [IfOnPlan]
GO
/****** Object:  Default [DF_RepaymentComplete_Status]    Script Date: 05/29/2015 18:18:47 ******/
ALTER TABLE [dbo].[RepaymentComplete] ADD  CONSTRAINT [DF_RepaymentComplete_Status]  DEFAULT ((1)) FOR [Status]
GO
/****** Object:  Default [DF__Repayment__Creat__7D439ABD]    Script Date: 05/29/2015 18:18:47 ******/
ALTER TABLE [dbo].[RepaymentRecord] ADD  CONSTRAINT [DF__Repayment__Creat__7D439ABD]  DEFAULT (getdate()) FOR [CreateTime]
GO
/****** Object:  ForeignKey [FK_RepaymentComplete_Loan]    Script Date: 05/29/2015 18:18:47 ******/
ALTER TABLE [dbo].[RepaymentComplete]  WITH CHECK ADD  CONSTRAINT [FK_RepaymentComplete_Loan] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loan] ([ID])
GO
ALTER TABLE [dbo].[RepaymentComplete] CHECK CONSTRAINT [FK_RepaymentComplete_Loan]
GO
/****** Object:  ForeignKey [FK_RepaymentRecord_Loan]    Script Date: 05/29/2015 18:18:47 ******/
ALTER TABLE [dbo].[RepaymentRecord]  WITH CHECK ADD  CONSTRAINT [FK_RepaymentRecord_Loan] FOREIGN KEY([LoanID])
REFERENCES [dbo].[Loan] ([ID])
GO
ALTER TABLE [dbo].[RepaymentRecord] CHECK CONSTRAINT [FK_RepaymentRecord_Loan]
GO


INSERT INTO dbo.[User]
        ( LoginName ,
          Password ,
          RealName ,
          CreateTime ,
          IsActive ,
          Email ,
          Mobile ,
          Type ,
          LoanTypePermission
        )
VALUES  ( N'admin' , -- LoginName - nvarchar(50)
          N'e10adc3949ba59abbe56e057f20f883e' , -- Password - nvarchar(100)
          N'管理员' , -- RealName - nvarchar(20)
          '2015-05-30 02:20:37' , -- CreateTime - datetime
          1 , -- IsActive - bit
          N'' , -- Email - nvarchar(50)
          N'' , -- Mobile - nvarchar(50)
          1 , -- Type - smallint
          ''  -- LoanTypePermission - varchar(50)
        )
INSERT INTO dbo.DimRepaymentMethod
        ( Name )
VALUES  ( N'按月付息到期还本'  -- Name - nvarchar(20)
          )
INSERT INTO dbo.DimRepaymentMethod
        ( Name )
VALUES  ( N'按月平息'  -- Name - nvarchar(20)
          )