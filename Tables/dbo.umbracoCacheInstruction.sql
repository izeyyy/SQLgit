CREATE TABLE [dbo].[umbracoCacheInstruction] (
  [id] [int] IDENTITY,
  [utcStamp] [datetime] NOT NULL,
  [jsonInstruction] [ntext] NOT NULL,
  [originated] [nvarchar](500) NOT NULL,
  [instructionCount] [int] NOT NULL CONSTRAINT [DF_umbracoCacheInstruction_instructionCount] DEFAULT ('1'),
  CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED ([id])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO