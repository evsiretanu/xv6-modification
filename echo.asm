
_echo:     file format elf32-i386


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
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
  int i;

  for(i = 1; i < argc; i++)
  14:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  1b:	eb 3c                	jmp    59 <main+0x59>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  20:	83 c0 01             	add    $0x1,%eax
  23:	3b 03                	cmp    (%ebx),%eax
  25:	7d 07                	jge    2e <main+0x2e>
  27:	ba e4 08 00 00       	mov    $0x8e4,%edx
  2c:	eb 05                	jmp    33 <main+0x33>
  2e:	ba e6 08 00 00       	mov    $0x8e6,%edx
  33:	8b 45 f4             	mov    -0xc(%ebp),%eax
  36:	8d 0c 85 00 00 00 00 	lea    0x0(,%eax,4),%ecx
  3d:	8b 43 04             	mov    0x4(%ebx),%eax
  40:	01 c8                	add    %ecx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	52                   	push   %edx
  45:	50                   	push   %eax
  46:	68 e8 08 00 00       	push   $0x8e8
  4b:	6a 01                	push   $0x1
  4d:	e8 dc 04 00 00       	call   52e <printf>
  52:	83 c4 10             	add    $0x10,%esp
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  59:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5c:	3b 03                	cmp    (%ebx),%eax
  5e:	7c bd                	jl     1d <main+0x1d>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  60:	e8 2a 03 00 00       	call   38f <exit>

00000065 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  65:	55                   	push   %ebp
  66:	89 e5                	mov    %esp,%ebp
  68:	57                   	push   %edi
  69:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6d:	8b 55 10             	mov    0x10(%ebp),%edx
  70:	8b 45 0c             	mov    0xc(%ebp),%eax
  73:	89 cb                	mov    %ecx,%ebx
  75:	89 df                	mov    %ebx,%edi
  77:	89 d1                	mov    %edx,%ecx
  79:	fc                   	cld    
  7a:	f3 aa                	rep stos %al,%es:(%edi)
  7c:	89 ca                	mov    %ecx,%edx
  7e:	89 fb                	mov    %edi,%ebx
  80:	89 5d 08             	mov    %ebx,0x8(%ebp)
  83:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  86:	90                   	nop
  87:	5b                   	pop    %ebx
  88:	5f                   	pop    %edi
  89:	5d                   	pop    %ebp
  8a:	c3                   	ret    

0000008b <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  8b:	55                   	push   %ebp
  8c:	89 e5                	mov    %esp,%ebp
  8e:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  97:	90                   	nop
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	8d 50 01             	lea    0x1(%eax),%edx
  9e:	89 55 08             	mov    %edx,0x8(%ebp)
  a1:	8b 55 0c             	mov    0xc(%ebp),%edx
  a4:	8d 4a 01             	lea    0x1(%edx),%ecx
  a7:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  aa:	0f b6 12             	movzbl (%edx),%edx
  ad:	88 10                	mov    %dl,(%eax)
  af:	0f b6 00             	movzbl (%eax),%eax
  b2:	84 c0                	test   %al,%al
  b4:	75 e2                	jne    98 <strcpy+0xd>
    ;
  return os;
  b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  b9:	c9                   	leave  
  ba:	c3                   	ret    

000000bb <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bb:	55                   	push   %ebp
  bc:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  be:	eb 08                	jmp    c8 <strcmp+0xd>
    p++, q++;
  c0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	0f b6 00             	movzbl (%eax),%eax
  ce:	84 c0                	test   %al,%al
  d0:	74 10                	je     e2 <strcmp+0x27>
  d2:	8b 45 08             	mov    0x8(%ebp),%eax
  d5:	0f b6 10             	movzbl (%eax),%edx
  d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  db:	0f b6 00             	movzbl (%eax),%eax
  de:	38 c2                	cmp    %al,%dl
  e0:	74 de                	je     c0 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e2:	8b 45 08             	mov    0x8(%ebp),%eax
  e5:	0f b6 00             	movzbl (%eax),%eax
  e8:	0f b6 d0             	movzbl %al,%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	0f b6 c0             	movzbl %al,%eax
  f4:	29 c2                	sub    %eax,%edx
  f6:	89 d0                	mov    %edx,%eax
}
  f8:	5d                   	pop    %ebp
  f9:	c3                   	ret    

000000fa <strlen>:

uint
strlen(char *s)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 100:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 107:	eb 04                	jmp    10d <strlen+0x13>
 109:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	01 d0                	add    %edx,%eax
 115:	0f b6 00             	movzbl (%eax),%eax
 118:	84 c0                	test   %al,%al
 11a:	75 ed                	jne    109 <strlen+0xf>
    ;
  return n;
 11c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 11f:	c9                   	leave  
 120:	c3                   	ret    

00000121 <memset>:

void*
memset(void *dst, int c, uint n)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 124:	8b 45 10             	mov    0x10(%ebp),%eax
 127:	50                   	push   %eax
 128:	ff 75 0c             	pushl  0xc(%ebp)
 12b:	ff 75 08             	pushl  0x8(%ebp)
 12e:	e8 32 ff ff ff       	call   65 <stosb>
 133:	83 c4 0c             	add    $0xc,%esp
  return dst;
 136:	8b 45 08             	mov    0x8(%ebp),%eax
}
 139:	c9                   	leave  
 13a:	c3                   	ret    

0000013b <strchr>:

char*
strchr(const char *s, char c)
{
 13b:	55                   	push   %ebp
 13c:	89 e5                	mov    %esp,%ebp
 13e:	83 ec 04             	sub    $0x4,%esp
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 147:	eb 14                	jmp    15d <strchr+0x22>
    if(*s == c)
 149:	8b 45 08             	mov    0x8(%ebp),%eax
 14c:	0f b6 00             	movzbl (%eax),%eax
 14f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 152:	75 05                	jne    159 <strchr+0x1e>
      return (char*)s;
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	eb 13                	jmp    16c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 159:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
 160:	0f b6 00             	movzbl (%eax),%eax
 163:	84 c0                	test   %al,%al
 165:	75 e2                	jne    149 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 167:	b8 00 00 00 00       	mov    $0x0,%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <gets>:

char*
gets(char *buf, int max)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 174:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 17b:	eb 42                	jmp    1bf <gets+0x51>
    cc = read(0, &c, 1);
 17d:	83 ec 04             	sub    $0x4,%esp
 180:	6a 01                	push   $0x1
 182:	8d 45 ef             	lea    -0x11(%ebp),%eax
 185:	50                   	push   %eax
 186:	6a 00                	push   $0x0
 188:	e8 1a 02 00 00       	call   3a7 <read>
 18d:	83 c4 10             	add    $0x10,%esp
 190:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 193:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 197:	7e 33                	jle    1cc <gets+0x5e>
      break;
    buf[i++] = c;
 199:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19c:	8d 50 01             	lea    0x1(%eax),%edx
 19f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1a2:	89 c2                	mov    %eax,%edx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	01 c2                	add    %eax,%edx
 1a9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ad:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1af:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1b3:	3c 0a                	cmp    $0xa,%al
 1b5:	74 16                	je     1cd <gets+0x5f>
 1b7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1bb:	3c 0d                	cmp    $0xd,%al
 1bd:	74 0e                	je     1cd <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c2:	83 c0 01             	add    $0x1,%eax
 1c5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1c8:	7c b3                	jl     17d <gets+0xf>
 1ca:	eb 01                	jmp    1cd <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1cc:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	01 d0                	add    %edx,%eax
 1d5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1db:	c9                   	leave  
 1dc:	c3                   	ret    

000001dd <stat>:

int
stat(char *n, struct stat *st)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e3:	83 ec 08             	sub    $0x8,%esp
 1e6:	6a 00                	push   $0x0
 1e8:	ff 75 08             	pushl  0x8(%ebp)
 1eb:	e8 df 01 00 00       	call   3cf <open>
 1f0:	83 c4 10             	add    $0x10,%esp
 1f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1f6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1fa:	79 07                	jns    203 <stat+0x26>
    return -1;
 1fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 201:	eb 25                	jmp    228 <stat+0x4b>
  r = fstat(fd, st);
 203:	83 ec 08             	sub    $0x8,%esp
 206:	ff 75 0c             	pushl  0xc(%ebp)
 209:	ff 75 f4             	pushl  -0xc(%ebp)
 20c:	e8 d6 01 00 00       	call   3e7 <fstat>
 211:	83 c4 10             	add    $0x10,%esp
 214:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 217:	83 ec 0c             	sub    $0xc,%esp
 21a:	ff 75 f4             	pushl  -0xc(%ebp)
 21d:	e8 95 01 00 00       	call   3b7 <close>
 222:	83 c4 10             	add    $0x10,%esp
  return r;
 225:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 228:	c9                   	leave  
 229:	c3                   	ret    

0000022a <atoi>:

int
atoi(const char *s)
{
 22a:	55                   	push   %ebp
 22b:	89 e5                	mov    %esp,%ebp
 22d:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 230:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 237:	eb 04                	jmp    23d <atoi+0x13>
 239:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23d:	8b 45 08             	mov    0x8(%ebp),%eax
 240:	0f b6 00             	movzbl (%eax),%eax
 243:	3c 20                	cmp    $0x20,%al
 245:	74 f2                	je     239 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	0f b6 00             	movzbl (%eax),%eax
 24d:	3c 2d                	cmp    $0x2d,%al
 24f:	75 07                	jne    258 <atoi+0x2e>
 251:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 256:	eb 05                	jmp    25d <atoi+0x33>
 258:	b8 01 00 00 00       	mov    $0x1,%eax
 25d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	3c 2b                	cmp    $0x2b,%al
 268:	74 0a                	je     274 <atoi+0x4a>
 26a:	8b 45 08             	mov    0x8(%ebp),%eax
 26d:	0f b6 00             	movzbl (%eax),%eax
 270:	3c 2d                	cmp    $0x2d,%al
 272:	75 2b                	jne    29f <atoi+0x75>
    s++;
 274:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 278:	eb 25                	jmp    29f <atoi+0x75>
    n = n*10 + *s++ - '0';
 27a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 27d:	89 d0                	mov    %edx,%eax
 27f:	c1 e0 02             	shl    $0x2,%eax
 282:	01 d0                	add    %edx,%eax
 284:	01 c0                	add    %eax,%eax
 286:	89 c1                	mov    %eax,%ecx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8d 50 01             	lea    0x1(%eax),%edx
 28e:	89 55 08             	mov    %edx,0x8(%ebp)
 291:	0f b6 00             	movzbl (%eax),%eax
 294:	0f be c0             	movsbl %al,%eax
 297:	01 c8                	add    %ecx,%eax
 299:	83 e8 30             	sub    $0x30,%eax
 29c:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 29f:	8b 45 08             	mov    0x8(%ebp),%eax
 2a2:	0f b6 00             	movzbl (%eax),%eax
 2a5:	3c 2f                	cmp    $0x2f,%al
 2a7:	7e 0a                	jle    2b3 <atoi+0x89>
 2a9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ac:	0f b6 00             	movzbl (%eax),%eax
 2af:	3c 39                	cmp    $0x39,%al
 2b1:	7e c7                	jle    27a <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 2b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2b6:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    

000002bc <atoo>:

int
atoo(const char *s)
{
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 2c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 2c9:	eb 04                	jmp    2cf <atoo+0x13>
 2cb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2cf:	8b 45 08             	mov    0x8(%ebp),%eax
 2d2:	0f b6 00             	movzbl (%eax),%eax
 2d5:	3c 20                	cmp    $0x20,%al
 2d7:	74 f2                	je     2cb <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 2d9:	8b 45 08             	mov    0x8(%ebp),%eax
 2dc:	0f b6 00             	movzbl (%eax),%eax
 2df:	3c 2d                	cmp    $0x2d,%al
 2e1:	75 07                	jne    2ea <atoo+0x2e>
 2e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e8:	eb 05                	jmp    2ef <atoo+0x33>
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2f2:	8b 45 08             	mov    0x8(%ebp),%eax
 2f5:	0f b6 00             	movzbl (%eax),%eax
 2f8:	3c 2b                	cmp    $0x2b,%al
 2fa:	74 0a                	je     306 <atoo+0x4a>
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	0f b6 00             	movzbl (%eax),%eax
 302:	3c 2d                	cmp    $0x2d,%al
 304:	75 27                	jne    32d <atoo+0x71>
    s++;
 306:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 30a:	eb 21                	jmp    32d <atoo+0x71>
    n = n*8 + *s++ - '0';
 30c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 30f:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 316:	8b 45 08             	mov    0x8(%ebp),%eax
 319:	8d 50 01             	lea    0x1(%eax),%edx
 31c:	89 55 08             	mov    %edx,0x8(%ebp)
 31f:	0f b6 00             	movzbl (%eax),%eax
 322:	0f be c0             	movsbl %al,%eax
 325:	01 c8                	add    %ecx,%eax
 327:	83 e8 30             	sub    $0x30,%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 32d:	8b 45 08             	mov    0x8(%ebp),%eax
 330:	0f b6 00             	movzbl (%eax),%eax
 333:	3c 2f                	cmp    $0x2f,%al
 335:	7e 0a                	jle    341 <atoo+0x85>
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	0f b6 00             	movzbl (%eax),%eax
 33d:	3c 37                	cmp    $0x37,%al
 33f:	7e cb                	jle    30c <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 341:	8b 45 f8             	mov    -0x8(%ebp),%eax
 344:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 35c:	eb 17                	jmp    375 <memmove+0x2b>
    *dst++ = *src++;
 35e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 361:	8d 50 01             	lea    0x1(%eax),%edx
 364:	89 55 fc             	mov    %edx,-0x4(%ebp)
 367:	8b 55 f8             	mov    -0x8(%ebp),%edx
 36a:	8d 4a 01             	lea    0x1(%edx),%ecx
 36d:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 370:	0f b6 12             	movzbl (%edx),%edx
 373:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 375:	8b 45 10             	mov    0x10(%ebp),%eax
 378:	8d 50 ff             	lea    -0x1(%eax),%edx
 37b:	89 55 10             	mov    %edx,0x10(%ebp)
 37e:	85 c0                	test   %eax,%eax
 380:	7f dc                	jg     35e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 382:	8b 45 08             	mov    0x8(%ebp),%eax
}
 385:	c9                   	leave  
 386:	c3                   	ret    

00000387 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 387:	b8 01 00 00 00       	mov    $0x1,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <exit>:
SYSCALL(exit)
 38f:	b8 02 00 00 00       	mov    $0x2,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <wait>:
SYSCALL(wait)
 397:	b8 03 00 00 00       	mov    $0x3,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <pipe>:
SYSCALL(pipe)
 39f:	b8 04 00 00 00       	mov    $0x4,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <read>:
SYSCALL(read)
 3a7:	b8 05 00 00 00       	mov    $0x5,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <write>:
SYSCALL(write)
 3af:	b8 10 00 00 00       	mov    $0x10,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <close>:
SYSCALL(close)
 3b7:	b8 15 00 00 00       	mov    $0x15,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <kill>:
SYSCALL(kill)
 3bf:	b8 06 00 00 00       	mov    $0x6,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <exec>:
SYSCALL(exec)
 3c7:	b8 07 00 00 00       	mov    $0x7,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <open>:
SYSCALL(open)
 3cf:	b8 0f 00 00 00       	mov    $0xf,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <mknod>:
SYSCALL(mknod)
 3d7:	b8 11 00 00 00       	mov    $0x11,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <unlink>:
SYSCALL(unlink)
 3df:	b8 12 00 00 00       	mov    $0x12,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <fstat>:
SYSCALL(fstat)
 3e7:	b8 08 00 00 00       	mov    $0x8,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <link>:
SYSCALL(link)
 3ef:	b8 13 00 00 00       	mov    $0x13,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <mkdir>:
SYSCALL(mkdir)
 3f7:	b8 14 00 00 00       	mov    $0x14,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <chdir>:
SYSCALL(chdir)
 3ff:	b8 09 00 00 00       	mov    $0x9,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <dup>:
SYSCALL(dup)
 407:	b8 0a 00 00 00       	mov    $0xa,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <getpid>:
SYSCALL(getpid)
 40f:	b8 0b 00 00 00       	mov    $0xb,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <sbrk>:
SYSCALL(sbrk)
 417:	b8 0c 00 00 00       	mov    $0xc,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <sleep>:
SYSCALL(sleep)
 41f:	b8 0d 00 00 00       	mov    $0xd,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <uptime>:
SYSCALL(uptime)
 427:	b8 0e 00 00 00       	mov    $0xe,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <halt>:
SYSCALL(halt)
 42f:	b8 16 00 00 00       	mov    $0x16,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <date>:

# Added calls - Evghenii
SYSCALL(date)
 437:	b8 17 00 00 00       	mov    $0x17,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <setuid>:
SYSCALL(setuid)
 43f:	b8 18 00 00 00       	mov    $0x18,%eax
 444:	cd 40                	int    $0x40
 446:	c3                   	ret    

00000447 <getuid>:
SYSCALL(getuid)
 447:	b8 19 00 00 00       	mov    $0x19,%eax
 44c:	cd 40                	int    $0x40
 44e:	c3                   	ret    

0000044f <setgid>:
SYSCALL(setgid)
 44f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 454:	cd 40                	int    $0x40
 456:	c3                   	ret    

00000457 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 457:	55                   	push   %ebp
 458:	89 e5                	mov    %esp,%ebp
 45a:	83 ec 18             	sub    $0x18,%esp
 45d:	8b 45 0c             	mov    0xc(%ebp),%eax
 460:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 463:	83 ec 04             	sub    $0x4,%esp
 466:	6a 01                	push   $0x1
 468:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46b:	50                   	push   %eax
 46c:	ff 75 08             	pushl  0x8(%ebp)
 46f:	e8 3b ff ff ff       	call   3af <write>
 474:	83 c4 10             	add    $0x10,%esp
}
 477:	90                   	nop
 478:	c9                   	leave  
 479:	c3                   	ret    

0000047a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 47a:	55                   	push   %ebp
 47b:	89 e5                	mov    %esp,%ebp
 47d:	53                   	push   %ebx
 47e:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 481:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 488:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 48c:	74 17                	je     4a5 <printint+0x2b>
 48e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 492:	79 11                	jns    4a5 <printint+0x2b>
    neg = 1;
 494:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 49b:	8b 45 0c             	mov    0xc(%ebp),%eax
 49e:	f7 d8                	neg    %eax
 4a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a3:	eb 06                	jmp    4ab <printint+0x31>
  } else {
    x = xx;
 4a5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4b2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b5:	8d 41 01             	lea    0x1(%ecx),%eax
 4b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4bb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c1:	ba 00 00 00 00       	mov    $0x0,%edx
 4c6:	f7 f3                	div    %ebx
 4c8:	89 d0                	mov    %edx,%eax
 4ca:	0f b6 80 60 0b 00 00 	movzbl 0xb60(%eax),%eax
 4d1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4db:	ba 00 00 00 00       	mov    $0x0,%edx
 4e0:	f7 f3                	div    %ebx
 4e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e9:	75 c7                	jne    4b2 <printint+0x38>
  if(neg)
 4eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ef:	74 2d                	je     51e <printint+0xa4>
    buf[i++] = '-';
 4f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f4:	8d 50 01             	lea    0x1(%eax),%edx
 4f7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4fa:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4ff:	eb 1d                	jmp    51e <printint+0xa4>
    putc(fd, buf[i]);
 501:	8d 55 dc             	lea    -0x24(%ebp),%edx
 504:	8b 45 f4             	mov    -0xc(%ebp),%eax
 507:	01 d0                	add    %edx,%eax
 509:	0f b6 00             	movzbl (%eax),%eax
 50c:	0f be c0             	movsbl %al,%eax
 50f:	83 ec 08             	sub    $0x8,%esp
 512:	50                   	push   %eax
 513:	ff 75 08             	pushl  0x8(%ebp)
 516:	e8 3c ff ff ff       	call   457 <putc>
 51b:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 51e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 522:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 526:	79 d9                	jns    501 <printint+0x87>
    putc(fd, buf[i]);
}
 528:	90                   	nop
 529:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 52c:	c9                   	leave  
 52d:	c3                   	ret    

0000052e <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 52e:	55                   	push   %ebp
 52f:	89 e5                	mov    %esp,%ebp
 531:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 534:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 53b:	8d 45 0c             	lea    0xc(%ebp),%eax
 53e:	83 c0 04             	add    $0x4,%eax
 541:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 544:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 54b:	e9 59 01 00 00       	jmp    6a9 <printf+0x17b>
    c = fmt[i] & 0xff;
 550:	8b 55 0c             	mov    0xc(%ebp),%edx
 553:	8b 45 f0             	mov    -0x10(%ebp),%eax
 556:	01 d0                	add    %edx,%eax
 558:	0f b6 00             	movzbl (%eax),%eax
 55b:	0f be c0             	movsbl %al,%eax
 55e:	25 ff 00 00 00       	and    $0xff,%eax
 563:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 566:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 56a:	75 2c                	jne    598 <printf+0x6a>
      if(c == '%'){
 56c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 570:	75 0c                	jne    57e <printf+0x50>
        state = '%';
 572:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 579:	e9 27 01 00 00       	jmp    6a5 <printf+0x177>
      } else {
        putc(fd, c);
 57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	83 ec 08             	sub    $0x8,%esp
 587:	50                   	push   %eax
 588:	ff 75 08             	pushl  0x8(%ebp)
 58b:	e8 c7 fe ff ff       	call   457 <putc>
 590:	83 c4 10             	add    $0x10,%esp
 593:	e9 0d 01 00 00       	jmp    6a5 <printf+0x177>
      }
    } else if(state == '%'){
 598:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 59c:	0f 85 03 01 00 00    	jne    6a5 <printf+0x177>
      if(c == 'd'){
 5a2:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a6:	75 1e                	jne    5c6 <printf+0x98>
        printint(fd, *ap, 10, 1);
 5a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	6a 01                	push   $0x1
 5af:	6a 0a                	push   $0xa
 5b1:	50                   	push   %eax
 5b2:	ff 75 08             	pushl  0x8(%ebp)
 5b5:	e8 c0 fe ff ff       	call   47a <printint>
 5ba:	83 c4 10             	add    $0x10,%esp
        ap++;
 5bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c1:	e9 d8 00 00 00       	jmp    69e <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 5c6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5ca:	74 06                	je     5d2 <printf+0xa4>
 5cc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d0:	75 1e                	jne    5f0 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 5d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d5:	8b 00                	mov    (%eax),%eax
 5d7:	6a 00                	push   $0x0
 5d9:	6a 10                	push   $0x10
 5db:	50                   	push   %eax
 5dc:	ff 75 08             	pushl  0x8(%ebp)
 5df:	e8 96 fe ff ff       	call   47a <printint>
 5e4:	83 c4 10             	add    $0x10,%esp
        ap++;
 5e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5eb:	e9 ae 00 00 00       	jmp    69e <printf+0x170>
      } else if(c == 's'){
 5f0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5f4:	75 43                	jne    639 <printf+0x10b>
        s = (char*)*ap;
 5f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f9:	8b 00                	mov    (%eax),%eax
 5fb:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5fe:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 602:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 606:	75 25                	jne    62d <printf+0xff>
          s = "(null)";
 608:	c7 45 f4 ed 08 00 00 	movl   $0x8ed,-0xc(%ebp)
        while(*s != 0){
 60f:	eb 1c                	jmp    62d <printf+0xff>
          putc(fd, *s);
 611:	8b 45 f4             	mov    -0xc(%ebp),%eax
 614:	0f b6 00             	movzbl (%eax),%eax
 617:	0f be c0             	movsbl %al,%eax
 61a:	83 ec 08             	sub    $0x8,%esp
 61d:	50                   	push   %eax
 61e:	ff 75 08             	pushl  0x8(%ebp)
 621:	e8 31 fe ff ff       	call   457 <putc>
 626:	83 c4 10             	add    $0x10,%esp
          s++;
 629:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 62d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 630:	0f b6 00             	movzbl (%eax),%eax
 633:	84 c0                	test   %al,%al
 635:	75 da                	jne    611 <printf+0xe3>
 637:	eb 65                	jmp    69e <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 639:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 63d:	75 1d                	jne    65c <printf+0x12e>
        putc(fd, *ap);
 63f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 642:	8b 00                	mov    (%eax),%eax
 644:	0f be c0             	movsbl %al,%eax
 647:	83 ec 08             	sub    $0x8,%esp
 64a:	50                   	push   %eax
 64b:	ff 75 08             	pushl  0x8(%ebp)
 64e:	e8 04 fe ff ff       	call   457 <putc>
 653:	83 c4 10             	add    $0x10,%esp
        ap++;
 656:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 65a:	eb 42                	jmp    69e <printf+0x170>
      } else if(c == '%'){
 65c:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 660:	75 17                	jne    679 <printf+0x14b>
        putc(fd, c);
 662:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 665:	0f be c0             	movsbl %al,%eax
 668:	83 ec 08             	sub    $0x8,%esp
 66b:	50                   	push   %eax
 66c:	ff 75 08             	pushl  0x8(%ebp)
 66f:	e8 e3 fd ff ff       	call   457 <putc>
 674:	83 c4 10             	add    $0x10,%esp
 677:	eb 25                	jmp    69e <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 679:	83 ec 08             	sub    $0x8,%esp
 67c:	6a 25                	push   $0x25
 67e:	ff 75 08             	pushl  0x8(%ebp)
 681:	e8 d1 fd ff ff       	call   457 <putc>
 686:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 689:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 68c:	0f be c0             	movsbl %al,%eax
 68f:	83 ec 08             	sub    $0x8,%esp
 692:	50                   	push   %eax
 693:	ff 75 08             	pushl  0x8(%ebp)
 696:	e8 bc fd ff ff       	call   457 <putc>
 69b:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 69e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6a9:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6af:	01 d0                	add    %edx,%eax
 6b1:	0f b6 00             	movzbl (%eax),%eax
 6b4:	84 c0                	test   %al,%al
 6b6:	0f 85 94 fe ff ff    	jne    550 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6bc:	90                   	nop
 6bd:	c9                   	leave  
 6be:	c3                   	ret    

000006bf <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6bf:	55                   	push   %ebp
 6c0:	89 e5                	mov    %esp,%ebp
 6c2:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	83 e8 08             	sub    $0x8,%eax
 6cb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ce:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 6d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d6:	eb 24                	jmp    6fc <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6db:	8b 00                	mov    (%eax),%eax
 6dd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e0:	77 12                	ja     6f4 <free+0x35>
 6e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e8:	77 24                	ja     70e <free+0x4f>
 6ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ed:	8b 00                	mov    (%eax),%eax
 6ef:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6f2:	77 1a                	ja     70e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f7:	8b 00                	mov    (%eax),%eax
 6f9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ff:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 702:	76 d4                	jbe    6d8 <free+0x19>
 704:	8b 45 fc             	mov    -0x4(%ebp),%eax
 707:	8b 00                	mov    (%eax),%eax
 709:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70c:	76 ca                	jbe    6d8 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 70e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 711:	8b 40 04             	mov    0x4(%eax),%eax
 714:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 71b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71e:	01 c2                	add    %eax,%edx
 720:	8b 45 fc             	mov    -0x4(%ebp),%eax
 723:	8b 00                	mov    (%eax),%eax
 725:	39 c2                	cmp    %eax,%edx
 727:	75 24                	jne    74d <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 729:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72c:	8b 50 04             	mov    0x4(%eax),%edx
 72f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 732:	8b 00                	mov    (%eax),%eax
 734:	8b 40 04             	mov    0x4(%eax),%eax
 737:	01 c2                	add    %eax,%edx
 739:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73c:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 73f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 742:	8b 00                	mov    (%eax),%eax
 744:	8b 10                	mov    (%eax),%edx
 746:	8b 45 f8             	mov    -0x8(%ebp),%eax
 749:	89 10                	mov    %edx,(%eax)
 74b:	eb 0a                	jmp    757 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	8b 10                	mov    (%eax),%edx
 752:	8b 45 f8             	mov    -0x8(%ebp),%eax
 755:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 40 04             	mov    0x4(%eax),%eax
 75d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 764:	8b 45 fc             	mov    -0x4(%ebp),%eax
 767:	01 d0                	add    %edx,%eax
 769:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76c:	75 20                	jne    78e <free+0xcf>
    p->s.size += bp->s.size;
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	8b 50 04             	mov    0x4(%eax),%edx
 774:	8b 45 f8             	mov    -0x8(%ebp),%eax
 777:	8b 40 04             	mov    0x4(%eax),%eax
 77a:	01 c2                	add    %eax,%edx
 77c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 782:	8b 45 f8             	mov    -0x8(%ebp),%eax
 785:	8b 10                	mov    (%eax),%edx
 787:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78a:	89 10                	mov    %edx,(%eax)
 78c:	eb 08                	jmp    796 <free+0xd7>
  } else
    p->s.ptr = bp;
 78e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 791:	8b 55 f8             	mov    -0x8(%ebp),%edx
 794:	89 10                	mov    %edx,(%eax)
  freep = p;
 796:	8b 45 fc             	mov    -0x4(%ebp),%eax
 799:	a3 7c 0b 00 00       	mov    %eax,0xb7c
}
 79e:	90                   	nop
 79f:	c9                   	leave  
 7a0:	c3                   	ret    

000007a1 <morecore>:

static Header*
morecore(uint nu)
{
 7a1:	55                   	push   %ebp
 7a2:	89 e5                	mov    %esp,%ebp
 7a4:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7ae:	77 07                	ja     7b7 <morecore+0x16>
    nu = 4096;
 7b0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b7:	8b 45 08             	mov    0x8(%ebp),%eax
 7ba:	c1 e0 03             	shl    $0x3,%eax
 7bd:	83 ec 0c             	sub    $0xc,%esp
 7c0:	50                   	push   %eax
 7c1:	e8 51 fc ff ff       	call   417 <sbrk>
 7c6:	83 c4 10             	add    $0x10,%esp
 7c9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7cc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7d0:	75 07                	jne    7d9 <morecore+0x38>
    return 0;
 7d2:	b8 00 00 00 00       	mov    $0x0,%eax
 7d7:	eb 26                	jmp    7ff <morecore+0x5e>
  hp = (Header*)p;
 7d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e2:	8b 55 08             	mov    0x8(%ebp),%edx
 7e5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7eb:	83 c0 08             	add    $0x8,%eax
 7ee:	83 ec 0c             	sub    $0xc,%esp
 7f1:	50                   	push   %eax
 7f2:	e8 c8 fe ff ff       	call   6bf <free>
 7f7:	83 c4 10             	add    $0x10,%esp
  return freep;
 7fa:	a1 7c 0b 00 00       	mov    0xb7c,%eax
}
 7ff:	c9                   	leave  
 800:	c3                   	ret    

00000801 <malloc>:

void*
malloc(uint nbytes)
{
 801:	55                   	push   %ebp
 802:	89 e5                	mov    %esp,%ebp
 804:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 807:	8b 45 08             	mov    0x8(%ebp),%eax
 80a:	83 c0 07             	add    $0x7,%eax
 80d:	c1 e8 03             	shr    $0x3,%eax
 810:	83 c0 01             	add    $0x1,%eax
 813:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 816:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 81b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 81e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 822:	75 23                	jne    847 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 824:	c7 45 f0 74 0b 00 00 	movl   $0xb74,-0x10(%ebp)
 82b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82e:	a3 7c 0b 00 00       	mov    %eax,0xb7c
 833:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 838:	a3 74 0b 00 00       	mov    %eax,0xb74
    base.s.size = 0;
 83d:	c7 05 78 0b 00 00 00 	movl   $0x0,0xb78
 844:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 847:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84a:	8b 00                	mov    (%eax),%eax
 84c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 84f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 852:	8b 40 04             	mov    0x4(%eax),%eax
 855:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 858:	72 4d                	jb     8a7 <malloc+0xa6>
      if(p->s.size == nunits)
 85a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85d:	8b 40 04             	mov    0x4(%eax),%eax
 860:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 863:	75 0c                	jne    871 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 865:	8b 45 f4             	mov    -0xc(%ebp),%eax
 868:	8b 10                	mov    (%eax),%edx
 86a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86d:	89 10                	mov    %edx,(%eax)
 86f:	eb 26                	jmp    897 <malloc+0x96>
      else {
        p->s.size -= nunits;
 871:	8b 45 f4             	mov    -0xc(%ebp),%eax
 874:	8b 40 04             	mov    0x4(%eax),%eax
 877:	2b 45 ec             	sub    -0x14(%ebp),%eax
 87a:	89 c2                	mov    %eax,%edx
 87c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 882:	8b 45 f4             	mov    -0xc(%ebp),%eax
 885:	8b 40 04             	mov    0x4(%eax),%eax
 888:	c1 e0 03             	shl    $0x3,%eax
 88b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 891:	8b 55 ec             	mov    -0x14(%ebp),%edx
 894:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 897:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89a:	a3 7c 0b 00 00       	mov    %eax,0xb7c
      return (void*)(p + 1);
 89f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a2:	83 c0 08             	add    $0x8,%eax
 8a5:	eb 3b                	jmp    8e2 <malloc+0xe1>
    }
    if(p == freep)
 8a7:	a1 7c 0b 00 00       	mov    0xb7c,%eax
 8ac:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8af:	75 1e                	jne    8cf <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 8b1:	83 ec 0c             	sub    $0xc,%esp
 8b4:	ff 75 ec             	pushl  -0x14(%ebp)
 8b7:	e8 e5 fe ff ff       	call   7a1 <morecore>
 8bc:	83 c4 10             	add    $0x10,%esp
 8bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c6:	75 07                	jne    8cf <malloc+0xce>
        return 0;
 8c8:	b8 00 00 00 00       	mov    $0x0,%eax
 8cd:	eb 13                	jmp    8e2 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d8:	8b 00                	mov    (%eax),%eax
 8da:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8dd:	e9 6d ff ff ff       	jmp    84f <malloc+0x4e>
}
 8e2:	c9                   	leave  
 8e3:	c3                   	ret    
