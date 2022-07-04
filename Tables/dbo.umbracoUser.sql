CREATE TABLE [dbo].[umbracoUser] (
  [id] [int] IDENTITY,
  [userDisabled] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userDisabled] DEFAULT ('0'),
  [userNoConsole] [bit] NOT NULL CONSTRAINT [DF_umbracoUser_userNoConsole] DEFAULT ('0'),
  [userName] [nvarchar](255) NOT NULL,
  [userLogin] [nvarchar](125) NOT NULL,
  [userPassword] [nvarchar](500) NOT NULL,
  [passwordConfig] [nvarchar](500) NULL,
  [userEmail] [nvarchar](255) NOT NULL,
  [userLanguage] [nvarchar](10) NULL,
  [securityStampToken] [nvarchar](255) NULL,
  [failedLoginAttempts] [int] NULL,
  [lastLockoutDate] [datetime] NULL,
  [lastPasswordChangeDate] [datetime] NULL,
  [lastLoginDate] [datetime] NULL,
  [emailConfirmedDate] [datetime] NULL,
  [invitedDate] [datetime] NULL,
  [createDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoUser_createDate] DEFAULT (getdate()),
  [updateDate] [datetime] NOT NULL CONSTRAINT [DF_umbracoUser_updateDate] DEFAULT (getdate()),
  [avatar] [nvarchar](500) NULL,
  [tourData] [ntext] NULL,
  CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO

CREATE INDEX [IX_umbracoUser_userLogin]
  ON [dbo].[umbracoUser] ([userLogin])
  ON [PRIMARY]
GO