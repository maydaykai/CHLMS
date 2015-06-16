DECLARE @LoadId INT=84
DELETE FROM dbo.RepaymentPlan WHERE LoanID=@LoadId
DELETE FROM dbo.RepaymentComplete WHERE LoanID=@LoadId
DELETE FROM dbo.RepaymentRecord WHERE LoanID=@LoadId
DELETE FROM dbo.Loan WHERE ID=@LoadId