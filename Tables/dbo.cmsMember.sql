CREATE TABLE [dbo].[cmsMember] (
  [nodeId] [int] NOT NULL,
  [Email] [nvarchar](1000) NOT NULL CONSTRAINT [DF_cmsMember_Email] DEFAULT (''''),
  [LoginName] [nvarchar](1000) NOT NULL CONSTRAINT [DF_cmsMember_LoginName] DEFAULT (''''),
  [Password] [nvarchar](1000) NOT NULL CONSTRAINT [DF_cmsMember_Password] DEFAULT (''''),
  [passwordConfig] [nvarchar](500) NULL,
  [securityStampToken] [nvarchar](255) NULL,
  [emailConfirmedDate] [datetime] NULL,
  [failedPasswordAttempts] [int] NULL,
  [isLockedOut] [bit] NULL CONSTRAINT [DF_cmsMember_isLockedOut] DEFAULT ('0'),
  [isApproved] [bit] NOT NULL CONSTRAINT [DF_cmsMember_isApproved] DEFAULT ('1'),
  [lastLoginDate] [datetime] NULL,
  [lastLockoutDate] [datetime] NULL,
  [lastPasswordChangeDate] [datetime] NULL,
  CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED ([nodeId])
)
ON [PRIMARY]
GO

CREATE INDEX [IX_cmsMember_LoginName]
  ON [dbo].[cmsMember] ([LoginName])
  ON [PRIMARY]
GO

ALTER TABLE [dbo].[cmsMember]
  ADD CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY ([nodeId]) REFERENCES [dbo].[umbracoContent] ([nodeId])
GO