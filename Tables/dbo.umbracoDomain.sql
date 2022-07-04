CREATE TABLE [dbo].[umbracoDomain] (
  [id] [int] IDENTITY,
  [domainDefaultLanguage] [int] NULL,
  [domainRootStructureID] [int] NULL,
  [domainName] [nvarchar](255) NOT NULL,
  CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoDomain]
  ADD CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [dbo].[umbracoNode] ([id])
GO