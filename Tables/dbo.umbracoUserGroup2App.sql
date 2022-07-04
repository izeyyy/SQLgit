CREATE TABLE [dbo].[umbracoUserGroup2App] (
  [userGroupId] [int] NOT NULL,
  [app] [nvarchar](50) NOT NULL,
  CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED ([userGroupId], [app])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUserGroup2App]
  ADD CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [dbo].[umbracoUserGroup] ([id])
GO