
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	89 cb                	mov    %ecx,%ebx
  if(argc != 3){
  11:	83 3b 03             	cmpl   $0x3,(%ebx)
  14:	74 17                	je     2d <main+0x2d>
    printf(2, "Usage: ln old new\n");
  16:	83 ec 08             	sub    $0x8,%esp
  19:	68 f3 08 00 00       	push   $0x8f3
  1e:	6a 02                	push   $0x2
  20:	e8 18 05 00 00       	call   53d <printf>
  25:	83 c4 10             	add    $0x10,%esp
    exit();
  28:	e8 71 03 00 00       	call   39e <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2d:	8b 43 04             	mov    0x4(%ebx),%eax
  30:	83 c0 08             	add    $0x8,%eax
  33:	8b 10                	mov    (%eax),%edx
  35:	8b 43 04             	mov    0x4(%ebx),%eax
  38:	83 c0 04             	add    $0x4,%eax
  3b:	8b 00                	mov    (%eax),%eax
  3d:	83 ec 08             	sub    $0x8,%esp
  40:	52                   	push   %edx
  41:	50                   	push   %eax
  42:	e8 b7 03 00 00       	call   3fe <link>
  47:	83 c4 10             	add    $0x10,%esp
  4a:	85 c0                	test   %eax,%eax
  4c:	79 21                	jns    6f <main+0x6f>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4e:	8b 43 04             	mov    0x4(%ebx),%eax
  51:	83 c0 08             	add    $0x8,%eax
  54:	8b 10                	mov    (%eax),%edx
  56:	8b 43 04             	mov    0x4(%ebx),%eax
  59:	83 c0 04             	add    $0x4,%eax
  5c:	8b 00                	mov    (%eax),%eax
  5e:	52                   	push   %edx
  5f:	50                   	push   %eax
  60:	68 06 09 00 00       	push   $0x906
  65:	6a 02                	push   $0x2
  67:	e8 d1 04 00 00       	call   53d <printf>
  6c:	83 c4 10             	add    $0x10,%esp
  exit();
  6f:	e8 2a 03 00 00       	call   39e <exit>

00000074 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  74:	55                   	push   %ebp
  75:	89 e5                	mov    %esp,%ebp
  77:	57                   	push   %edi
  78:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  7c:	8b 55 10             	mov    0x10(%ebp),%edx
  7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  82:	89 cb                	mov    %ecx,%ebx
  84:	89 df                	mov    %ebx,%edi
  86:	89 d1                	mov    %edx,%ecx
  88:	fc                   	cld    
  89:	f3 aa                	rep stos %al,%es:(%edi)
  8b:	89 ca                	mov    %ecx,%edx
  8d:	89 fb                	mov    %edi,%ebx
  8f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  92:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  95:	90                   	nop
  96:	5b                   	pop    %ebx
  97:	5f                   	pop    %edi
  98:	5d                   	pop    %ebp
  99:	c3                   	ret    

0000009a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9a:	55                   	push   %ebp
  9b:	89 e5                	mov    %esp,%ebp
  9d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a6:	90                   	nop
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	8d 50 01             	lea    0x1(%eax),%edx
  ad:	89 55 08             	mov    %edx,0x8(%ebp)
  b0:	8b 55 0c             	mov    0xc(%ebp),%edx
  b3:	8d 4a 01             	lea    0x1(%edx),%ecx
  b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b9:	0f b6 12             	movzbl (%edx),%edx
  bc:	88 10                	mov    %dl,(%eax)
  be:	0f b6 00             	movzbl (%eax),%eax
  c1:	84 c0                	test   %al,%al
  c3:	75 e2                	jne    a7 <strcpy+0xd>
    ;
  return os;
  c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c8:	c9                   	leave  
  c9:	c3                   	ret    

000000ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ca:	55                   	push   %ebp
  cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cd:	eb 08                	jmp    d7 <strcmp+0xd>
    p++, q++;
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 00             	movzbl (%eax),%eax
  dd:	84 c0                	test   %al,%al
  df:	74 10                	je     f1 <strcmp+0x27>
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 10             	movzbl (%eax),%edx
  e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	38 c2                	cmp    %al,%dl
  ef:	74 de                	je     cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 d0             	movzbl %al,%edx
  fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  fd:	0f b6 00             	movzbl (%eax),%eax
 100:	0f b6 c0             	movzbl %al,%eax
 103:	29 c2                	sub    %eax,%edx
 105:	89 d0                	mov    %edx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	01 d0                	add    %edx,%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	84 c0                	test   %al,%al
 129:	75 ed                	jne    118 <strlen+0xf>
    ;
  return n;
 12b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12e:	c9                   	leave  
 12f:	c3                   	ret    

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 133:	8b 45 10             	mov    0x10(%ebp),%eax
 136:	50                   	push   %eax
 137:	ff 75 0c             	pushl  0xc(%ebp)
 13a:	ff 75 08             	pushl  0x8(%ebp)
 13d:	e8 32 ff ff ff       	call   74 <stosb>
 142:	83 c4 0c             	add    $0xc,%esp
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18a:	eb 42                	jmp    1ce <gets+0x51>
    cc = read(0, &c, 1);
 18c:	83 ec 04             	sub    $0x4,%esp
 18f:	6a 01                	push   $0x1
 191:	8d 45 ef             	lea    -0x11(%ebp),%eax
 194:	50                   	push   %eax
 195:	6a 00                	push   $0x0
 197:	e8 1a 02 00 00       	call   3b6 <read>
 19c:	83 c4 10             	add    $0x10,%esp
 19f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1a6:	7e 33                	jle    1db <gets+0x5e>
      break;
    buf[i++] = c;
 1a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ab:	8d 50 01             	lea    0x1(%eax),%edx
 1ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b1:	89 c2                	mov    %eax,%edx
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
 1b6:	01 c2                	add    %eax,%edx
 1b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bc:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	3c 0a                	cmp    $0xa,%al
 1c4:	74 16                	je     1dc <gets+0x5f>
 1c6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ca:	3c 0d                	cmp    $0xd,%al
 1cc:	74 0e                	je     1dc <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d1:	83 c0 01             	add    $0x1,%eax
 1d4:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d7:	7c b3                	jl     18c <gets+0xf>
 1d9:	eb 01                	jmp    1dc <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1db:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	01 d0                	add    %edx,%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	83 ec 08             	sub    $0x8,%esp
 1f5:	6a 00                	push   $0x0
 1f7:	ff 75 08             	pushl  0x8(%ebp)
 1fa:	e8 df 01 00 00       	call   3de <open>
 1ff:	83 c4 10             	add    $0x10,%esp
 202:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 205:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 209:	79 07                	jns    212 <stat+0x26>
    return -1;
 20b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 210:	eb 25                	jmp    237 <stat+0x4b>
  r = fstat(fd, st);
 212:	83 ec 08             	sub    $0x8,%esp
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 f4             	pushl  -0xc(%ebp)
 21b:	e8 d6 01 00 00       	call   3f6 <fstat>
 220:	83 c4 10             	add    $0x10,%esp
 223:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 226:	83 ec 0c             	sub    $0xc,%esp
 229:	ff 75 f4             	pushl  -0xc(%ebp)
 22c:	e8 95 01 00 00       	call   3c6 <close>
 231:	83 c4 10             	add    $0x10,%esp
  return r;
 234:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <atoi>:

int
atoi(const char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 246:	eb 04                	jmp    24c <atoi+0x13>
 248:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	3c 20                	cmp    $0x20,%al
 254:	74 f2                	je     248 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	0f b6 00             	movzbl (%eax),%eax
 25c:	3c 2d                	cmp    $0x2d,%al
 25e:	75 07                	jne    267 <atoi+0x2e>
 260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 265:	eb 05                	jmp    26c <atoi+0x33>
 267:	b8 01 00 00 00       	mov    $0x1,%eax
 26c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	0f b6 00             	movzbl (%eax),%eax
 275:	3c 2b                	cmp    $0x2b,%al
 277:	74 0a                	je     283 <atoi+0x4a>
 279:	8b 45 08             	mov    0x8(%ebp),%eax
 27c:	0f b6 00             	movzbl (%eax),%eax
 27f:	3c 2d                	cmp    $0x2d,%al
 281:	75 2b                	jne    2ae <atoi+0x75>
    s++;
 283:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 287:	eb 25                	jmp    2ae <atoi+0x75>
    n = n*10 + *s++ - '0';
 289:	8b 55 fc             	mov    -0x4(%ebp),%edx
 28c:	89 d0                	mov    %edx,%eax
 28e:	c1 e0 02             	shl    $0x2,%eax
 291:	01 d0                	add    %edx,%eax
 293:	01 c0                	add    %eax,%eax
 295:	89 c1                	mov    %eax,%ecx
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	8d 50 01             	lea    0x1(%eax),%edx
 29d:	89 55 08             	mov    %edx,0x8(%ebp)
 2a0:	0f b6 00             	movzbl (%eax),%eax
 2a3:	0f be c0             	movsbl %al,%eax
 2a6:	01 c8                	add    %ecx,%eax
 2a8:	83 e8 30             	sub    $0x30,%eax
 2ab:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 2ae:	8b 45 08             	mov    0x8(%ebp),%eax
 2b1:	0f b6 00             	movzbl (%eax),%eax
 2b4:	3c 2f                	cmp    $0x2f,%al
 2b6:	7e 0a                	jle    2c2 <atoi+0x89>
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	0f b6 00             	movzbl (%eax),%eax
 2be:	3c 39                	cmp    $0x39,%al
 2c0:	7e c7                	jle    289 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 2c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2c5:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 2c9:	c9                   	leave  
 2ca:	c3                   	ret    

000002cb <atoo>:

int
atoo(const char *s)
{
 2cb:	55                   	push   %ebp
 2cc:	89 e5                	mov    %esp,%ebp
 2ce:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2d8:	eb 04                	jmp    2de <atoo+0x13>
 2da:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2de:	8b 45 08             	mov    0x8(%ebp),%eax
 2e1:	0f b6 00             	movzbl (%eax),%eax
 2e4:	3c 20                	cmp    $0x20,%al
 2e6:	74 f2                	je     2da <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	0f b6 00             	movzbl (%eax),%eax
 2ee:	3c 2d                	cmp    $0x2d,%al
 2f0:	75 07                	jne    2f9 <atoo+0x2e>
 2f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2f7:	eb 05                	jmp    2fe <atoo+0x33>
 2f9:	b8 01 00 00 00       	mov    $0x1,%eax
 2fe:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 301:	8b 45 08             	mov    0x8(%ebp),%eax
 304:	0f b6 00             	movzbl (%eax),%eax
 307:	3c 2b                	cmp    $0x2b,%al
 309:	74 0a                	je     315 <atoo+0x4a>
 30b:	8b 45 08             	mov    0x8(%ebp),%eax
 30e:	0f b6 00             	movzbl (%eax),%eax
 311:	3c 2d                	cmp    $0x2d,%al
 313:	75 27                	jne    33c <atoo+0x71>
    s++;
 315:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 319:	eb 21                	jmp    33c <atoo+0x71>
    n = n*8 + *s++ - '0';
 31b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 31e:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 325:	8b 45 08             	mov    0x8(%ebp),%eax
 328:	8d 50 01             	lea    0x1(%eax),%edx
 32b:	89 55 08             	mov    %edx,0x8(%ebp)
 32e:	0f b6 00             	movzbl (%eax),%eax
 331:	0f be c0             	movsbl %al,%eax
 334:	01 c8                	add    %ecx,%eax
 336:	83 e8 30             	sub    $0x30,%eax
 339:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	3c 2f                	cmp    $0x2f,%al
 344:	7e 0a                	jle    350 <atoo+0x85>
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	0f b6 00             	movzbl (%eax),%eax
 34c:	3c 37                	cmp    $0x37,%al
 34e:	7e cb                	jle    31b <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 350:	8b 45 f8             	mov    -0x8(%ebp),%eax
 353:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 357:	c9                   	leave  
 358:	c3                   	ret    

00000359 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 359:	55                   	push   %ebp
 35a:	89 e5                	mov    %esp,%ebp
 35c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 365:	8b 45 0c             	mov    0xc(%ebp),%eax
 368:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 36b:	eb 17                	jmp    384 <memmove+0x2b>
    *dst++ = *src++;
 36d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 370:	8d 50 01             	lea    0x1(%eax),%edx
 373:	89 55 fc             	mov    %edx,-0x4(%ebp)
 376:	8b 55 f8             	mov    -0x8(%ebp),%edx
 379:	8d 4a 01             	lea    0x1(%edx),%ecx
 37c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 37f:	0f b6 12             	movzbl (%edx),%edx
 382:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 384:	8b 45 10             	mov    0x10(%ebp),%eax
 387:	8d 50 ff             	lea    -0x1(%eax),%edx
 38a:	89 55 10             	mov    %edx,0x10(%ebp)
 38d:	85 c0                	test   %eax,%eax
 38f:	7f dc                	jg     36d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 391:	8b 45 08             	mov    0x8(%ebp),%eax
}
 394:	c9                   	leave  
 395:	c3                   	ret    

00000396 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 396:	b8 01 00 00 00       	mov    $0x1,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <exit>:
SYSCALL(exit)
 39e:	b8 02 00 00 00       	mov    $0x2,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <wait>:
SYSCALL(wait)
 3a6:	b8 03 00 00 00       	mov    $0x3,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <pipe>:
SYSCALL(pipe)
 3ae:	b8 04 00 00 00       	mov    $0x4,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <read>:
SYSCALL(read)
 3b6:	b8 05 00 00 00       	mov    $0x5,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <write>:
SYSCALL(write)
 3be:	b8 10 00 00 00       	mov    $0x10,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <close>:
SYSCALL(close)
 3c6:	b8 15 00 00 00       	mov    $0x15,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <kill>:
SYSCALL(kill)
 3ce:	b8 06 00 00 00       	mov    $0x6,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <exec>:
SYSCALL(exec)
 3d6:	b8 07 00 00 00       	mov    $0x7,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <open>:
SYSCALL(open)
 3de:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <mknod>:
SYSCALL(mknod)
 3e6:	b8 11 00 00 00       	mov    $0x11,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <unlink>:
SYSCALL(unlink)
 3ee:	b8 12 00 00 00       	mov    $0x12,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <fstat>:
SYSCALL(fstat)
 3f6:	b8 08 00 00 00       	mov    $0x8,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <link>:
SYSCALL(link)
 3fe:	b8 13 00 00 00       	mov    $0x13,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <mkdir>:
SYSCALL(mkdir)
 406:	b8 14 00 00 00       	mov    $0x14,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <chdir>:
SYSCALL(chdir)
 40e:	b8 09 00 00 00       	mov    $0x9,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <dup>:
SYSCALL(dup)
 416:	b8 0a 00 00 00       	mov    $0xa,%eax
 41b:	cd 40                	int    $0x40
 41d:	c3                   	ret    

0000041e <getpid>:
SYSCALL(getpid)
 41e:	b8 0b 00 00 00       	mov    $0xb,%eax
 423:	cd 40                	int    $0x40
 425:	c3                   	ret    

00000426 <sbrk>:
SYSCALL(sbrk)
 426:	b8 0c 00 00 00       	mov    $0xc,%eax
 42b:	cd 40                	int    $0x40
 42d:	c3                   	ret    

0000042e <sleep>:
SYSCALL(sleep)
 42e:	b8 0d 00 00 00       	mov    $0xd,%eax
 433:	cd 40                	int    $0x40
 435:	c3                   	ret    

00000436 <uptime>:
SYSCALL(uptime)
 436:	b8 0e 00 00 00       	mov    $0xe,%eax
 43b:	cd 40                	int    $0x40
 43d:	c3                   	ret    

0000043e <halt>:
SYSCALL(halt)
 43e:	b8 16 00 00 00       	mov    $0x16,%eax
 443:	cd 40                	int    $0x40
 445:	c3                   	ret    

00000446 <date>:

# Added calls - Evghenii
SYSCALL(date)
 446:	b8 17 00 00 00       	mov    $0x17,%eax
 44b:	cd 40                	int    $0x40
 44d:	c3                   	ret    

0000044e <setuid>:
SYSCALL(setuid)
 44e:	b8 18 00 00 00       	mov    $0x18,%eax
 453:	cd 40                	int    $0x40
 455:	c3                   	ret    

00000456 <getuid>:
SYSCALL(getuid)
 456:	b8 19 00 00 00       	mov    $0x19,%eax
 45b:	cd 40                	int    $0x40
 45d:	c3                   	ret    

0000045e <setgid>:
SYSCALL(setgid)
 45e:	b8 1a 00 00 00       	mov    $0x1a,%eax
 463:	cd 40                	int    $0x40
 465:	c3                   	ret    

00000466 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	83 ec 18             	sub    $0x18,%esp
 46c:	8b 45 0c             	mov    0xc(%ebp),%eax
 46f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 472:	83 ec 04             	sub    $0x4,%esp
 475:	6a 01                	push   $0x1
 477:	8d 45 f4             	lea    -0xc(%ebp),%eax
 47a:	50                   	push   %eax
 47b:	ff 75 08             	pushl  0x8(%ebp)
 47e:	e8 3b ff ff ff       	call   3be <write>
 483:	83 c4 10             	add    $0x10,%esp
}
 486:	90                   	nop
 487:	c9                   	leave  
 488:	c3                   	ret    

00000489 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	53                   	push   %ebx
 48d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 490:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 497:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 49b:	74 17                	je     4b4 <printint+0x2b>
 49d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4a1:	79 11                	jns    4b4 <printint+0x2b>
    neg = 1;
 4a3:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	f7 d8                	neg    %eax
 4af:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4b2:	eb 06                	jmp    4ba <printint+0x31>
  } else {
    x = xx;
 4b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4c1:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4c4:	8d 41 01             	lea    0x1(%ecx),%eax
 4c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4ca:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d0:	ba 00 00 00 00       	mov    $0x0,%edx
 4d5:	f7 f3                	div    %ebx
 4d7:	89 d0                	mov    %edx,%eax
 4d9:	0f b6 80 90 0b 00 00 	movzbl 0xb90(%eax),%eax
 4e0:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4e4:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ea:	ba 00 00 00 00       	mov    $0x0,%edx
 4ef:	f7 f3                	div    %ebx
 4f1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4f8:	75 c7                	jne    4c1 <printint+0x38>
  if(neg)
 4fa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4fe:	74 2d                	je     52d <printint+0xa4>
    buf[i++] = '-';
 500:	8b 45 f4             	mov    -0xc(%ebp),%eax
 503:	8d 50 01             	lea    0x1(%eax),%edx
 506:	89 55 f4             	mov    %edx,-0xc(%ebp)
 509:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 50e:	eb 1d                	jmp    52d <printint+0xa4>
    putc(fd, buf[i]);
 510:	8d 55 dc             	lea    -0x24(%ebp),%edx
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	01 d0                	add    %edx,%eax
 518:	0f b6 00             	movzbl (%eax),%eax
 51b:	0f be c0             	movsbl %al,%eax
 51e:	83 ec 08             	sub    $0x8,%esp
 521:	50                   	push   %eax
 522:	ff 75 08             	pushl  0x8(%ebp)
 525:	e8 3c ff ff ff       	call   466 <putc>
 52a:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 52d:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 531:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 535:	79 d9                	jns    510 <printint+0x87>
    putc(fd, buf[i]);
}
 537:	90                   	nop
 538:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 53b:	c9                   	leave  
 53c:	c3                   	ret    

0000053d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 53d:	55                   	push   %ebp
 53e:	89 e5                	mov    %esp,%ebp
 540:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 543:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 54a:	8d 45 0c             	lea    0xc(%ebp),%eax
 54d:	83 c0 04             	add    $0x4,%eax
 550:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 553:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 55a:	e9 59 01 00 00       	jmp    6b8 <printf+0x17b>
    c = fmt[i] & 0xff;
 55f:	8b 55 0c             	mov    0xc(%ebp),%edx
 562:	8b 45 f0             	mov    -0x10(%ebp),%eax
 565:	01 d0                	add    %edx,%eax
 567:	0f b6 00             	movzbl (%eax),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	25 ff 00 00 00       	and    $0xff,%eax
 572:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 575:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 579:	75 2c                	jne    5a7 <printf+0x6a>
      if(c == '%'){
 57b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 57f:	75 0c                	jne    58d <printf+0x50>
        state = '%';
 581:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 588:	e9 27 01 00 00       	jmp    6b4 <printf+0x177>
      } else {
        putc(fd, c);
 58d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 590:	0f be c0             	movsbl %al,%eax
 593:	83 ec 08             	sub    $0x8,%esp
 596:	50                   	push   %eax
 597:	ff 75 08             	pushl  0x8(%ebp)
 59a:	e8 c7 fe ff ff       	call   466 <putc>
 59f:	83 c4 10             	add    $0x10,%esp
 5a2:	e9 0d 01 00 00       	jmp    6b4 <printf+0x177>
      }
    } else if(state == '%'){
 5a7:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 5ab:	0f 85 03 01 00 00    	jne    6b4 <printf+0x177>
      if(c == 'd'){
 5b1:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5b5:	75 1e                	jne    5d5 <printf+0x98>
        printint(fd, *ap, 10, 1);
 5b7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ba:	8b 00                	mov    (%eax),%eax
 5bc:	6a 01                	push   $0x1
 5be:	6a 0a                	push   $0xa
 5c0:	50                   	push   %eax
 5c1:	ff 75 08             	pushl  0x8(%ebp)
 5c4:	e8 c0 fe ff ff       	call   489 <printint>
 5c9:	83 c4 10             	add    $0x10,%esp
        ap++;
 5cc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d0:	e9 d8 00 00 00       	jmp    6ad <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 5d5:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5d9:	74 06                	je     5e1 <printf+0xa4>
 5db:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5df:	75 1e                	jne    5ff <printf+0xc2>
        printint(fd, *ap, 16, 0);
 5e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e4:	8b 00                	mov    (%eax),%eax
 5e6:	6a 00                	push   $0x0
 5e8:	6a 10                	push   $0x10
 5ea:	50                   	push   %eax
 5eb:	ff 75 08             	pushl  0x8(%ebp)
 5ee:	e8 96 fe ff ff       	call   489 <printint>
 5f3:	83 c4 10             	add    $0x10,%esp
        ap++;
 5f6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5fa:	e9 ae 00 00 00       	jmp    6ad <printf+0x170>
      } else if(c == 's'){
 5ff:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 603:	75 43                	jne    648 <printf+0x10b>
        s = (char*)*ap;
 605:	8b 45 e8             	mov    -0x18(%ebp),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 60d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 611:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 615:	75 25                	jne    63c <printf+0xff>
          s = "(null)";
 617:	c7 45 f4 1a 09 00 00 	movl   $0x91a,-0xc(%ebp)
        while(*s != 0){
 61e:	eb 1c                	jmp    63c <printf+0xff>
          putc(fd, *s);
 620:	8b 45 f4             	mov    -0xc(%ebp),%eax
 623:	0f b6 00             	movzbl (%eax),%eax
 626:	0f be c0             	movsbl %al,%eax
 629:	83 ec 08             	sub    $0x8,%esp
 62c:	50                   	push   %eax
 62d:	ff 75 08             	pushl  0x8(%ebp)
 630:	e8 31 fe ff ff       	call   466 <putc>
 635:	83 c4 10             	add    $0x10,%esp
          s++;
 638:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 63c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63f:	0f b6 00             	movzbl (%eax),%eax
 642:	84 c0                	test   %al,%al
 644:	75 da                	jne    620 <printf+0xe3>
 646:	eb 65                	jmp    6ad <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 648:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 64c:	75 1d                	jne    66b <printf+0x12e>
        putc(fd, *ap);
 64e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 651:	8b 00                	mov    (%eax),%eax
 653:	0f be c0             	movsbl %al,%eax
 656:	83 ec 08             	sub    $0x8,%esp
 659:	50                   	push   %eax
 65a:	ff 75 08             	pushl  0x8(%ebp)
 65d:	e8 04 fe ff ff       	call   466 <putc>
 662:	83 c4 10             	add    $0x10,%esp
        ap++;
 665:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 669:	eb 42                	jmp    6ad <printf+0x170>
      } else if(c == '%'){
 66b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 66f:	75 17                	jne    688 <printf+0x14b>
        putc(fd, c);
 671:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 674:	0f be c0             	movsbl %al,%eax
 677:	83 ec 08             	sub    $0x8,%esp
 67a:	50                   	push   %eax
 67b:	ff 75 08             	pushl  0x8(%ebp)
 67e:	e8 e3 fd ff ff       	call   466 <putc>
 683:	83 c4 10             	add    $0x10,%esp
 686:	eb 25                	jmp    6ad <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 688:	83 ec 08             	sub    $0x8,%esp
 68b:	6a 25                	push   $0x25
 68d:	ff 75 08             	pushl  0x8(%ebp)
 690:	e8 d1 fd ff ff       	call   466 <putc>
 695:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 698:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 69b:	0f be c0             	movsbl %al,%eax
 69e:	83 ec 08             	sub    $0x8,%esp
 6a1:	50                   	push   %eax
 6a2:	ff 75 08             	pushl  0x8(%ebp)
 6a5:	e8 bc fd ff ff       	call   466 <putc>
 6aa:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 6ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6b8:	8b 55 0c             	mov    0xc(%ebp),%edx
 6bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6be:	01 d0                	add    %edx,%eax
 6c0:	0f b6 00             	movzbl (%eax),%eax
 6c3:	84 c0                	test   %al,%al
 6c5:	0f 85 94 fe ff ff    	jne    55f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6cb:	90                   	nop
 6cc:	c9                   	leave  
 6cd:	c3                   	ret    

000006ce <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6ce:	55                   	push   %ebp
 6cf:	89 e5                	mov    %esp,%ebp
 6d1:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d4:	8b 45 08             	mov    0x8(%ebp),%eax
 6d7:	83 e8 08             	sub    $0x8,%eax
 6da:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6dd:	a1 ac 0b 00 00       	mov    0xbac,%eax
 6e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e5:	eb 24                	jmp    70b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ef:	77 12                	ja     703 <free+0x35>
 6f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f7:	77 24                	ja     71d <free+0x4f>
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 701:	77 1a                	ja     71d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	89 45 fc             	mov    %eax,-0x4(%ebp)
 70b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 711:	76 d4                	jbe    6e7 <free+0x19>
 713:	8b 45 fc             	mov    -0x4(%ebp),%eax
 716:	8b 00                	mov    (%eax),%eax
 718:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 71b:	76 ca                	jbe    6e7 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 71d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 720:	8b 40 04             	mov    0x4(%eax),%eax
 723:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	01 c2                	add    %eax,%edx
 72f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 732:	8b 00                	mov    (%eax),%eax
 734:	39 c2                	cmp    %eax,%edx
 736:	75 24                	jne    75c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 738:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73b:	8b 50 04             	mov    0x4(%eax),%edx
 73e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 741:	8b 00                	mov    (%eax),%eax
 743:	8b 40 04             	mov    0x4(%eax),%eax
 746:	01 c2                	add    %eax,%edx
 748:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 74e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 751:	8b 00                	mov    (%eax),%eax
 753:	8b 10                	mov    (%eax),%edx
 755:	8b 45 f8             	mov    -0x8(%ebp),%eax
 758:	89 10                	mov    %edx,(%eax)
 75a:	eb 0a                	jmp    766 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 75c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75f:	8b 10                	mov    (%eax),%edx
 761:	8b 45 f8             	mov    -0x8(%ebp),%eax
 764:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 766:	8b 45 fc             	mov    -0x4(%ebp),%eax
 769:	8b 40 04             	mov    0x4(%eax),%eax
 76c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 773:	8b 45 fc             	mov    -0x4(%ebp),%eax
 776:	01 d0                	add    %edx,%eax
 778:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77b:	75 20                	jne    79d <free+0xcf>
    p->s.size += bp->s.size;
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	8b 50 04             	mov    0x4(%eax),%edx
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	8b 40 04             	mov    0x4(%eax),%eax
 789:	01 c2                	add    %eax,%edx
 78b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 791:	8b 45 f8             	mov    -0x8(%ebp),%eax
 794:	8b 10                	mov    (%eax),%edx
 796:	8b 45 fc             	mov    -0x4(%ebp),%eax
 799:	89 10                	mov    %edx,(%eax)
 79b:	eb 08                	jmp    7a5 <free+0xd7>
  } else
    p->s.ptr = bp;
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a3:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a8:	a3 ac 0b 00 00       	mov    %eax,0xbac
}
 7ad:	90                   	nop
 7ae:	c9                   	leave  
 7af:	c3                   	ret    

000007b0 <morecore>:

static Header*
morecore(uint nu)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b6:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7bd:	77 07                	ja     7c6 <morecore+0x16>
    nu = 4096;
 7bf:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	c1 e0 03             	shl    $0x3,%eax
 7cc:	83 ec 0c             	sub    $0xc,%esp
 7cf:	50                   	push   %eax
 7d0:	e8 51 fc ff ff       	call   426 <sbrk>
 7d5:	83 c4 10             	add    $0x10,%esp
 7d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7db:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7df:	75 07                	jne    7e8 <morecore+0x38>
    return 0;
 7e1:	b8 00 00 00 00       	mov    $0x0,%eax
 7e6:	eb 26                	jmp    80e <morecore+0x5e>
  hp = (Header*)p;
 7e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f1:	8b 55 08             	mov    0x8(%ebp),%edx
 7f4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fa:	83 c0 08             	add    $0x8,%eax
 7fd:	83 ec 0c             	sub    $0xc,%esp
 800:	50                   	push   %eax
 801:	e8 c8 fe ff ff       	call   6ce <free>
 806:	83 c4 10             	add    $0x10,%esp
  return freep;
 809:	a1 ac 0b 00 00       	mov    0xbac,%eax
}
 80e:	c9                   	leave  
 80f:	c3                   	ret    

00000810 <malloc>:

void*
malloc(uint nbytes)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 816:	8b 45 08             	mov    0x8(%ebp),%eax
 819:	83 c0 07             	add    $0x7,%eax
 81c:	c1 e8 03             	shr    $0x3,%eax
 81f:	83 c0 01             	add    $0x1,%eax
 822:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 825:	a1 ac 0b 00 00       	mov    0xbac,%eax
 82a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 82d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 831:	75 23                	jne    856 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 833:	c7 45 f0 a4 0b 00 00 	movl   $0xba4,-0x10(%ebp)
 83a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83d:	a3 ac 0b 00 00       	mov    %eax,0xbac
 842:	a1 ac 0b 00 00       	mov    0xbac,%eax
 847:	a3 a4 0b 00 00       	mov    %eax,0xba4
    base.s.size = 0;
 84c:	c7 05 a8 0b 00 00 00 	movl   $0x0,0xba8
 853:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	8b 00                	mov    (%eax),%eax
 85b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 861:	8b 40 04             	mov    0x4(%eax),%eax
 864:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 867:	72 4d                	jb     8b6 <malloc+0xa6>
      if(p->s.size == nunits)
 869:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86c:	8b 40 04             	mov    0x4(%eax),%eax
 86f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 872:	75 0c                	jne    880 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	8b 10                	mov    (%eax),%edx
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	89 10                	mov    %edx,(%eax)
 87e:	eb 26                	jmp    8a6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	8b 40 04             	mov    0x4(%eax),%eax
 886:	2b 45 ec             	sub    -0x14(%ebp),%eax
 889:	89 c2                	mov    %eax,%edx
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	c1 e0 03             	shl    $0x3,%eax
 89a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 89d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8a3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a9:	a3 ac 0b 00 00       	mov    %eax,0xbac
      return (void*)(p + 1);
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	83 c0 08             	add    $0x8,%eax
 8b4:	eb 3b                	jmp    8f1 <malloc+0xe1>
    }
    if(p == freep)
 8b6:	a1 ac 0b 00 00       	mov    0xbac,%eax
 8bb:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8be:	75 1e                	jne    8de <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 8c0:	83 ec 0c             	sub    $0xc,%esp
 8c3:	ff 75 ec             	pushl  -0x14(%ebp)
 8c6:	e8 e5 fe ff ff       	call   7b0 <morecore>
 8cb:	83 c4 10             	add    $0x10,%esp
 8ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8d5:	75 07                	jne    8de <malloc+0xce>
        return 0;
 8d7:	b8 00 00 00 00       	mov    $0x0,%eax
 8dc:	eb 13                	jmp    8f1 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	8b 00                	mov    (%eax),%eax
 8e9:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8ec:	e9 6d ff ff ff       	jmp    85e <malloc+0x4e>
}
 8f1:	c9                   	leave  
 8f2:	c3                   	ret    
