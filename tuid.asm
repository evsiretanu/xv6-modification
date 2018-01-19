
_tuid:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int arg, char *argv[]) {
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 04             	sub    $0x4,%esp
  setuid(1);
  11:	83 ec 0c             	sub    $0xc,%esp
  14:	6a 01                	push   $0x1
  16:	e8 97 05 00 00       	call   5b2 <setuid>
  1b:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
  1e:	e8 97 05 00 00       	call   5ba <getuid>
  23:	83 ec 04             	sub    $0x4,%esp
  26:	50                   	push   %eax
  27:	68 57 0a 00 00       	push   $0xa57
  2c:	6a 01                	push   $0x1
  2e:	e8 6e 06 00 00       	call   6a1 <printf>
  33:	83 c4 10             	add    $0x10,%esp
  setuid(2);
  36:	83 ec 0c             	sub    $0xc,%esp
  39:	6a 02                	push   $0x2
  3b:	e8 72 05 00 00       	call   5b2 <setuid>
  40:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
  43:	e8 72 05 00 00       	call   5ba <getuid>
  48:	83 ec 04             	sub    $0x4,%esp
  4b:	50                   	push   %eax
  4c:	68 57 0a 00 00       	push   $0xa57
  51:	6a 01                	push   $0x1
  53:	e8 49 06 00 00       	call   6a1 <printf>
  58:	83 c4 10             	add    $0x10,%esp
  setuid(3);
  5b:	83 ec 0c             	sub    $0xc,%esp
  5e:	6a 03                	push   $0x3
  60:	e8 4d 05 00 00       	call   5b2 <setuid>
  65:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid() );
  68:	e8 4d 05 00 00       	call   5ba <getuid>
  6d:	83 ec 04             	sub    $0x4,%esp
  70:	50                   	push   %eax
  71:	68 57 0a 00 00       	push   $0xa57
  76:	6a 01                	push   $0x1
  78:	e8 24 06 00 00       	call   6a1 <printf>
  7d:	83 c4 10             	add    $0x10,%esp
  setuid(0);
  80:	83 ec 0c             	sub    $0xc,%esp
  83:	6a 00                	push   $0x0
  85:	e8 28 05 00 00       	call   5b2 <setuid>
  8a:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
  8d:	e8 28 05 00 00       	call   5ba <getuid>
  92:	83 ec 04             	sub    $0x4,%esp
  95:	50                   	push   %eax
  96:	68 57 0a 00 00       	push   $0xa57
  9b:	6a 01                	push   $0x1
  9d:	e8 ff 05 00 00       	call   6a1 <printf>
  a2:	83 c4 10             	add    $0x10,%esp
  setuid(-1);
  a5:	83 ec 0c             	sub    $0xc,%esp
  a8:	6a ff                	push   $0xffffffff
  aa:	e8 03 05 00 00       	call   5b2 <setuid>
  af:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
  b2:	e8 03 05 00 00       	call   5ba <getuid>
  b7:	83 ec 04             	sub    $0x4,%esp
  ba:	50                   	push   %eax
  bb:	68 57 0a 00 00       	push   $0xa57
  c0:	6a 01                	push   $0x1
  c2:	e8 da 05 00 00       	call   6a1 <printf>
  c7:	83 c4 10             	add    $0x10,%esp
  setuid(33000);
  ca:	83 ec 0c             	sub    $0xc,%esp
  cd:	68 e8 80 00 00       	push   $0x80e8
  d2:	e8 db 04 00 00       	call   5b2 <setuid>
  d7:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n\n", getuid());
  da:	e8 db 04 00 00       	call   5ba <getuid>
  df:	83 ec 04             	sub    $0x4,%esp
  e2:	50                   	push   %eax
  e3:	68 5b 0a 00 00       	push   $0xa5b
  e8:	6a 01                	push   $0x1
  ea:	e8 b2 05 00 00       	call   6a1 <printf>
  ef:	83 c4 10             	add    $0x10,%esp

  setuid(1);
  f2:	83 ec 0c             	sub    $0xc,%esp
  f5:	6a 01                	push   $0x1
  f7:	e8 b6 04 00 00       	call   5b2 <setuid>
  fc:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
  ff:	e8 b6 04 00 00       	call   5ba <getuid>
 104:	83 ec 04             	sub    $0x4,%esp
 107:	50                   	push   %eax
 108:	68 57 0a 00 00       	push   $0xa57
 10d:	6a 01                	push   $0x1
 10f:	e8 8d 05 00 00       	call   6a1 <printf>
 114:	83 c4 10             	add    $0x10,%esp
  setuid(2);
 117:	83 ec 0c             	sub    $0xc,%esp
 11a:	6a 02                	push   $0x2
 11c:	e8 91 04 00 00       	call   5b2 <setuid>
 121:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
 124:	e8 91 04 00 00       	call   5ba <getuid>
 129:	83 ec 04             	sub    $0x4,%esp
 12c:	50                   	push   %eax
 12d:	68 57 0a 00 00       	push   $0xa57
 132:	6a 01                	push   $0x1
 134:	e8 68 05 00 00       	call   6a1 <printf>
 139:	83 c4 10             	add    $0x10,%esp
  setuid(3);
 13c:	83 ec 0c             	sub    $0xc,%esp
 13f:	6a 03                	push   $0x3
 141:	e8 6c 04 00 00       	call   5b2 <setuid>
 146:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid() );
 149:	e8 6c 04 00 00       	call   5ba <getuid>
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	50                   	push   %eax
 152:	68 57 0a 00 00       	push   $0xa57
 157:	6a 01                	push   $0x1
 159:	e8 43 05 00 00       	call   6a1 <printf>
 15e:	83 c4 10             	add    $0x10,%esp
  setuid(0);
 161:	83 ec 0c             	sub    $0xc,%esp
 164:	6a 00                	push   $0x0
 166:	e8 47 04 00 00       	call   5b2 <setuid>
 16b:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
 16e:	e8 47 04 00 00       	call   5ba <getuid>
 173:	83 ec 04             	sub    $0x4,%esp
 176:	50                   	push   %eax
 177:	68 57 0a 00 00       	push   $0xa57
 17c:	6a 01                	push   $0x1
 17e:	e8 1e 05 00 00       	call   6a1 <printf>
 183:	83 c4 10             	add    $0x10,%esp
  setuid(-1);
 186:	83 ec 0c             	sub    $0xc,%esp
 189:	6a ff                	push   $0xffffffff
 18b:	e8 22 04 00 00       	call   5b2 <setuid>
 190:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n", getuid());
 193:	e8 22 04 00 00       	call   5ba <getuid>
 198:	83 ec 04             	sub    $0x4,%esp
 19b:	50                   	push   %eax
 19c:	68 57 0a 00 00       	push   $0xa57
 1a1:	6a 01                	push   $0x1
 1a3:	e8 f9 04 00 00       	call   6a1 <printf>
 1a8:	83 c4 10             	add    $0x10,%esp
  setuid(33000);
 1ab:	83 ec 0c             	sub    $0xc,%esp
 1ae:	68 e8 80 00 00       	push   $0x80e8
 1b3:	e8 fa 03 00 00       	call   5b2 <setuid>
 1b8:	83 c4 10             	add    $0x10,%esp
  printf(1, "%d\n\n", getuid());
 1bb:	e8 fa 03 00 00       	call   5ba <getuid>
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	50                   	push   %eax
 1c4:	68 5b 0a 00 00       	push   $0xa5b
 1c9:	6a 01                	push   $0x1
 1cb:	e8 d1 04 00 00       	call   6a1 <printf>
 1d0:	83 c4 10             	add    $0x10,%esp

  exit();
 1d3:	e8 2a 03 00 00       	call   502 <exit>

000001d8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	57                   	push   %edi
 1dc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e0:	8b 55 10             	mov    0x10(%ebp),%edx
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	89 cb                	mov    %ecx,%ebx
 1e8:	89 df                	mov    %ebx,%edi
 1ea:	89 d1                	mov    %edx,%ecx
 1ec:	fc                   	cld    
 1ed:	f3 aa                	rep stos %al,%es:(%edi)
 1ef:	89 ca                	mov    %ecx,%edx
 1f1:	89 fb                	mov    %edi,%ebx
 1f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1f9:	90                   	nop
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 297:	8b 45 10             	mov    0x10(%ebp),%eax
 29a:	50                   	push   %eax
 29b:	ff 75 0c             	pushl  0xc(%ebp)
 29e:	ff 75 08             	pushl  0x8(%ebp)
 2a1:	e8 32 ff ff ff       	call   1d8 <stosb>
 2a6:	83 c4 0c             	add    $0xc,%esp
  return dst;
 2a9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ac:	c9                   	leave  
 2ad:	c3                   	ret    

000002ae <strchr>:

char*
strchr(const char *s, char c)
{
 2ae:	55                   	push   %ebp
 2af:	89 e5                	mov    %esp,%ebp
 2b1:	83 ec 04             	sub    $0x4,%esp
 2b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2ba:	eb 14                	jmp    2d0 <strchr+0x22>
    if(*s == c)
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
 2bf:	0f b6 00             	movzbl (%eax),%eax
 2c2:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2c5:	75 05                	jne    2cc <strchr+0x1e>
      return (char*)s;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ca:	eb 13                	jmp    2df <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2cc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
 2d3:	0f b6 00             	movzbl (%eax),%eax
 2d6:	84 c0                	test   %al,%al
 2d8:	75 e2                	jne    2bc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2da:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2df:	c9                   	leave  
 2e0:	c3                   	ret    

000002e1 <gets>:

char*
gets(char *buf, int max)
{
 2e1:	55                   	push   %ebp
 2e2:	89 e5                	mov    %esp,%ebp
 2e4:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2ee:	eb 42                	jmp    332 <gets+0x51>
    cc = read(0, &c, 1);
 2f0:	83 ec 04             	sub    $0x4,%esp
 2f3:	6a 01                	push   $0x1
 2f5:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2f8:	50                   	push   %eax
 2f9:	6a 00                	push   $0x0
 2fb:	e8 1a 02 00 00       	call   51a <read>
 300:	83 c4 10             	add    $0x10,%esp
 303:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 306:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 30a:	7e 33                	jle    33f <gets+0x5e>
      break;
    buf[i++] = c;
 30c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 30f:	8d 50 01             	lea    0x1(%eax),%edx
 312:	89 55 f4             	mov    %edx,-0xc(%ebp)
 315:	89 c2                	mov    %eax,%edx
 317:	8b 45 08             	mov    0x8(%ebp),%eax
 31a:	01 c2                	add    %eax,%edx
 31c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 320:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 322:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 326:	3c 0a                	cmp    $0xa,%al
 328:	74 16                	je     340 <gets+0x5f>
 32a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 32e:	3c 0d                	cmp    $0xd,%al
 330:	74 0e                	je     340 <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 332:	8b 45 f4             	mov    -0xc(%ebp),%eax
 335:	83 c0 01             	add    $0x1,%eax
 338:	3b 45 0c             	cmp    0xc(%ebp),%eax
 33b:	7c b3                	jl     2f0 <gets+0xf>
 33d:	eb 01                	jmp    340 <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 33f:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 340:	8b 55 f4             	mov    -0xc(%ebp),%edx
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	01 d0                	add    %edx,%eax
 348:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 34e:	c9                   	leave  
 34f:	c3                   	ret    

00000350 <stat>:

int
stat(char *n, struct stat *st)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 356:	83 ec 08             	sub    $0x8,%esp
 359:	6a 00                	push   $0x0
 35b:	ff 75 08             	pushl  0x8(%ebp)
 35e:	e8 df 01 00 00       	call   542 <open>
 363:	83 c4 10             	add    $0x10,%esp
 366:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 369:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 36d:	79 07                	jns    376 <stat+0x26>
    return -1;
 36f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 374:	eb 25                	jmp    39b <stat+0x4b>
  r = fstat(fd, st);
 376:	83 ec 08             	sub    $0x8,%esp
 379:	ff 75 0c             	pushl  0xc(%ebp)
 37c:	ff 75 f4             	pushl  -0xc(%ebp)
 37f:	e8 d6 01 00 00       	call   55a <fstat>
 384:	83 c4 10             	add    $0x10,%esp
 387:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 38a:	83 ec 0c             	sub    $0xc,%esp
 38d:	ff 75 f4             	pushl  -0xc(%ebp)
 390:	e8 95 01 00 00       	call   52a <close>
 395:	83 c4 10             	add    $0x10,%esp
  return r;
 398:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 39b:	c9                   	leave  
 39c:	c3                   	ret    

0000039d <atoi>:

int
atoi(const char *s)
{
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
 3a0:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 3a3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 3aa:	eb 04                	jmp    3b0 <atoi+0x13>
 3ac:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b0:	8b 45 08             	mov    0x8(%ebp),%eax
 3b3:	0f b6 00             	movzbl (%eax),%eax
 3b6:	3c 20                	cmp    $0x20,%al
 3b8:	74 f2                	je     3ac <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 3ba:	8b 45 08             	mov    0x8(%ebp),%eax
 3bd:	0f b6 00             	movzbl (%eax),%eax
 3c0:	3c 2d                	cmp    $0x2d,%al
 3c2:	75 07                	jne    3cb <atoi+0x2e>
 3c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3c9:	eb 05                	jmp    3d0 <atoi+0x33>
 3cb:	b8 01 00 00 00       	mov    $0x1,%eax
 3d0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 00             	movzbl (%eax),%eax
 3d9:	3c 2b                	cmp    $0x2b,%al
 3db:	74 0a                	je     3e7 <atoi+0x4a>
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
 3e0:	0f b6 00             	movzbl (%eax),%eax
 3e3:	3c 2d                	cmp    $0x2d,%al
 3e5:	75 2b                	jne    412 <atoi+0x75>
    s++;
 3e7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 3eb:	eb 25                	jmp    412 <atoi+0x75>
    n = n*10 + *s++ - '0';
 3ed:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3f0:	89 d0                	mov    %edx,%eax
 3f2:	c1 e0 02             	shl    $0x2,%eax
 3f5:	01 d0                	add    %edx,%eax
 3f7:	01 c0                	add    %eax,%eax
 3f9:	89 c1                	mov    %eax,%ecx
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	8d 50 01             	lea    0x1(%eax),%edx
 401:	89 55 08             	mov    %edx,0x8(%ebp)
 404:	0f b6 00             	movzbl (%eax),%eax
 407:	0f be c0             	movsbl %al,%eax
 40a:	01 c8                	add    %ecx,%eax
 40c:	83 e8 30             	sub    $0x30,%eax
 40f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 412:	8b 45 08             	mov    0x8(%ebp),%eax
 415:	0f b6 00             	movzbl (%eax),%eax
 418:	3c 2f                	cmp    $0x2f,%al
 41a:	7e 0a                	jle    426 <atoi+0x89>
 41c:	8b 45 08             	mov    0x8(%ebp),%eax
 41f:	0f b6 00             	movzbl (%eax),%eax
 422:	3c 39                	cmp    $0x39,%al
 424:	7e c7                	jle    3ed <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 426:	8b 45 f8             	mov    -0x8(%ebp),%eax
 429:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 42d:	c9                   	leave  
 42e:	c3                   	ret    

0000042f <atoo>:

int
atoo(const char *s)
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 435:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 43c:	eb 04                	jmp    442 <atoo+0x13>
 43e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 442:	8b 45 08             	mov    0x8(%ebp),%eax
 445:	0f b6 00             	movzbl (%eax),%eax
 448:	3c 20                	cmp    $0x20,%al
 44a:	74 f2                	je     43e <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 44c:	8b 45 08             	mov    0x8(%ebp),%eax
 44f:	0f b6 00             	movzbl (%eax),%eax
 452:	3c 2d                	cmp    $0x2d,%al
 454:	75 07                	jne    45d <atoo+0x2e>
 456:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 45b:	eb 05                	jmp    462 <atoo+0x33>
 45d:	b8 01 00 00 00       	mov    $0x1,%eax
 462:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 465:	8b 45 08             	mov    0x8(%ebp),%eax
 468:	0f b6 00             	movzbl (%eax),%eax
 46b:	3c 2b                	cmp    $0x2b,%al
 46d:	74 0a                	je     479 <atoo+0x4a>
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	0f b6 00             	movzbl (%eax),%eax
 475:	3c 2d                	cmp    $0x2d,%al
 477:	75 27                	jne    4a0 <atoo+0x71>
    s++;
 479:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 47d:	eb 21                	jmp    4a0 <atoo+0x71>
    n = n*8 + *s++ - '0';
 47f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 482:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 489:	8b 45 08             	mov    0x8(%ebp),%eax
 48c:	8d 50 01             	lea    0x1(%eax),%edx
 48f:	89 55 08             	mov    %edx,0x8(%ebp)
 492:	0f b6 00             	movzbl (%eax),%eax
 495:	0f be c0             	movsbl %al,%eax
 498:	01 c8                	add    %ecx,%eax
 49a:	83 e8 30             	sub    $0x30,%eax
 49d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 4a0:	8b 45 08             	mov    0x8(%ebp),%eax
 4a3:	0f b6 00             	movzbl (%eax),%eax
 4a6:	3c 2f                	cmp    $0x2f,%al
 4a8:	7e 0a                	jle    4b4 <atoo+0x85>
 4aa:	8b 45 08             	mov    0x8(%ebp),%eax
 4ad:	0f b6 00             	movzbl (%eax),%eax
 4b0:	3c 37                	cmp    $0x37,%al
 4b2:	7e cb                	jle    47f <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 4b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 4b7:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4cf:	eb 17                	jmp    4e8 <memmove+0x2b>
    *dst++ = *src++;
 4d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4d4:	8d 50 01             	lea    0x1(%eax),%edx
 4d7:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4da:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4dd:	8d 4a 01             	lea    0x1(%edx),%ecx
 4e0:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4e3:	0f b6 12             	movzbl (%edx),%edx
 4e6:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4e8:	8b 45 10             	mov    0x10(%ebp),%eax
 4eb:	8d 50 ff             	lea    -0x1(%eax),%edx
 4ee:	89 55 10             	mov    %edx,0x10(%ebp)
 4f1:	85 c0                	test   %eax,%eax
 4f3:	7f dc                	jg     4d1 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4f8:	c9                   	leave  
 4f9:	c3                   	ret    

000004fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4fa:	b8 01 00 00 00       	mov    $0x1,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <exit>:
SYSCALL(exit)
 502:	b8 02 00 00 00       	mov    $0x2,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <wait>:
SYSCALL(wait)
 50a:	b8 03 00 00 00       	mov    $0x3,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <pipe>:
SYSCALL(pipe)
 512:	b8 04 00 00 00       	mov    $0x4,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <read>:
SYSCALL(read)
 51a:	b8 05 00 00 00       	mov    $0x5,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <write>:
SYSCALL(write)
 522:	b8 10 00 00 00       	mov    $0x10,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <close>:
SYSCALL(close)
 52a:	b8 15 00 00 00       	mov    $0x15,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <kill>:
SYSCALL(kill)
 532:	b8 06 00 00 00       	mov    $0x6,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <exec>:
SYSCALL(exec)
 53a:	b8 07 00 00 00       	mov    $0x7,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    

00000542 <open>:
SYSCALL(open)
 542:	b8 0f 00 00 00       	mov    $0xf,%eax
 547:	cd 40                	int    $0x40
 549:	c3                   	ret    

0000054a <mknod>:
SYSCALL(mknod)
 54a:	b8 11 00 00 00       	mov    $0x11,%eax
 54f:	cd 40                	int    $0x40
 551:	c3                   	ret    

00000552 <unlink>:
SYSCALL(unlink)
 552:	b8 12 00 00 00       	mov    $0x12,%eax
 557:	cd 40                	int    $0x40
 559:	c3                   	ret    

0000055a <fstat>:
SYSCALL(fstat)
 55a:	b8 08 00 00 00       	mov    $0x8,%eax
 55f:	cd 40                	int    $0x40
 561:	c3                   	ret    

00000562 <link>:
SYSCALL(link)
 562:	b8 13 00 00 00       	mov    $0x13,%eax
 567:	cd 40                	int    $0x40
 569:	c3                   	ret    

0000056a <mkdir>:
SYSCALL(mkdir)
 56a:	b8 14 00 00 00       	mov    $0x14,%eax
 56f:	cd 40                	int    $0x40
 571:	c3                   	ret    

00000572 <chdir>:
SYSCALL(chdir)
 572:	b8 09 00 00 00       	mov    $0x9,%eax
 577:	cd 40                	int    $0x40
 579:	c3                   	ret    

0000057a <dup>:
SYSCALL(dup)
 57a:	b8 0a 00 00 00       	mov    $0xa,%eax
 57f:	cd 40                	int    $0x40
 581:	c3                   	ret    

00000582 <getpid>:
SYSCALL(getpid)
 582:	b8 0b 00 00 00       	mov    $0xb,%eax
 587:	cd 40                	int    $0x40
 589:	c3                   	ret    

0000058a <sbrk>:
SYSCALL(sbrk)
 58a:	b8 0c 00 00 00       	mov    $0xc,%eax
 58f:	cd 40                	int    $0x40
 591:	c3                   	ret    

00000592 <sleep>:
SYSCALL(sleep)
 592:	b8 0d 00 00 00       	mov    $0xd,%eax
 597:	cd 40                	int    $0x40
 599:	c3                   	ret    

0000059a <uptime>:
SYSCALL(uptime)
 59a:	b8 0e 00 00 00       	mov    $0xe,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <halt>:
SYSCALL(halt)
 5a2:	b8 16 00 00 00       	mov    $0x16,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <date>:

# Added calls - Evghenii
SYSCALL(date)
 5aa:	b8 17 00 00 00       	mov    $0x17,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <setuid>:
SYSCALL(setuid)
 5b2:	b8 18 00 00 00       	mov    $0x18,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <getuid>:
SYSCALL(getuid)
 5ba:	b8 19 00 00 00       	mov    $0x19,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <setgid>:
SYSCALL(setgid)
 5c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5ca:	55                   	push   %ebp
 5cb:	89 e5                	mov    %esp,%ebp
 5cd:	83 ec 18             	sub    $0x18,%esp
 5d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d3:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5d6:	83 ec 04             	sub    $0x4,%esp
 5d9:	6a 01                	push   $0x1
 5db:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5de:	50                   	push   %eax
 5df:	ff 75 08             	pushl  0x8(%ebp)
 5e2:	e8 3b ff ff ff       	call   522 <write>
 5e7:	83 c4 10             	add    $0x10,%esp
}
 5ea:	90                   	nop
 5eb:	c9                   	leave  
 5ec:	c3                   	ret    

000005ed <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	53                   	push   %ebx
 5f1:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5f4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5fb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5ff:	74 17                	je     618 <printint+0x2b>
 601:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 605:	79 11                	jns    618 <printint+0x2b>
    neg = 1;
 607:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 60e:	8b 45 0c             	mov    0xc(%ebp),%eax
 611:	f7 d8                	neg    %eax
 613:	89 45 ec             	mov    %eax,-0x14(%ebp)
 616:	eb 06                	jmp    61e <printint+0x31>
  } else {
    x = xx;
 618:	8b 45 0c             	mov    0xc(%ebp),%eax
 61b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 61e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 625:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 628:	8d 41 01             	lea    0x1(%ecx),%eax
 62b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 62e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 631:	8b 45 ec             	mov    -0x14(%ebp),%eax
 634:	ba 00 00 00 00       	mov    $0x0,%edx
 639:	f7 f3                	div    %ebx
 63b:	89 d0                	mov    %edx,%eax
 63d:	0f b6 80 d0 0c 00 00 	movzbl 0xcd0(%eax),%eax
 644:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 648:	8b 5d 10             	mov    0x10(%ebp),%ebx
 64b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 64e:	ba 00 00 00 00       	mov    $0x0,%edx
 653:	f7 f3                	div    %ebx
 655:	89 45 ec             	mov    %eax,-0x14(%ebp)
 658:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 65c:	75 c7                	jne    625 <printint+0x38>
  if(neg)
 65e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 662:	74 2d                	je     691 <printint+0xa4>
    buf[i++] = '-';
 664:	8b 45 f4             	mov    -0xc(%ebp),%eax
 667:	8d 50 01             	lea    0x1(%eax),%edx
 66a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 66d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 672:	eb 1d                	jmp    691 <printint+0xa4>
    putc(fd, buf[i]);
 674:	8d 55 dc             	lea    -0x24(%ebp),%edx
 677:	8b 45 f4             	mov    -0xc(%ebp),%eax
 67a:	01 d0                	add    %edx,%eax
 67c:	0f b6 00             	movzbl (%eax),%eax
 67f:	0f be c0             	movsbl %al,%eax
 682:	83 ec 08             	sub    $0x8,%esp
 685:	50                   	push   %eax
 686:	ff 75 08             	pushl  0x8(%ebp)
 689:	e8 3c ff ff ff       	call   5ca <putc>
 68e:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 691:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 695:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 699:	79 d9                	jns    674 <printint+0x87>
    putc(fd, buf[i]);
}
 69b:	90                   	nop
 69c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 69f:	c9                   	leave  
 6a0:	c3                   	ret    

000006a1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6a1:	55                   	push   %ebp
 6a2:	89 e5                	mov    %esp,%ebp
 6a4:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6a7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6ae:	8d 45 0c             	lea    0xc(%ebp),%eax
 6b1:	83 c0 04             	add    $0x4,%eax
 6b4:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6b7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6be:	e9 59 01 00 00       	jmp    81c <printf+0x17b>
    c = fmt[i] & 0xff;
 6c3:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c9:	01 d0                	add    %edx,%eax
 6cb:	0f b6 00             	movzbl (%eax),%eax
 6ce:	0f be c0             	movsbl %al,%eax
 6d1:	25 ff 00 00 00       	and    $0xff,%eax
 6d6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6dd:	75 2c                	jne    70b <printf+0x6a>
      if(c == '%'){
 6df:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e3:	75 0c                	jne    6f1 <printf+0x50>
        state = '%';
 6e5:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6ec:	e9 27 01 00 00       	jmp    818 <printf+0x177>
      } else {
        putc(fd, c);
 6f1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f4:	0f be c0             	movsbl %al,%eax
 6f7:	83 ec 08             	sub    $0x8,%esp
 6fa:	50                   	push   %eax
 6fb:	ff 75 08             	pushl  0x8(%ebp)
 6fe:	e8 c7 fe ff ff       	call   5ca <putc>
 703:	83 c4 10             	add    $0x10,%esp
 706:	e9 0d 01 00 00       	jmp    818 <printf+0x177>
      }
    } else if(state == '%'){
 70b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 70f:	0f 85 03 01 00 00    	jne    818 <printf+0x177>
      if(c == 'd'){
 715:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 719:	75 1e                	jne    739 <printf+0x98>
        printint(fd, *ap, 10, 1);
 71b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71e:	8b 00                	mov    (%eax),%eax
 720:	6a 01                	push   $0x1
 722:	6a 0a                	push   $0xa
 724:	50                   	push   %eax
 725:	ff 75 08             	pushl  0x8(%ebp)
 728:	e8 c0 fe ff ff       	call   5ed <printint>
 72d:	83 c4 10             	add    $0x10,%esp
        ap++;
 730:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 734:	e9 d8 00 00 00       	jmp    811 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 739:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 73d:	74 06                	je     745 <printf+0xa4>
 73f:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 743:	75 1e                	jne    763 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 745:	8b 45 e8             	mov    -0x18(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	6a 00                	push   $0x0
 74c:	6a 10                	push   $0x10
 74e:	50                   	push   %eax
 74f:	ff 75 08             	pushl  0x8(%ebp)
 752:	e8 96 fe ff ff       	call   5ed <printint>
 757:	83 c4 10             	add    $0x10,%esp
        ap++;
 75a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 75e:	e9 ae 00 00 00       	jmp    811 <printf+0x170>
      } else if(c == 's'){
 763:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 767:	75 43                	jne    7ac <printf+0x10b>
        s = (char*)*ap;
 769:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76c:	8b 00                	mov    (%eax),%eax
 76e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 771:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 775:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 779:	75 25                	jne    7a0 <printf+0xff>
          s = "(null)";
 77b:	c7 45 f4 60 0a 00 00 	movl   $0xa60,-0xc(%ebp)
        while(*s != 0){
 782:	eb 1c                	jmp    7a0 <printf+0xff>
          putc(fd, *s);
 784:	8b 45 f4             	mov    -0xc(%ebp),%eax
 787:	0f b6 00             	movzbl (%eax),%eax
 78a:	0f be c0             	movsbl %al,%eax
 78d:	83 ec 08             	sub    $0x8,%esp
 790:	50                   	push   %eax
 791:	ff 75 08             	pushl  0x8(%ebp)
 794:	e8 31 fe ff ff       	call   5ca <putc>
 799:	83 c4 10             	add    $0x10,%esp
          s++;
 79c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a3:	0f b6 00             	movzbl (%eax),%eax
 7a6:	84 c0                	test   %al,%al
 7a8:	75 da                	jne    784 <printf+0xe3>
 7aa:	eb 65                	jmp    811 <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7ac:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7b0:	75 1d                	jne    7cf <printf+0x12e>
        putc(fd, *ap);
 7b2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b5:	8b 00                	mov    (%eax),%eax
 7b7:	0f be c0             	movsbl %al,%eax
 7ba:	83 ec 08             	sub    $0x8,%esp
 7bd:	50                   	push   %eax
 7be:	ff 75 08             	pushl  0x8(%ebp)
 7c1:	e8 04 fe ff ff       	call   5ca <putc>
 7c6:	83 c4 10             	add    $0x10,%esp
        ap++;
 7c9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7cd:	eb 42                	jmp    811 <printf+0x170>
      } else if(c == '%'){
 7cf:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7d3:	75 17                	jne    7ec <printf+0x14b>
        putc(fd, c);
 7d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d8:	0f be c0             	movsbl %al,%eax
 7db:	83 ec 08             	sub    $0x8,%esp
 7de:	50                   	push   %eax
 7df:	ff 75 08             	pushl  0x8(%ebp)
 7e2:	e8 e3 fd ff ff       	call   5ca <putc>
 7e7:	83 c4 10             	add    $0x10,%esp
 7ea:	eb 25                	jmp    811 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7ec:	83 ec 08             	sub    $0x8,%esp
 7ef:	6a 25                	push   $0x25
 7f1:	ff 75 08             	pushl  0x8(%ebp)
 7f4:	e8 d1 fd ff ff       	call   5ca <putc>
 7f9:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 7fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ff:	0f be c0             	movsbl %al,%eax
 802:	83 ec 08             	sub    $0x8,%esp
 805:	50                   	push   %eax
 806:	ff 75 08             	pushl  0x8(%ebp)
 809:	e8 bc fd ff ff       	call   5ca <putc>
 80e:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 811:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 818:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 81c:	8b 55 0c             	mov    0xc(%ebp),%edx
 81f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 822:	01 d0                	add    %edx,%eax
 824:	0f b6 00             	movzbl (%eax),%eax
 827:	84 c0                	test   %al,%al
 829:	0f 85 94 fe ff ff    	jne    6c3 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 82f:	90                   	nop
 830:	c9                   	leave  
 831:	c3                   	ret    

00000832 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 832:	55                   	push   %ebp
 833:	89 e5                	mov    %esp,%ebp
 835:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 838:	8b 45 08             	mov    0x8(%ebp),%eax
 83b:	83 e8 08             	sub    $0x8,%eax
 83e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 841:	a1 ec 0c 00 00       	mov    0xcec,%eax
 846:	89 45 fc             	mov    %eax,-0x4(%ebp)
 849:	eb 24                	jmp    86f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 84b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84e:	8b 00                	mov    (%eax),%eax
 850:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 853:	77 12                	ja     867 <free+0x35>
 855:	8b 45 f8             	mov    -0x8(%ebp),%eax
 858:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 85b:	77 24                	ja     881 <free+0x4f>
 85d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 860:	8b 00                	mov    (%eax),%eax
 862:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 865:	77 1a                	ja     881 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 867:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86a:	8b 00                	mov    (%eax),%eax
 86c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 86f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 872:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 875:	76 d4                	jbe    84b <free+0x19>
 877:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 87f:	76 ca                	jbe    84b <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 881:	8b 45 f8             	mov    -0x8(%ebp),%eax
 884:	8b 40 04             	mov    0x4(%eax),%eax
 887:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 88e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 891:	01 c2                	add    %eax,%edx
 893:	8b 45 fc             	mov    -0x4(%ebp),%eax
 896:	8b 00                	mov    (%eax),%eax
 898:	39 c2                	cmp    %eax,%edx
 89a:	75 24                	jne    8c0 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 89c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89f:	8b 50 04             	mov    0x4(%eax),%edx
 8a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a5:	8b 00                	mov    (%eax),%eax
 8a7:	8b 40 04             	mov    0x4(%eax),%eax
 8aa:	01 c2                	add    %eax,%edx
 8ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8af:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b5:	8b 00                	mov    (%eax),%eax
 8b7:	8b 10                	mov    (%eax),%edx
 8b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8bc:	89 10                	mov    %edx,(%eax)
 8be:	eb 0a                	jmp    8ca <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c3:	8b 10                	mov    (%eax),%edx
 8c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c8:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cd:	8b 40 04             	mov    0x4(%eax),%eax
 8d0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8da:	01 d0                	add    %edx,%eax
 8dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8df:	75 20                	jne    901 <free+0xcf>
    p->s.size += bp->s.size;
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 50 04             	mov    0x4(%eax),%edx
 8e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ea:	8b 40 04             	mov    0x4(%eax),%eax
 8ed:	01 c2                	add    %eax,%edx
 8ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f8:	8b 10                	mov    (%eax),%edx
 8fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fd:	89 10                	mov    %edx,(%eax)
 8ff:	eb 08                	jmp    909 <free+0xd7>
  } else
    p->s.ptr = bp;
 901:	8b 45 fc             	mov    -0x4(%ebp),%eax
 904:	8b 55 f8             	mov    -0x8(%ebp),%edx
 907:	89 10                	mov    %edx,(%eax)
  freep = p;
 909:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90c:	a3 ec 0c 00 00       	mov    %eax,0xcec
}
 911:	90                   	nop
 912:	c9                   	leave  
 913:	c3                   	ret    

00000914 <morecore>:

static Header*
morecore(uint nu)
{
 914:	55                   	push   %ebp
 915:	89 e5                	mov    %esp,%ebp
 917:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 91a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 921:	77 07                	ja     92a <morecore+0x16>
    nu = 4096;
 923:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 92a:	8b 45 08             	mov    0x8(%ebp),%eax
 92d:	c1 e0 03             	shl    $0x3,%eax
 930:	83 ec 0c             	sub    $0xc,%esp
 933:	50                   	push   %eax
 934:	e8 51 fc ff ff       	call   58a <sbrk>
 939:	83 c4 10             	add    $0x10,%esp
 93c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 93f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 943:	75 07                	jne    94c <morecore+0x38>
    return 0;
 945:	b8 00 00 00 00       	mov    $0x0,%eax
 94a:	eb 26                	jmp    972 <morecore+0x5e>
  hp = (Header*)p;
 94c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 952:	8b 45 f0             	mov    -0x10(%ebp),%eax
 955:	8b 55 08             	mov    0x8(%ebp),%edx
 958:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 95b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95e:	83 c0 08             	add    $0x8,%eax
 961:	83 ec 0c             	sub    $0xc,%esp
 964:	50                   	push   %eax
 965:	e8 c8 fe ff ff       	call   832 <free>
 96a:	83 c4 10             	add    $0x10,%esp
  return freep;
 96d:	a1 ec 0c 00 00       	mov    0xcec,%eax
}
 972:	c9                   	leave  
 973:	c3                   	ret    

00000974 <malloc>:

void*
malloc(uint nbytes)
{
 974:	55                   	push   %ebp
 975:	89 e5                	mov    %esp,%ebp
 977:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 97a:	8b 45 08             	mov    0x8(%ebp),%eax
 97d:	83 c0 07             	add    $0x7,%eax
 980:	c1 e8 03             	shr    $0x3,%eax
 983:	83 c0 01             	add    $0x1,%eax
 986:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 989:	a1 ec 0c 00 00       	mov    0xcec,%eax
 98e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 991:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 995:	75 23                	jne    9ba <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 997:	c7 45 f0 e4 0c 00 00 	movl   $0xce4,-0x10(%ebp)
 99e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a1:	a3 ec 0c 00 00       	mov    %eax,0xcec
 9a6:	a1 ec 0c 00 00       	mov    0xcec,%eax
 9ab:	a3 e4 0c 00 00       	mov    %eax,0xce4
    base.s.size = 0;
 9b0:	c7 05 e8 0c 00 00 00 	movl   $0x0,0xce8
 9b7:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9bd:	8b 00                	mov    (%eax),%eax
 9bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c5:	8b 40 04             	mov    0x4(%eax),%eax
 9c8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9cb:	72 4d                	jb     a1a <malloc+0xa6>
      if(p->s.size == nunits)
 9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d0:	8b 40 04             	mov    0x4(%eax),%eax
 9d3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9d6:	75 0c                	jne    9e4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9db:	8b 10                	mov    (%eax),%edx
 9dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e0:	89 10                	mov    %edx,(%eax)
 9e2:	eb 26                	jmp    a0a <malloc+0x96>
      else {
        p->s.size -= nunits;
 9e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e7:	8b 40 04             	mov    0x4(%eax),%eax
 9ea:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9ed:	89 c2                	mov    %eax,%edx
 9ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f8:	8b 40 04             	mov    0x4(%eax),%eax
 9fb:	c1 e0 03             	shl    $0x3,%eax
 9fe:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a04:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a07:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a0a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0d:	a3 ec 0c 00 00       	mov    %eax,0xcec
      return (void*)(p + 1);
 a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a15:	83 c0 08             	add    $0x8,%eax
 a18:	eb 3b                	jmp    a55 <malloc+0xe1>
    }
    if(p == freep)
 a1a:	a1 ec 0c 00 00       	mov    0xcec,%eax
 a1f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a22:	75 1e                	jne    a42 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a24:	83 ec 0c             	sub    $0xc,%esp
 a27:	ff 75 ec             	pushl  -0x14(%ebp)
 a2a:	e8 e5 fe ff ff       	call   914 <morecore>
 a2f:	83 c4 10             	add    $0x10,%esp
 a32:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a35:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a39:	75 07                	jne    a42 <malloc+0xce>
        return 0;
 a3b:	b8 00 00 00 00       	mov    $0x0,%eax
 a40:	eb 13                	jmp    a55 <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a45:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a48:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4b:	8b 00                	mov    (%eax),%eax
 a4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a50:	e9 6d ff ff ff       	jmp    9c2 <malloc+0x4e>
}
 a55:	c9                   	leave  
 a56:	c3                   	ret    
