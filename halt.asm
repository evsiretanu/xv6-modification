
_halt:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
// halt the system.
#include "types.h"
#include "user.h"

int
main(void) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  halt();
  11:	e8 d8 03 00 00       	call   3ee <halt>
  return 0;
  16:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1b:	83 c4 04             	add    $0x4,%esp
  1e:	59                   	pop    %ecx
  1f:	5d                   	pop    %ebp
  20:	8d 61 fc             	lea    -0x4(%ecx),%esp
  23:	c3                   	ret    

00000024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	57                   	push   %edi
  28:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  29:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2c:	8b 55 10             	mov    0x10(%ebp),%edx
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	89 cb                	mov    %ecx,%ebx
  34:	89 df                	mov    %ebx,%edi
  36:	89 d1                	mov    %edx,%ecx
  38:	fc                   	cld    
  39:	f3 aa                	rep stos %al,%es:(%edi)
  3b:	89 ca                	mov    %ecx,%edx
  3d:	89 fb                	mov    %edi,%ebx
  3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  42:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  45:	90                   	nop
  46:	5b                   	pop    %ebx
  47:	5f                   	pop    %edi
  48:	5d                   	pop    %ebp
  49:	c3                   	ret    

0000004a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  4a:	55                   	push   %ebp
  4b:	89 e5                	mov    %esp,%ebp
  4d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  50:	8b 45 08             	mov    0x8(%ebp),%eax
  53:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  56:	90                   	nop
  57:	8b 45 08             	mov    0x8(%ebp),%eax
  5a:	8d 50 01             	lea    0x1(%eax),%edx
  5d:	89 55 08             	mov    %edx,0x8(%ebp)
  60:	8b 55 0c             	mov    0xc(%ebp),%edx
  63:	8d 4a 01             	lea    0x1(%edx),%ecx
  66:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  69:	0f b6 12             	movzbl (%edx),%edx
  6c:	88 10                	mov    %dl,(%eax)
  6e:	0f b6 00             	movzbl (%eax),%eax
  71:	84 c0                	test   %al,%al
  73:	75 e2                	jne    57 <strcpy+0xd>
    ;
  return os;
  75:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  78:	c9                   	leave  
  79:	c3                   	ret    

0000007a <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7a:	55                   	push   %ebp
  7b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7d:	eb 08                	jmp    87 <strcmp+0xd>
    p++, q++;
  7f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  83:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  87:	8b 45 08             	mov    0x8(%ebp),%eax
  8a:	0f b6 00             	movzbl (%eax),%eax
  8d:	84 c0                	test   %al,%al
  8f:	74 10                	je     a1 <strcmp+0x27>
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	0f b6 10             	movzbl (%eax),%edx
  97:	8b 45 0c             	mov    0xc(%ebp),%eax
  9a:	0f b6 00             	movzbl (%eax),%eax
  9d:	38 c2                	cmp    %al,%dl
  9f:	74 de                	je     7f <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a1:	8b 45 08             	mov    0x8(%ebp),%eax
  a4:	0f b6 00             	movzbl (%eax),%eax
  a7:	0f b6 d0             	movzbl %al,%edx
  aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  ad:	0f b6 00             	movzbl (%eax),%eax
  b0:	0f b6 c0             	movzbl %al,%eax
  b3:	29 c2                	sub    %eax,%edx
  b5:	89 d0                	mov    %edx,%eax
}
  b7:	5d                   	pop    %ebp
  b8:	c3                   	ret    

000000b9 <strlen>:

uint
strlen(char *s)
{
  b9:	55                   	push   %ebp
  ba:	89 e5                	mov    %esp,%ebp
  bc:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c6:	eb 04                	jmp    cc <strlen+0x13>
  c8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  cc:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cf:	8b 45 08             	mov    0x8(%ebp),%eax
  d2:	01 d0                	add    %edx,%eax
  d4:	0f b6 00             	movzbl (%eax),%eax
  d7:	84 c0                	test   %al,%al
  d9:	75 ed                	jne    c8 <strlen+0xf>
    ;
  return n;
  db:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  de:	c9                   	leave  
  df:	c3                   	ret    

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
  e3:	8b 45 10             	mov    0x10(%ebp),%eax
  e6:	50                   	push   %eax
  e7:	ff 75 0c             	pushl  0xc(%ebp)
  ea:	ff 75 08             	pushl  0x8(%ebp)
  ed:	e8 32 ff ff ff       	call   24 <stosb>
  f2:	83 c4 0c             	add    $0xc,%esp
  return dst;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
  f8:	c9                   	leave  
  f9:	c3                   	ret    

000000fa <strchr>:

char*
strchr(const char *s, char c)
{
  fa:	55                   	push   %ebp
  fb:	89 e5                	mov    %esp,%ebp
  fd:	83 ec 04             	sub    $0x4,%esp
 100:	8b 45 0c             	mov    0xc(%ebp),%eax
 103:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 106:	eb 14                	jmp    11c <strchr+0x22>
    if(*s == c)
 108:	8b 45 08             	mov    0x8(%ebp),%eax
 10b:	0f b6 00             	movzbl (%eax),%eax
 10e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 111:	75 05                	jne    118 <strchr+0x1e>
      return (char*)s;
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	eb 13                	jmp    12b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 118:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	0f b6 00             	movzbl (%eax),%eax
 122:	84 c0                	test   %al,%al
 124:	75 e2                	jne    108 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 126:	b8 00 00 00 00       	mov    $0x0,%eax
}
 12b:	c9                   	leave  
 12c:	c3                   	ret    

0000012d <gets>:

char*
gets(char *buf, int max)
{
 12d:	55                   	push   %ebp
 12e:	89 e5                	mov    %esp,%ebp
 130:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 133:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 13a:	eb 42                	jmp    17e <gets+0x51>
    cc = read(0, &c, 1);
 13c:	83 ec 04             	sub    $0x4,%esp
 13f:	6a 01                	push   $0x1
 141:	8d 45 ef             	lea    -0x11(%ebp),%eax
 144:	50                   	push   %eax
 145:	6a 00                	push   $0x0
 147:	e8 1a 02 00 00       	call   366 <read>
 14c:	83 c4 10             	add    $0x10,%esp
 14f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 152:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 156:	7e 33                	jle    18b <gets+0x5e>
      break;
    buf[i++] = c;
 158:	8b 45 f4             	mov    -0xc(%ebp),%eax
 15b:	8d 50 01             	lea    0x1(%eax),%edx
 15e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 161:	89 c2                	mov    %eax,%edx
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	01 c2                	add    %eax,%edx
 168:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 16c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 16e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 172:	3c 0a                	cmp    $0xa,%al
 174:	74 16                	je     18c <gets+0x5f>
 176:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17a:	3c 0d                	cmp    $0xd,%al
 17c:	74 0e                	je     18c <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 181:	83 c0 01             	add    $0x1,%eax
 184:	3b 45 0c             	cmp    0xc(%ebp),%eax
 187:	7c b3                	jl     13c <gets+0xf>
 189:	eb 01                	jmp    18c <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 18b:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 18c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18f:	8b 45 08             	mov    0x8(%ebp),%eax
 192:	01 d0                	add    %edx,%eax
 194:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 197:	8b 45 08             	mov    0x8(%ebp),%eax
}
 19a:	c9                   	leave  
 19b:	c3                   	ret    

0000019c <stat>:

int
stat(char *n, struct stat *st)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1a2:	83 ec 08             	sub    $0x8,%esp
 1a5:	6a 00                	push   $0x0
 1a7:	ff 75 08             	pushl  0x8(%ebp)
 1aa:	e8 df 01 00 00       	call   38e <open>
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b9:	79 07                	jns    1c2 <stat+0x26>
    return -1;
 1bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1c0:	eb 25                	jmp    1e7 <stat+0x4b>
  r = fstat(fd, st);
 1c2:	83 ec 08             	sub    $0x8,%esp
 1c5:	ff 75 0c             	pushl  0xc(%ebp)
 1c8:	ff 75 f4             	pushl  -0xc(%ebp)
 1cb:	e8 d6 01 00 00       	call   3a6 <fstat>
 1d0:	83 c4 10             	add    $0x10,%esp
 1d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1d6:	83 ec 0c             	sub    $0xc,%esp
 1d9:	ff 75 f4             	pushl  -0xc(%ebp)
 1dc:	e8 95 01 00 00       	call   376 <close>
 1e1:	83 c4 10             	add    $0x10,%esp
  return r;
 1e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1e7:	c9                   	leave  
 1e8:	c3                   	ret    

000001e9 <atoi>:

int
atoi(const char *s)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 1ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 1f6:	eb 04                	jmp    1fc <atoi+0x13>
 1f8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3c 20                	cmp    $0x20,%al
 204:	74 f2                	je     1f8 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 206:	8b 45 08             	mov    0x8(%ebp),%eax
 209:	0f b6 00             	movzbl (%eax),%eax
 20c:	3c 2d                	cmp    $0x2d,%al
 20e:	75 07                	jne    217 <atoi+0x2e>
 210:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 215:	eb 05                	jmp    21c <atoi+0x33>
 217:	b8 01 00 00 00       	mov    $0x1,%eax
 21c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	3c 2b                	cmp    $0x2b,%al
 227:	74 0a                	je     233 <atoi+0x4a>
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	3c 2d                	cmp    $0x2d,%al
 231:	75 2b                	jne    25e <atoi+0x75>
    s++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 237:	eb 25                	jmp    25e <atoi+0x75>
    n = n*10 + *s++ - '0';
 239:	8b 55 fc             	mov    -0x4(%ebp),%edx
 23c:	89 d0                	mov    %edx,%eax
 23e:	c1 e0 02             	shl    $0x2,%eax
 241:	01 d0                	add    %edx,%eax
 243:	01 c0                	add    %eax,%eax
 245:	89 c1                	mov    %eax,%ecx
 247:	8b 45 08             	mov    0x8(%ebp),%eax
 24a:	8d 50 01             	lea    0x1(%eax),%edx
 24d:	89 55 08             	mov    %edx,0x8(%ebp)
 250:	0f b6 00             	movzbl (%eax),%eax
 253:	0f be c0             	movsbl %al,%eax
 256:	01 c8                	add    %ecx,%eax
 258:	83 e8 30             	sub    $0x30,%eax
 25b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 25e:	8b 45 08             	mov    0x8(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	3c 2f                	cmp    $0x2f,%al
 266:	7e 0a                	jle    272 <atoi+0x89>
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	0f b6 00             	movzbl (%eax),%eax
 26e:	3c 39                	cmp    $0x39,%al
 270:	7e c7                	jle    239 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 272:	8b 45 f8             	mov    -0x8(%ebp),%eax
 275:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 279:	c9                   	leave  
 27a:	c3                   	ret    

0000027b <atoo>:

int
atoo(const char *s)
{
 27b:	55                   	push   %ebp
 27c:	89 e5                	mov    %esp,%ebp
 27e:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 281:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 288:	eb 04                	jmp    28e <atoo+0x13>
 28a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
 291:	0f b6 00             	movzbl (%eax),%eax
 294:	3c 20                	cmp    $0x20,%al
 296:	74 f2                	je     28a <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	0f b6 00             	movzbl (%eax),%eax
 29e:	3c 2d                	cmp    $0x2d,%al
 2a0:	75 07                	jne    2a9 <atoo+0x2e>
 2a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2a7:	eb 05                	jmp    2ae <atoo+0x33>
 2a9:	b8 01 00 00 00       	mov    $0x1,%eax
 2ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 2b1:	8b 45 08             	mov    0x8(%ebp),%eax
 2b4:	0f b6 00             	movzbl (%eax),%eax
 2b7:	3c 2b                	cmp    $0x2b,%al
 2b9:	74 0a                	je     2c5 <atoo+0x4a>
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	0f b6 00             	movzbl (%eax),%eax
 2c1:	3c 2d                	cmp    $0x2d,%al
 2c3:	75 27                	jne    2ec <atoo+0x71>
    s++;
 2c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 2c9:	eb 21                	jmp    2ec <atoo+0x71>
    n = n*8 + *s++ - '0';
 2cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2ce:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	8d 50 01             	lea    0x1(%eax),%edx
 2db:	89 55 08             	mov    %edx,0x8(%ebp)
 2de:	0f b6 00             	movzbl (%eax),%eax
 2e1:	0f be c0             	movsbl %al,%eax
 2e4:	01 c8                	add    %ecx,%eax
 2e6:	83 e8 30             	sub    $0x30,%eax
 2e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
 2ef:	0f b6 00             	movzbl (%eax),%eax
 2f2:	3c 2f                	cmp    $0x2f,%al
 2f4:	7e 0a                	jle    300 <atoo+0x85>
 2f6:	8b 45 08             	mov    0x8(%ebp),%eax
 2f9:	0f b6 00             	movzbl (%eax),%eax
 2fc:	3c 37                	cmp    $0x37,%al
 2fe:	7e cb                	jle    2cb <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 300:	8b 45 f8             	mov    -0x8(%ebp),%eax
 303:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 307:	c9                   	leave  
 308:	c3                   	ret    

00000309 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 315:	8b 45 0c             	mov    0xc(%ebp),%eax
 318:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 31b:	eb 17                	jmp    334 <memmove+0x2b>
    *dst++ = *src++;
 31d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 320:	8d 50 01             	lea    0x1(%eax),%edx
 323:	89 55 fc             	mov    %edx,-0x4(%ebp)
 326:	8b 55 f8             	mov    -0x8(%ebp),%edx
 329:	8d 4a 01             	lea    0x1(%edx),%ecx
 32c:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 32f:	0f b6 12             	movzbl (%edx),%edx
 332:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 334:	8b 45 10             	mov    0x10(%ebp),%eax
 337:	8d 50 ff             	lea    -0x1(%eax),%edx
 33a:	89 55 10             	mov    %edx,0x10(%ebp)
 33d:	85 c0                	test   %eax,%eax
 33f:	7f dc                	jg     31d <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 341:	8b 45 08             	mov    0x8(%ebp),%eax
}
 344:	c9                   	leave  
 345:	c3                   	ret    

00000346 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 346:	b8 01 00 00 00       	mov    $0x1,%eax
 34b:	cd 40                	int    $0x40
 34d:	c3                   	ret    

0000034e <exit>:
SYSCALL(exit)
 34e:	b8 02 00 00 00       	mov    $0x2,%eax
 353:	cd 40                	int    $0x40
 355:	c3                   	ret    

00000356 <wait>:
SYSCALL(wait)
 356:	b8 03 00 00 00       	mov    $0x3,%eax
 35b:	cd 40                	int    $0x40
 35d:	c3                   	ret    

0000035e <pipe>:
SYSCALL(pipe)
 35e:	b8 04 00 00 00       	mov    $0x4,%eax
 363:	cd 40                	int    $0x40
 365:	c3                   	ret    

00000366 <read>:
SYSCALL(read)
 366:	b8 05 00 00 00       	mov    $0x5,%eax
 36b:	cd 40                	int    $0x40
 36d:	c3                   	ret    

0000036e <write>:
SYSCALL(write)
 36e:	b8 10 00 00 00       	mov    $0x10,%eax
 373:	cd 40                	int    $0x40
 375:	c3                   	ret    

00000376 <close>:
SYSCALL(close)
 376:	b8 15 00 00 00       	mov    $0x15,%eax
 37b:	cd 40                	int    $0x40
 37d:	c3                   	ret    

0000037e <kill>:
SYSCALL(kill)
 37e:	b8 06 00 00 00       	mov    $0x6,%eax
 383:	cd 40                	int    $0x40
 385:	c3                   	ret    

00000386 <exec>:
SYSCALL(exec)
 386:	b8 07 00 00 00       	mov    $0x7,%eax
 38b:	cd 40                	int    $0x40
 38d:	c3                   	ret    

0000038e <open>:
SYSCALL(open)
 38e:	b8 0f 00 00 00       	mov    $0xf,%eax
 393:	cd 40                	int    $0x40
 395:	c3                   	ret    

00000396 <mknod>:
SYSCALL(mknod)
 396:	b8 11 00 00 00       	mov    $0x11,%eax
 39b:	cd 40                	int    $0x40
 39d:	c3                   	ret    

0000039e <unlink>:
SYSCALL(unlink)
 39e:	b8 12 00 00 00       	mov    $0x12,%eax
 3a3:	cd 40                	int    $0x40
 3a5:	c3                   	ret    

000003a6 <fstat>:
SYSCALL(fstat)
 3a6:	b8 08 00 00 00       	mov    $0x8,%eax
 3ab:	cd 40                	int    $0x40
 3ad:	c3                   	ret    

000003ae <link>:
SYSCALL(link)
 3ae:	b8 13 00 00 00       	mov    $0x13,%eax
 3b3:	cd 40                	int    $0x40
 3b5:	c3                   	ret    

000003b6 <mkdir>:
SYSCALL(mkdir)
 3b6:	b8 14 00 00 00       	mov    $0x14,%eax
 3bb:	cd 40                	int    $0x40
 3bd:	c3                   	ret    

000003be <chdir>:
SYSCALL(chdir)
 3be:	b8 09 00 00 00       	mov    $0x9,%eax
 3c3:	cd 40                	int    $0x40
 3c5:	c3                   	ret    

000003c6 <dup>:
SYSCALL(dup)
 3c6:	b8 0a 00 00 00       	mov    $0xa,%eax
 3cb:	cd 40                	int    $0x40
 3cd:	c3                   	ret    

000003ce <getpid>:
SYSCALL(getpid)
 3ce:	b8 0b 00 00 00       	mov    $0xb,%eax
 3d3:	cd 40                	int    $0x40
 3d5:	c3                   	ret    

000003d6 <sbrk>:
SYSCALL(sbrk)
 3d6:	b8 0c 00 00 00       	mov    $0xc,%eax
 3db:	cd 40                	int    $0x40
 3dd:	c3                   	ret    

000003de <sleep>:
SYSCALL(sleep)
 3de:	b8 0d 00 00 00       	mov    $0xd,%eax
 3e3:	cd 40                	int    $0x40
 3e5:	c3                   	ret    

000003e6 <uptime>:
SYSCALL(uptime)
 3e6:	b8 0e 00 00 00       	mov    $0xe,%eax
 3eb:	cd 40                	int    $0x40
 3ed:	c3                   	ret    

000003ee <halt>:
SYSCALL(halt)
 3ee:	b8 16 00 00 00       	mov    $0x16,%eax
 3f3:	cd 40                	int    $0x40
 3f5:	c3                   	ret    

000003f6 <date>:

# Added calls - Evghenii
SYSCALL(date)
 3f6:	b8 17 00 00 00       	mov    $0x17,%eax
 3fb:	cd 40                	int    $0x40
 3fd:	c3                   	ret    

000003fe <setuid>:
SYSCALL(setuid)
 3fe:	b8 18 00 00 00       	mov    $0x18,%eax
 403:	cd 40                	int    $0x40
 405:	c3                   	ret    

00000406 <getuid>:
SYSCALL(getuid)
 406:	b8 19 00 00 00       	mov    $0x19,%eax
 40b:	cd 40                	int    $0x40
 40d:	c3                   	ret    

0000040e <setgid>:
SYSCALL(setgid)
 40e:	b8 1a 00 00 00       	mov    $0x1a,%eax
 413:	cd 40                	int    $0x40
 415:	c3                   	ret    

00000416 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 18             	sub    $0x18,%esp
 41c:	8b 45 0c             	mov    0xc(%ebp),%eax
 41f:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 422:	83 ec 04             	sub    $0x4,%esp
 425:	6a 01                	push   $0x1
 427:	8d 45 f4             	lea    -0xc(%ebp),%eax
 42a:	50                   	push   %eax
 42b:	ff 75 08             	pushl  0x8(%ebp)
 42e:	e8 3b ff ff ff       	call   36e <write>
 433:	83 c4 10             	add    $0x10,%esp
}
 436:	90                   	nop
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	53                   	push   %ebx
 43d:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 440:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 447:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 44b:	74 17                	je     464 <printint+0x2b>
 44d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 451:	79 11                	jns    464 <printint+0x2b>
    neg = 1;
 453:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	f7 d8                	neg    %eax
 45f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 462:	eb 06                	jmp    46a <printint+0x31>
  } else {
    x = xx;
 464:	8b 45 0c             	mov    0xc(%ebp),%eax
 467:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 46a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 471:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 474:	8d 41 01             	lea    0x1(%ecx),%eax
 477:	89 45 f4             	mov    %eax,-0xc(%ebp)
 47a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 47d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 480:	ba 00 00 00 00       	mov    $0x0,%edx
 485:	f7 f3                	div    %ebx
 487:	89 d0                	mov    %edx,%eax
 489:	0f b6 80 1c 0b 00 00 	movzbl 0xb1c(%eax),%eax
 490:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 494:	8b 5d 10             	mov    0x10(%ebp),%ebx
 497:	8b 45 ec             	mov    -0x14(%ebp),%eax
 49a:	ba 00 00 00 00       	mov    $0x0,%edx
 49f:	f7 f3                	div    %ebx
 4a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a8:	75 c7                	jne    471 <printint+0x38>
  if(neg)
 4aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ae:	74 2d                	je     4dd <printint+0xa4>
    buf[i++] = '-';
 4b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b3:	8d 50 01             	lea    0x1(%eax),%edx
 4b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b9:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4be:	eb 1d                	jmp    4dd <printint+0xa4>
    putc(fd, buf[i]);
 4c0:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c6:	01 d0                	add    %edx,%eax
 4c8:	0f b6 00             	movzbl (%eax),%eax
 4cb:	0f be c0             	movsbl %al,%eax
 4ce:	83 ec 08             	sub    $0x8,%esp
 4d1:	50                   	push   %eax
 4d2:	ff 75 08             	pushl  0x8(%ebp)
 4d5:	e8 3c ff ff ff       	call   416 <putc>
 4da:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4dd:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4e5:	79 d9                	jns    4c0 <printint+0x87>
    putc(fd, buf[i]);
}
 4e7:	90                   	nop
 4e8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 4eb:	c9                   	leave  
 4ec:	c3                   	ret    

000004ed <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4ed:	55                   	push   %ebp
 4ee:	89 e5                	mov    %esp,%ebp
 4f0:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4fa:	8d 45 0c             	lea    0xc(%ebp),%eax
 4fd:	83 c0 04             	add    $0x4,%eax
 500:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 503:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 50a:	e9 59 01 00 00       	jmp    668 <printf+0x17b>
    c = fmt[i] & 0xff;
 50f:	8b 55 0c             	mov    0xc(%ebp),%edx
 512:	8b 45 f0             	mov    -0x10(%ebp),%eax
 515:	01 d0                	add    %edx,%eax
 517:	0f b6 00             	movzbl (%eax),%eax
 51a:	0f be c0             	movsbl %al,%eax
 51d:	25 ff 00 00 00       	and    $0xff,%eax
 522:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 525:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 529:	75 2c                	jne    557 <printf+0x6a>
      if(c == '%'){
 52b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 52f:	75 0c                	jne    53d <printf+0x50>
        state = '%';
 531:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 538:	e9 27 01 00 00       	jmp    664 <printf+0x177>
      } else {
        putc(fd, c);
 53d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 540:	0f be c0             	movsbl %al,%eax
 543:	83 ec 08             	sub    $0x8,%esp
 546:	50                   	push   %eax
 547:	ff 75 08             	pushl  0x8(%ebp)
 54a:	e8 c7 fe ff ff       	call   416 <putc>
 54f:	83 c4 10             	add    $0x10,%esp
 552:	e9 0d 01 00 00       	jmp    664 <printf+0x177>
      }
    } else if(state == '%'){
 557:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 55b:	0f 85 03 01 00 00    	jne    664 <printf+0x177>
      if(c == 'd'){
 561:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 565:	75 1e                	jne    585 <printf+0x98>
        printint(fd, *ap, 10, 1);
 567:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56a:	8b 00                	mov    (%eax),%eax
 56c:	6a 01                	push   $0x1
 56e:	6a 0a                	push   $0xa
 570:	50                   	push   %eax
 571:	ff 75 08             	pushl  0x8(%ebp)
 574:	e8 c0 fe ff ff       	call   439 <printint>
 579:	83 c4 10             	add    $0x10,%esp
        ap++;
 57c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 580:	e9 d8 00 00 00       	jmp    65d <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 585:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 589:	74 06                	je     591 <printf+0xa4>
 58b:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 58f:	75 1e                	jne    5af <printf+0xc2>
        printint(fd, *ap, 16, 0);
 591:	8b 45 e8             	mov    -0x18(%ebp),%eax
 594:	8b 00                	mov    (%eax),%eax
 596:	6a 00                	push   $0x0
 598:	6a 10                	push   $0x10
 59a:	50                   	push   %eax
 59b:	ff 75 08             	pushl  0x8(%ebp)
 59e:	e8 96 fe ff ff       	call   439 <printint>
 5a3:	83 c4 10             	add    $0x10,%esp
        ap++;
 5a6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5aa:	e9 ae 00 00 00       	jmp    65d <printf+0x170>
      } else if(c == 's'){
 5af:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5b3:	75 43                	jne    5f8 <printf+0x10b>
        s = (char*)*ap;
 5b5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b8:	8b 00                	mov    (%eax),%eax
 5ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5c5:	75 25                	jne    5ec <printf+0xff>
          s = "(null)";
 5c7:	c7 45 f4 a3 08 00 00 	movl   $0x8a3,-0xc(%ebp)
        while(*s != 0){
 5ce:	eb 1c                	jmp    5ec <printf+0xff>
          putc(fd, *s);
 5d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d3:	0f b6 00             	movzbl (%eax),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	83 ec 08             	sub    $0x8,%esp
 5dc:	50                   	push   %eax
 5dd:	ff 75 08             	pushl  0x8(%ebp)
 5e0:	e8 31 fe ff ff       	call   416 <putc>
 5e5:	83 c4 10             	add    $0x10,%esp
          s++;
 5e8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ef:	0f b6 00             	movzbl (%eax),%eax
 5f2:	84 c0                	test   %al,%al
 5f4:	75 da                	jne    5d0 <printf+0xe3>
 5f6:	eb 65                	jmp    65d <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5f8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5fc:	75 1d                	jne    61b <printf+0x12e>
        putc(fd, *ap);
 5fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 601:	8b 00                	mov    (%eax),%eax
 603:	0f be c0             	movsbl %al,%eax
 606:	83 ec 08             	sub    $0x8,%esp
 609:	50                   	push   %eax
 60a:	ff 75 08             	pushl  0x8(%ebp)
 60d:	e8 04 fe ff ff       	call   416 <putc>
 612:	83 c4 10             	add    $0x10,%esp
        ap++;
 615:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 619:	eb 42                	jmp    65d <printf+0x170>
      } else if(c == '%'){
 61b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 61f:	75 17                	jne    638 <printf+0x14b>
        putc(fd, c);
 621:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 624:	0f be c0             	movsbl %al,%eax
 627:	83 ec 08             	sub    $0x8,%esp
 62a:	50                   	push   %eax
 62b:	ff 75 08             	pushl  0x8(%ebp)
 62e:	e8 e3 fd ff ff       	call   416 <putc>
 633:	83 c4 10             	add    $0x10,%esp
 636:	eb 25                	jmp    65d <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 638:	83 ec 08             	sub    $0x8,%esp
 63b:	6a 25                	push   $0x25
 63d:	ff 75 08             	pushl  0x8(%ebp)
 640:	e8 d1 fd ff ff       	call   416 <putc>
 645:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 648:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 64b:	0f be c0             	movsbl %al,%eax
 64e:	83 ec 08             	sub    $0x8,%esp
 651:	50                   	push   %eax
 652:	ff 75 08             	pushl  0x8(%ebp)
 655:	e8 bc fd ff ff       	call   416 <putc>
 65a:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 65d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 664:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 668:	8b 55 0c             	mov    0xc(%ebp),%edx
 66b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 66e:	01 d0                	add    %edx,%eax
 670:	0f b6 00             	movzbl (%eax),%eax
 673:	84 c0                	test   %al,%al
 675:	0f 85 94 fe ff ff    	jne    50f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 67b:	90                   	nop
 67c:	c9                   	leave  
 67d:	c3                   	ret    

0000067e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 67e:	55                   	push   %ebp
 67f:	89 e5                	mov    %esp,%ebp
 681:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	83 e8 08             	sub    $0x8,%eax
 68a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 68d:	a1 38 0b 00 00       	mov    0xb38,%eax
 692:	89 45 fc             	mov    %eax,-0x4(%ebp)
 695:	eb 24                	jmp    6bb <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 697:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 69f:	77 12                	ja     6b3 <free+0x35>
 6a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6a7:	77 24                	ja     6cd <free+0x4f>
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b1:	77 1a                	ja     6cd <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	8b 00                	mov    (%eax),%eax
 6b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c1:	76 d4                	jbe    697 <free+0x19>
 6c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c6:	8b 00                	mov    (%eax),%eax
 6c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cb:	76 ca                	jbe    697 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d0:	8b 40 04             	mov    0x4(%eax),%eax
 6d3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	01 c2                	add    %eax,%edx
 6df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	39 c2                	cmp    %eax,%edx
 6e6:	75 24                	jne    70c <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6eb:	8b 50 04             	mov    0x4(%eax),%edx
 6ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f1:	8b 00                	mov    (%eax),%eax
 6f3:	8b 40 04             	mov    0x4(%eax),%eax
 6f6:	01 c2                	add    %eax,%edx
 6f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fb:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 00                	mov    (%eax),%eax
 703:	8b 10                	mov    (%eax),%edx
 705:	8b 45 f8             	mov    -0x8(%ebp),%eax
 708:	89 10                	mov    %edx,(%eax)
 70a:	eb 0a                	jmp    716 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 70c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70f:	8b 10                	mov    (%eax),%edx
 711:	8b 45 f8             	mov    -0x8(%ebp),%eax
 714:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 716:	8b 45 fc             	mov    -0x4(%ebp),%eax
 719:	8b 40 04             	mov    0x4(%eax),%eax
 71c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 723:	8b 45 fc             	mov    -0x4(%ebp),%eax
 726:	01 d0                	add    %edx,%eax
 728:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72b:	75 20                	jne    74d <free+0xcf>
    p->s.size += bp->s.size;
 72d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 730:	8b 50 04             	mov    0x4(%eax),%edx
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	8b 40 04             	mov    0x4(%eax),%eax
 739:	01 c2                	add    %eax,%edx
 73b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 741:	8b 45 f8             	mov    -0x8(%ebp),%eax
 744:	8b 10                	mov    (%eax),%edx
 746:	8b 45 fc             	mov    -0x4(%ebp),%eax
 749:	89 10                	mov    %edx,(%eax)
 74b:	eb 08                	jmp    755 <free+0xd7>
  } else
    p->s.ptr = bp;
 74d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 750:	8b 55 f8             	mov    -0x8(%ebp),%edx
 753:	89 10                	mov    %edx,(%eax)
  freep = p;
 755:	8b 45 fc             	mov    -0x4(%ebp),%eax
 758:	a3 38 0b 00 00       	mov    %eax,0xb38
}
 75d:	90                   	nop
 75e:	c9                   	leave  
 75f:	c3                   	ret    

00000760 <morecore>:

static Header*
morecore(uint nu)
{
 760:	55                   	push   %ebp
 761:	89 e5                	mov    %esp,%ebp
 763:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 766:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 76d:	77 07                	ja     776 <morecore+0x16>
    nu = 4096;
 76f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	c1 e0 03             	shl    $0x3,%eax
 77c:	83 ec 0c             	sub    $0xc,%esp
 77f:	50                   	push   %eax
 780:	e8 51 fc ff ff       	call   3d6 <sbrk>
 785:	83 c4 10             	add    $0x10,%esp
 788:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 78b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 78f:	75 07                	jne    798 <morecore+0x38>
    return 0;
 791:	b8 00 00 00 00       	mov    $0x0,%eax
 796:	eb 26                	jmp    7be <morecore+0x5e>
  hp = (Header*)p;
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 79e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a1:	8b 55 08             	mov    0x8(%ebp),%edx
 7a4:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7aa:	83 c0 08             	add    $0x8,%eax
 7ad:	83 ec 0c             	sub    $0xc,%esp
 7b0:	50                   	push   %eax
 7b1:	e8 c8 fe ff ff       	call   67e <free>
 7b6:	83 c4 10             	add    $0x10,%esp
  return freep;
 7b9:	a1 38 0b 00 00       	mov    0xb38,%eax
}
 7be:	c9                   	leave  
 7bf:	c3                   	ret    

000007c0 <malloc>:

void*
malloc(uint nbytes)
{
 7c0:	55                   	push   %ebp
 7c1:	89 e5                	mov    %esp,%ebp
 7c3:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c6:	8b 45 08             	mov    0x8(%ebp),%eax
 7c9:	83 c0 07             	add    $0x7,%eax
 7cc:	c1 e8 03             	shr    $0x3,%eax
 7cf:	83 c0 01             	add    $0x1,%eax
 7d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7d5:	a1 38 0b 00 00       	mov    0xb38,%eax
 7da:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7e1:	75 23                	jne    806 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7e3:	c7 45 f0 30 0b 00 00 	movl   $0xb30,-0x10(%ebp)
 7ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ed:	a3 38 0b 00 00       	mov    %eax,0xb38
 7f2:	a1 38 0b 00 00       	mov    0xb38,%eax
 7f7:	a3 30 0b 00 00       	mov    %eax,0xb30
    base.s.size = 0;
 7fc:	c7 05 34 0b 00 00 00 	movl   $0x0,0xb34
 803:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 806:	8b 45 f0             	mov    -0x10(%ebp),%eax
 809:	8b 00                	mov    (%eax),%eax
 80b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	8b 40 04             	mov    0x4(%eax),%eax
 814:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 817:	72 4d                	jb     866 <malloc+0xa6>
      if(p->s.size == nunits)
 819:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81c:	8b 40 04             	mov    0x4(%eax),%eax
 81f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 822:	75 0c                	jne    830 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	8b 10                	mov    (%eax),%edx
 829:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82c:	89 10                	mov    %edx,(%eax)
 82e:	eb 26                	jmp    856 <malloc+0x96>
      else {
        p->s.size -= nunits;
 830:	8b 45 f4             	mov    -0xc(%ebp),%eax
 833:	8b 40 04             	mov    0x4(%eax),%eax
 836:	2b 45 ec             	sub    -0x14(%ebp),%eax
 839:	89 c2                	mov    %eax,%edx
 83b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 841:	8b 45 f4             	mov    -0xc(%ebp),%eax
 844:	8b 40 04             	mov    0x4(%eax),%eax
 847:	c1 e0 03             	shl    $0x3,%eax
 84a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 84d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 850:	8b 55 ec             	mov    -0x14(%ebp),%edx
 853:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 856:	8b 45 f0             	mov    -0x10(%ebp),%eax
 859:	a3 38 0b 00 00       	mov    %eax,0xb38
      return (void*)(p + 1);
 85e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 861:	83 c0 08             	add    $0x8,%eax
 864:	eb 3b                	jmp    8a1 <malloc+0xe1>
    }
    if(p == freep)
 866:	a1 38 0b 00 00       	mov    0xb38,%eax
 86b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 86e:	75 1e                	jne    88e <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	ff 75 ec             	pushl  -0x14(%ebp)
 876:	e8 e5 fe ff ff       	call   760 <morecore>
 87b:	83 c4 10             	add    $0x10,%esp
 87e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 881:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 885:	75 07                	jne    88e <malloc+0xce>
        return 0;
 887:	b8 00 00 00 00       	mov    $0x0,%eax
 88c:	eb 13                	jmp    8a1 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 891:	89 45 f0             	mov    %eax,-0x10(%ebp)
 894:	8b 45 f4             	mov    -0xc(%ebp),%eax
 897:	8b 00                	mov    (%eax),%eax
 899:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 89c:	e9 6d ff ff ff       	jmp    80e <malloc+0x4e>
}
 8a1:	c9                   	leave  
 8a2:	c3                   	ret    
