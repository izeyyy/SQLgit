CREATE TABLE [dbo].[umbracoUser2UserGroup] (
  [userId] [int] NOT NULL,
  [userGroupId] [int] NOT NULL,
  CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED ([userId], [userGroupId])
)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[umbracoUser2UserGroup]
  ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [dbo].[umbracoUser] ([id])
GO

ALTER TABLE [dbo].[umbracoUser2UserGroup]
  ADD CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY ([userGroupId]) REFERENCES [dbo].[umbracoUserGroup] ([id])
GO