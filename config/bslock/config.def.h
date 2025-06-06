/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[BG] =       "#111111",    /* after initialization */
	[INIT] =     "#111111",    /* after initialization */
	[INPUT] =    "#5180e9",    /* during input */
	[FAILED] =   "#CC3333",    /* wrong password */
	[CAPS] =     "#ffff00",    /* CapsLock on */
	[BLOCKS] =   "#5511ee",    /* Blocks (key feedback) */
};

/*
 * Xresources preferences to load at startup
 */
ResourcePref resources[] = {
		{ "background",   STRING,  &colorname[BG] },
		{ "color0",       STRING,  &colorname[INIT] },
		{ "accent",       STRING,  &colorname[INPUT] },
		{ "color1",       STRING,  &colorname[FAILED] },
		{ "color3",       STRING,  &colorname[CAPS] },
		{ "accent",       STRING,  &colorname[BLOCKS] },
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 0;

/* default message */
static const char * message = "What's the password for the Hera machine?";

/* text color */
static const char * text_color = "#ebdbb2";

/* font */
static const char *font_name = "-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso10646-1";

// The height of the bar
static const unsigned int bar_height = 15;

// Number of blocks/divisions of the bar for key feedback
static const unsigned int blocks_count = 10;

// Bar position (BAR_TOP or BAR_BOTTOM)
static const unsigned int bar_position = BAR_TOP;
