#define LOG_LOOC	(1 << 15)

#define INDIVIDUAL_LOOC_LOG	(LOG_LOOC)

#undef INDIVIDUAL_SHOW_ALL_LOG
#define INDIVIDUAL_SHOW_ALL_LOG		(LOG_ATTACK | LOG_SAY | LOG_WHISPER | LOG_EMOTE | LOG_DSAY | LOG_PDA | LOG_CHAT | LOG_COMMENT | LOG_TELECOMMS | LOG_OOC | LOG_ADMIN | LOG_OWNERSHIP | LOG_GAME | LOG_LOOC)