
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	81 ec 24 02 00 00    	sub    $0x224,%esp
  int fd, i;
  char path[] = "stressfs0";
  14:	c7 45 e6 73 74 72 65 	movl   $0x65727473,-0x1a(%ebp)
  1b:	c7 45 ea 73 73 66 73 	movl   $0x73667373,-0x16(%ebp)
  22:	66 c7 45 ee 30 00    	movw   $0x30,-0x12(%ebp)
  char data[512];

  printf(1, "stressfs starting\n");
  28:	83 ec 08             	sub    $0x8,%esp
  2b:	68 d1 09 00 00       	push   $0x9d1
  30:	6a 01                	push   $0x1
  32:	e8 e4 05 00 00       	call   61b <printf>
  37:	83 c4 10             	add    $0x10,%esp
  memset(data, 'a', sizeof(data));
  3a:	83 ec 04             	sub    $0x4,%esp
  3d:	68 00 02 00 00       	push   $0x200
  42:	6a 61                	push   $0x61
  44:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  4a:	50                   	push   %eax
  4b:	e8 be 01 00 00       	call   20e <memset>
  50:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
  53:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  5a:	eb 0d                	jmp    69 <main+0x69>
    if(fork() > 0)
  5c:	e8 13 04 00 00       	call   474 <fork>
  61:	85 c0                	test   %eax,%eax
  63:	7f 0c                	jg     71 <main+0x71>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  65:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  69:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  6d:	7e ed                	jle    5c <main+0x5c>
  6f:	eb 01                	jmp    72 <main+0x72>
    if(fork() > 0)
      break;
  71:	90                   	nop

  printf(1, "write %d\n", i);
  72:	83 ec 04             	sub    $0x4,%esp
  75:	ff 75 f4             	pushl  -0xc(%ebp)
  78:	68 e4 09 00 00       	push   $0x9e4
  7d:	6a 01                	push   $0x1
  7f:	e8 97 05 00 00       	call   61b <printf>
  84:	83 c4 10             	add    $0x10,%esp

  path[8] += i;
  87:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  8b:	89 c2                	mov    %eax,%edx
  8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  90:	01 d0                	add    %edx,%eax
  92:	88 45 ee             	mov    %al,-0x12(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
  95:	83 ec 08             	sub    $0x8,%esp
  98:	68 02 02 00 00       	push   $0x202
  9d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
  a0:	50                   	push   %eax
  a1:	e8 16 04 00 00       	call   4bc <open>
  a6:	83 c4 10             	add    $0x10,%esp
  a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 20; i++)
  ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  b3:	eb 1e                	jmp    d3 <main+0xd3>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  b5:	83 ec 04             	sub    $0x4,%esp
  b8:	68 00 02 00 00       	push   $0x200
  bd:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	ff 75 f0             	pushl  -0x10(%ebp)
  c7:	e8 d0 03 00 00       	call   49c <write>
  cc:	83 c4 10             	add    $0x10,%esp

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
  cf:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  d3:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
  d7:	7e dc                	jle    b5 <main+0xb5>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
  d9:	83 ec 0c             	sub    $0xc,%esp
  dc:	ff 75 f0             	pushl  -0x10(%ebp)
  df:	e8 c0 03 00 00       	call   4a4 <close>
  e4:	83 c4 10             	add    $0x10,%esp

  printf(1, "read\n");
  e7:	83 ec 08             	sub    $0x8,%esp
  ea:	68 ee 09 00 00       	push   $0x9ee
  ef:	6a 01                	push   $0x1
  f1:	e8 25 05 00 00       	call   61b <printf>
  f6:	83 c4 10             	add    $0x10,%esp

  fd = open(path, O_RDONLY);
  f9:	83 ec 08             	sub    $0x8,%esp
  fc:	6a 00                	push   $0x0
  fe:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 101:	50                   	push   %eax
 102:	e8 b5 03 00 00       	call   4bc <open>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for (i = 0; i < 20; i++)
 10d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 114:	eb 1e                	jmp    134 <main+0x134>
    read(fd, data, sizeof(data));
 116:	83 ec 04             	sub    $0x4,%esp
 119:	68 00 02 00 00       	push   $0x200
 11e:	8d 85 e6 fd ff ff    	lea    -0x21a(%ebp),%eax
 124:	50                   	push   %eax
 125:	ff 75 f0             	pushl  -0x10(%ebp)
 128:	e8 67 03 00 00       	call   494 <read>
 12d:	83 c4 10             	add    $0x10,%esp
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 130:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 134:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
 138:	7e dc                	jle    116 <main+0x116>
    read(fd, data, sizeof(data));
  close(fd);
 13a:	83 ec 0c             	sub    $0xc,%esp
 13d:	ff 75 f0             	pushl  -0x10(%ebp)
 140:	e8 5f 03 00 00       	call   4a4 <close>
 145:	83 c4 10             	add    $0x10,%esp

  wait();
 148:	e8 37 03 00 00       	call   484 <wait>
  
  exit();
 14d:	e8 2a 03 00 00       	call   47c <exit>

00000152 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	57                   	push   %edi
 156:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 157:	8b 4d 08             	mov    0x8(%ebp),%ecx
 15a:	8b 55 10             	mov    0x10(%ebp),%edx
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	89 cb                	mov    %ecx,%ebx
 162:	89 df                	mov    %ebx,%edi
 164:	89 d1                	mov    %edx,%ecx
 166:	fc                   	cld    
 167:	f3 aa                	rep stos %al,%es:(%edi)
 169:	89 ca                	mov    %ecx,%edx
 16b:	89 fb                	mov    %edi,%ebx
 16d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 170:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 173:	90                   	nop
 174:	5b                   	pop    %ebx
 175:	5f                   	pop    %edi
 176:	5d                   	pop    %ebp
 177:	c3                   	ret    

00000178 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 178:	55                   	push   %ebp
 179:	89 e5                	mov    %esp,%ebp
 17b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 17e:	8b 45 08             	mov    0x8(%ebp),%eax
 181:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 184:	90                   	nop
 185:	8b 45 08             	mov    0x8(%ebp),%eax
 188:	8d 50 01             	lea    0x1(%eax),%edx
 18b:	89 55 08             	mov    %edx,0x8(%ebp)
 18e:	8b 55 0c             	mov    0xc(%ebp),%edx
 191:	8d 4a 01             	lea    0x1(%edx),%ecx
 194:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 197:	0f b6 12             	movzbl (%edx),%edx
 19a:	88 10                	mov    %dl,(%eax)
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	84 c0                	test   %al,%al
 1a1:	75 e2                	jne    185 <strcpy+0xd>
    ;
  return os;
 1a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1ab:	eb 08                	jmp    1b5 <strcmp+0xd>
    p++, q++;
 1ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1b5:	8b 45 08             	mov    0x8(%ebp),%eax
 1b8:	0f b6 00             	movzbl (%eax),%eax
 1bb:	84 c0                	test   %al,%al
 1bd:	74 10                	je     1cf <strcmp+0x27>
 1bf:	8b 45 08             	mov    0x8(%ebp),%eax
 1c2:	0f b6 10             	movzbl (%eax),%edx
 1c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c8:	0f b6 00             	movzbl (%eax),%eax
 1cb:	38 c2                	cmp    %al,%dl
 1cd:	74 de                	je     1ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1cf:	8b 45 08             	mov    0x8(%ebp),%eax
 1d2:	0f b6 00             	movzbl (%eax),%eax
 1d5:	0f b6 d0             	movzbl %al,%edx
 1d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1db:	0f b6 00             	movzbl (%eax),%eax
 1de:	0f b6 c0             	movzbl %al,%eax
 1e1:	29 c2                	sub    %eax,%edx
 1e3:	89 d0                	mov    %edx,%eax
}
 1e5:	5d                   	pop    %ebp
 1e6:	c3                   	ret    

000001e7 <strlen>:

uint
strlen(char *s)
{
 1e7:	55                   	push   %ebp
 1e8:	89 e5                	mov    %esp,%ebp
 1ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1f4:	eb 04                	jmp    1fa <strlen+0x13>
 1f6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1fa:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	01 d0                	add    %edx,%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	84 c0                	test   %al,%al
 207:	75 ed                	jne    1f6 <strlen+0xf>
    ;
  return n;
 209:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <memset>:

void*
memset(void *dst, int c, uint n)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 211:	8b 45 10             	mov    0x10(%ebp),%eax
 214:	50                   	push   %eax
 215:	ff 75 0c             	pushl  0xc(%ebp)
 218:	ff 75 08             	pushl  0x8(%ebp)
 21b:	e8 32 ff ff ff       	call   152 <stosb>
 220:	83 c4 0c             	add    $0xc,%esp
  return dst;
 223:	8b 45 08             	mov    0x8(%ebp),%eax
}
 226:	c9                   	leave  
 227:	c3                   	ret    

00000228 <strchr>:

char*
strchr(const char *s, char c)
{
 228:	55                   	push   %ebp
 229:	89 e5                	mov    %esp,%ebp
 22b:	83 ec 04             	sub    $0x4,%esp
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 234:	eb 14                	jmp    24a <strchr+0x22>
    if(*s == c)
 236:	8b 45 08             	mov    0x8(%ebp),%eax
 239:	0f b6 00             	movzbl (%eax),%eax
 23c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 23f:	75 05                	jne    246 <strchr+0x1e>
      return (char*)s;
 241:	8b 45 08             	mov    0x8(%ebp),%eax
 244:	eb 13                	jmp    259 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 246:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24a:	8b 45 08             	mov    0x8(%ebp),%eax
 24d:	0f b6 00             	movzbl (%eax),%eax
 250:	84 c0                	test   %al,%al
 252:	75 e2                	jne    236 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 254:	b8 00 00 00 00       	mov    $0x0,%eax
}
 259:	c9                   	leave  
 25a:	c3                   	ret    

0000025b <gets>:

char*
gets(char *buf, int max)
{
 25b:	55                   	push   %ebp
 25c:	89 e5                	mov    %esp,%ebp
 25e:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 261:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 268:	eb 42                	jmp    2ac <gets+0x51>
    cc = read(0, &c, 1);
 26a:	83 ec 04             	sub    $0x4,%esp
 26d:	6a 01                	push   $0x1
 26f:	8d 45 ef             	lea    -0x11(%ebp),%eax
 272:	50                   	push   %eax
 273:	6a 00                	push   $0x0
 275:	e8 1a 02 00 00       	call   494 <read>
 27a:	83 c4 10             	add    $0x10,%esp
 27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 284:	7e 33                	jle    2b9 <gets+0x5e>
      break;
    buf[i++] = c;
 286:	8b 45 f4             	mov    -0xc(%ebp),%eax
 289:	8d 50 01             	lea    0x1(%eax),%edx
 28c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 28f:	89 c2                	mov    %eax,%edx
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	01 c2                	add    %eax,%edx
 296:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 29c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a0:	3c 0a                	cmp    $0xa,%al
 2a2:	74 16                	je     2ba <gets+0x5f>
 2a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2a8:	3c 0d                	cmp    $0xd,%al
 2aa:	74 0e                	je     2ba <gets+0x5f>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2af:	83 c0 01             	add    $0x1,%eax
 2b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2b5:	7c b3                	jl     26a <gets+0xf>
 2b7:	eb 01                	jmp    2ba <gets+0x5f>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2b9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	01 d0                	add    %edx,%eax
 2c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <stat>:

int
stat(char *n, struct stat *st)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2d0:	83 ec 08             	sub    $0x8,%esp
 2d3:	6a 00                	push   $0x0
 2d5:	ff 75 08             	pushl  0x8(%ebp)
 2d8:	e8 df 01 00 00       	call   4bc <open>
 2dd:	83 c4 10             	add    $0x10,%esp
 2e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2e7:	79 07                	jns    2f0 <stat+0x26>
    return -1;
 2e9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2ee:	eb 25                	jmp    315 <stat+0x4b>
  r = fstat(fd, st);
 2f0:	83 ec 08             	sub    $0x8,%esp
 2f3:	ff 75 0c             	pushl  0xc(%ebp)
 2f6:	ff 75 f4             	pushl  -0xc(%ebp)
 2f9:	e8 d6 01 00 00       	call   4d4 <fstat>
 2fe:	83 c4 10             	add    $0x10,%esp
 301:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 304:	83 ec 0c             	sub    $0xc,%esp
 307:	ff 75 f4             	pushl  -0xc(%ebp)
 30a:	e8 95 01 00 00       	call   4a4 <close>
 30f:	83 c4 10             	add    $0x10,%esp
  return r;
 312:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 315:	c9                   	leave  
 316:	c3                   	ret    

00000317 <atoi>:

int
atoi(const char *s)
{
 317:	55                   	push   %ebp
 318:	89 e5                	mov    %esp,%ebp
 31a:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 31d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 324:	eb 04                	jmp    32a <atoi+0x13>
 326:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 32a:	8b 45 08             	mov    0x8(%ebp),%eax
 32d:	0f b6 00             	movzbl (%eax),%eax
 330:	3c 20                	cmp    $0x20,%al
 332:	74 f2                	je     326 <atoi+0xf>
  sign = (*s == '-') ? -1 : 1;
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	0f b6 00             	movzbl (%eax),%eax
 33a:	3c 2d                	cmp    $0x2d,%al
 33c:	75 07                	jne    345 <atoi+0x2e>
 33e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 343:	eb 05                	jmp    34a <atoi+0x33>
 345:	b8 01 00 00 00       	mov    $0x1,%eax
 34a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 34d:	8b 45 08             	mov    0x8(%ebp),%eax
 350:	0f b6 00             	movzbl (%eax),%eax
 353:	3c 2b                	cmp    $0x2b,%al
 355:	74 0a                	je     361 <atoi+0x4a>
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	0f b6 00             	movzbl (%eax),%eax
 35d:	3c 2d                	cmp    $0x2d,%al
 35f:	75 2b                	jne    38c <atoi+0x75>
    s++;
 361:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '9')
 365:	eb 25                	jmp    38c <atoi+0x75>
    n = n*10 + *s++ - '0';
 367:	8b 55 fc             	mov    -0x4(%ebp),%edx
 36a:	89 d0                	mov    %edx,%eax
 36c:	c1 e0 02             	shl    $0x2,%eax
 36f:	01 d0                	add    %edx,%eax
 371:	01 c0                	add    %eax,%eax
 373:	89 c1                	mov    %eax,%ecx
 375:	8b 45 08             	mov    0x8(%ebp),%eax
 378:	8d 50 01             	lea    0x1(%eax),%edx
 37b:	89 55 08             	mov    %edx,0x8(%ebp)
 37e:	0f b6 00             	movzbl (%eax),%eax
 381:	0f be c0             	movsbl %al,%eax
 384:	01 c8                	add    %ecx,%eax
 386:	83 e8 30             	sub    $0x30,%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '9')
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	0f b6 00             	movzbl (%eax),%eax
 392:	3c 2f                	cmp    $0x2f,%al
 394:	7e 0a                	jle    3a0 <atoi+0x89>
 396:	8b 45 08             	mov    0x8(%ebp),%eax
 399:	0f b6 00             	movzbl (%eax),%eax
 39c:	3c 39                	cmp    $0x39,%al
 39e:	7e c7                	jle    367 <atoi+0x50>
    n = n*10 + *s++ - '0';
  return sign*n;
 3a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3a3:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 3a7:	c9                   	leave  
 3a8:	c3                   	ret    

000003a9 <atoo>:

int
atoo(const char *s)
{
 3a9:	55                   	push   %ebp
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	83 ec 10             	sub    $0x10,%esp
  int n, sign;

  n = 0;
 3af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while (*s == ' ') s++;
 3b6:	eb 04                	jmp    3bc <atoo+0x13>
 3b8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3bc:	8b 45 08             	mov    0x8(%ebp),%eax
 3bf:	0f b6 00             	movzbl (%eax),%eax
 3c2:	3c 20                	cmp    $0x20,%al
 3c4:	74 f2                	je     3b8 <atoo+0xf>
  sign = (*s == '-') ? -1 : 1;
 3c6:	8b 45 08             	mov    0x8(%ebp),%eax
 3c9:	0f b6 00             	movzbl (%eax),%eax
 3cc:	3c 2d                	cmp    $0x2d,%al
 3ce:	75 07                	jne    3d7 <atoo+0x2e>
 3d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 3d5:	eb 05                	jmp    3dc <atoo+0x33>
 3d7:	b8 01 00 00 00       	mov    $0x1,%eax
 3dc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  if (*s == '+'  || *s == '-')
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	0f b6 00             	movzbl (%eax),%eax
 3e5:	3c 2b                	cmp    $0x2b,%al
 3e7:	74 0a                	je     3f3 <atoo+0x4a>
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
 3ef:	3c 2d                	cmp    $0x2d,%al
 3f1:	75 27                	jne    41a <atoo+0x71>
    s++;
 3f3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  while('0' <= *s && *s <= '7')
 3f7:	eb 21                	jmp    41a <atoo+0x71>
    n = n*8 + *s++ - '0';
 3f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3fc:	8d 0c c5 00 00 00 00 	lea    0x0(,%eax,8),%ecx
 403:	8b 45 08             	mov    0x8(%ebp),%eax
 406:	8d 50 01             	lea    0x1(%eax),%edx
 409:	89 55 08             	mov    %edx,0x8(%ebp)
 40c:	0f b6 00             	movzbl (%eax),%eax
 40f:	0f be c0             	movsbl %al,%eax
 412:	01 c8                	add    %ecx,%eax
 414:	83 e8 30             	sub    $0x30,%eax
 417:	89 45 fc             	mov    %eax,-0x4(%ebp)
  n = 0;
  while (*s == ' ') s++;
  sign = (*s == '-') ? -1 : 1;
  if (*s == '+'  || *s == '-')
    s++;
  while('0' <= *s && *s <= '7')
 41a:	8b 45 08             	mov    0x8(%ebp),%eax
 41d:	0f b6 00             	movzbl (%eax),%eax
 420:	3c 2f                	cmp    $0x2f,%al
 422:	7e 0a                	jle    42e <atoo+0x85>
 424:	8b 45 08             	mov    0x8(%ebp),%eax
 427:	0f b6 00             	movzbl (%eax),%eax
 42a:	3c 37                	cmp    $0x37,%al
 42c:	7e cb                	jle    3f9 <atoo+0x50>
    n = n*8 + *s++ - '0';
  return sign*n;
 42e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 431:	0f af 45 fc          	imul   -0x4(%ebp),%eax
}
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <memmove>:


void*
memmove(void *vdst, void *vsrc, int n)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 43d:	8b 45 08             	mov    0x8(%ebp),%eax
 440:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 443:	8b 45 0c             	mov    0xc(%ebp),%eax
 446:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 449:	eb 17                	jmp    462 <memmove+0x2b>
    *dst++ = *src++;
 44b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 44e:	8d 50 01             	lea    0x1(%eax),%edx
 451:	89 55 fc             	mov    %edx,-0x4(%ebp)
 454:	8b 55 f8             	mov    -0x8(%ebp),%edx
 457:	8d 4a 01             	lea    0x1(%edx),%ecx
 45a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 45d:	0f b6 12             	movzbl (%edx),%edx
 460:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 462:	8b 45 10             	mov    0x10(%ebp),%eax
 465:	8d 50 ff             	lea    -0x1(%eax),%edx
 468:	89 55 10             	mov    %edx,0x10(%ebp)
 46b:	85 c0                	test   %eax,%eax
 46d:	7f dc                	jg     44b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 472:	c9                   	leave  
 473:	c3                   	ret    

00000474 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 474:	b8 01 00 00 00       	mov    $0x1,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <exit>:
SYSCALL(exit)
 47c:	b8 02 00 00 00       	mov    $0x2,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <wait>:
SYSCALL(wait)
 484:	b8 03 00 00 00       	mov    $0x3,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <pipe>:
SYSCALL(pipe)
 48c:	b8 04 00 00 00       	mov    $0x4,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <read>:
SYSCALL(read)
 494:	b8 05 00 00 00       	mov    $0x5,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <write>:
SYSCALL(write)
 49c:	b8 10 00 00 00       	mov    $0x10,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <close>:
SYSCALL(close)
 4a4:	b8 15 00 00 00       	mov    $0x15,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <kill>:
SYSCALL(kill)
 4ac:	b8 06 00 00 00       	mov    $0x6,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <exec>:
SYSCALL(exec)
 4b4:	b8 07 00 00 00       	mov    $0x7,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <open>:
SYSCALL(open)
 4bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <mknod>:
SYSCALL(mknod)
 4c4:	b8 11 00 00 00       	mov    $0x11,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <unlink>:
SYSCALL(unlink)
 4cc:	b8 12 00 00 00       	mov    $0x12,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <fstat>:
SYSCALL(fstat)
 4d4:	b8 08 00 00 00       	mov    $0x8,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <link>:
SYSCALL(link)
 4dc:	b8 13 00 00 00       	mov    $0x13,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <mkdir>:
SYSCALL(mkdir)
 4e4:	b8 14 00 00 00       	mov    $0x14,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <chdir>:
SYSCALL(chdir)
 4ec:	b8 09 00 00 00       	mov    $0x9,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <dup>:
SYSCALL(dup)
 4f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <getpid>:
SYSCALL(getpid)
 4fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <sbrk>:
SYSCALL(sbrk)
 504:	b8 0c 00 00 00       	mov    $0xc,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <sleep>:
SYSCALL(sleep)
 50c:	b8 0d 00 00 00       	mov    $0xd,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <uptime>:
SYSCALL(uptime)
 514:	b8 0e 00 00 00       	mov    $0xe,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <halt>:
SYSCALL(halt)
 51c:	b8 16 00 00 00       	mov    $0x16,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <date>:

# Added calls - Evghenii
SYSCALL(date)
 524:	b8 17 00 00 00       	mov    $0x17,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <setuid>:
SYSCALL(setuid)
 52c:	b8 18 00 00 00       	mov    $0x18,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <getuid>:
SYSCALL(getuid)
 534:	b8 19 00 00 00       	mov    $0x19,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <setgid>:
SYSCALL(setgid)
 53c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 544:	55                   	push   %ebp
 545:	89 e5                	mov    %esp,%ebp
 547:	83 ec 18             	sub    $0x18,%esp
 54a:	8b 45 0c             	mov    0xc(%ebp),%eax
 54d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 550:	83 ec 04             	sub    $0x4,%esp
 553:	6a 01                	push   $0x1
 555:	8d 45 f4             	lea    -0xc(%ebp),%eax
 558:	50                   	push   %eax
 559:	ff 75 08             	pushl  0x8(%ebp)
 55c:	e8 3b ff ff ff       	call   49c <write>
 561:	83 c4 10             	add    $0x10,%esp
}
 564:	90                   	nop
 565:	c9                   	leave  
 566:	c3                   	ret    

00000567 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 567:	55                   	push   %ebp
 568:	89 e5                	mov    %esp,%ebp
 56a:	53                   	push   %ebx
 56b:	83 ec 24             	sub    $0x24,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 56e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 575:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 579:	74 17                	je     592 <printint+0x2b>
 57b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 57f:	79 11                	jns    592 <printint+0x2b>
    neg = 1;
 581:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 588:	8b 45 0c             	mov    0xc(%ebp),%eax
 58b:	f7 d8                	neg    %eax
 58d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 590:	eb 06                	jmp    598 <printint+0x31>
  } else {
    x = xx;
 592:	8b 45 0c             	mov    0xc(%ebp),%eax
 595:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 598:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 59f:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 5a2:	8d 41 01             	lea    0x1(%ecx),%eax
 5a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5a8:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ae:	ba 00 00 00 00       	mov    $0x0,%edx
 5b3:	f7 f3                	div    %ebx
 5b5:	89 d0                	mov    %edx,%eax
 5b7:	0f b6 80 64 0c 00 00 	movzbl 0xc64(%eax),%eax
 5be:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 5c2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c8:	ba 00 00 00 00       	mov    $0x0,%edx
 5cd:	f7 f3                	div    %ebx
 5cf:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d6:	75 c7                	jne    59f <printint+0x38>
  if(neg)
 5d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5dc:	74 2d                	je     60b <printint+0xa4>
    buf[i++] = '-';
 5de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e1:	8d 50 01             	lea    0x1(%eax),%edx
 5e4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5e7:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5ec:	eb 1d                	jmp    60b <printint+0xa4>
    putc(fd, buf[i]);
 5ee:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f4:	01 d0                	add    %edx,%eax
 5f6:	0f b6 00             	movzbl (%eax),%eax
 5f9:	0f be c0             	movsbl %al,%eax
 5fc:	83 ec 08             	sub    $0x8,%esp
 5ff:	50                   	push   %eax
 600:	ff 75 08             	pushl  0x8(%ebp)
 603:	e8 3c ff ff ff       	call   544 <putc>
 608:	83 c4 10             	add    $0x10,%esp
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 60b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 60f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 613:	79 d9                	jns    5ee <printint+0x87>
    putc(fd, buf[i]);
}
 615:	90                   	nop
 616:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 619:	c9                   	leave  
 61a:	c3                   	ret    

0000061b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 61b:	55                   	push   %ebp
 61c:	89 e5                	mov    %esp,%ebp
 61e:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 621:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 628:	8d 45 0c             	lea    0xc(%ebp),%eax
 62b:	83 c0 04             	add    $0x4,%eax
 62e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 631:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 638:	e9 59 01 00 00       	jmp    796 <printf+0x17b>
    c = fmt[i] & 0xff;
 63d:	8b 55 0c             	mov    0xc(%ebp),%edx
 640:	8b 45 f0             	mov    -0x10(%ebp),%eax
 643:	01 d0                	add    %edx,%eax
 645:	0f b6 00             	movzbl (%eax),%eax
 648:	0f be c0             	movsbl %al,%eax
 64b:	25 ff 00 00 00       	and    $0xff,%eax
 650:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 653:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 657:	75 2c                	jne    685 <printf+0x6a>
      if(c == '%'){
 659:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 65d:	75 0c                	jne    66b <printf+0x50>
        state = '%';
 65f:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 666:	e9 27 01 00 00       	jmp    792 <printf+0x177>
      } else {
        putc(fd, c);
 66b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 66e:	0f be c0             	movsbl %al,%eax
 671:	83 ec 08             	sub    $0x8,%esp
 674:	50                   	push   %eax
 675:	ff 75 08             	pushl  0x8(%ebp)
 678:	e8 c7 fe ff ff       	call   544 <putc>
 67d:	83 c4 10             	add    $0x10,%esp
 680:	e9 0d 01 00 00       	jmp    792 <printf+0x177>
      }
    } else if(state == '%'){
 685:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 689:	0f 85 03 01 00 00    	jne    792 <printf+0x177>
      if(c == 'd'){
 68f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 693:	75 1e                	jne    6b3 <printf+0x98>
        printint(fd, *ap, 10, 1);
 695:	8b 45 e8             	mov    -0x18(%ebp),%eax
 698:	8b 00                	mov    (%eax),%eax
 69a:	6a 01                	push   $0x1
 69c:	6a 0a                	push   $0xa
 69e:	50                   	push   %eax
 69f:	ff 75 08             	pushl  0x8(%ebp)
 6a2:	e8 c0 fe ff ff       	call   567 <printint>
 6a7:	83 c4 10             	add    $0x10,%esp
        ap++;
 6aa:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6ae:	e9 d8 00 00 00       	jmp    78b <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 6b3:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 6b7:	74 06                	je     6bf <printf+0xa4>
 6b9:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6bd:	75 1e                	jne    6dd <printf+0xc2>
        printint(fd, *ap, 16, 0);
 6bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6c2:	8b 00                	mov    (%eax),%eax
 6c4:	6a 00                	push   $0x0
 6c6:	6a 10                	push   $0x10
 6c8:	50                   	push   %eax
 6c9:	ff 75 08             	pushl  0x8(%ebp)
 6cc:	e8 96 fe ff ff       	call   567 <printint>
 6d1:	83 c4 10             	add    $0x10,%esp
        ap++;
 6d4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6d8:	e9 ae 00 00 00       	jmp    78b <printf+0x170>
      } else if(c == 's'){
 6dd:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6e1:	75 43                	jne    726 <printf+0x10b>
        s = (char*)*ap;
 6e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e6:	8b 00                	mov    (%eax),%eax
 6e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6eb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6ef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6f3:	75 25                	jne    71a <printf+0xff>
          s = "(null)";
 6f5:	c7 45 f4 f4 09 00 00 	movl   $0x9f4,-0xc(%ebp)
        while(*s != 0){
 6fc:	eb 1c                	jmp    71a <printf+0xff>
          putc(fd, *s);
 6fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 701:	0f b6 00             	movzbl (%eax),%eax
 704:	0f be c0             	movsbl %al,%eax
 707:	83 ec 08             	sub    $0x8,%esp
 70a:	50                   	push   %eax
 70b:	ff 75 08             	pushl  0x8(%ebp)
 70e:	e8 31 fe ff ff       	call   544 <putc>
 713:	83 c4 10             	add    $0x10,%esp
          s++;
 716:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 71a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71d:	0f b6 00             	movzbl (%eax),%eax
 720:	84 c0                	test   %al,%al
 722:	75 da                	jne    6fe <printf+0xe3>
 724:	eb 65                	jmp    78b <printf+0x170>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 726:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 72a:	75 1d                	jne    749 <printf+0x12e>
        putc(fd, *ap);
 72c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 72f:	8b 00                	mov    (%eax),%eax
 731:	0f be c0             	movsbl %al,%eax
 734:	83 ec 08             	sub    $0x8,%esp
 737:	50                   	push   %eax
 738:	ff 75 08             	pushl  0x8(%ebp)
 73b:	e8 04 fe ff ff       	call   544 <putc>
 740:	83 c4 10             	add    $0x10,%esp
        ap++;
 743:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 747:	eb 42                	jmp    78b <printf+0x170>
      } else if(c == '%'){
 749:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 74d:	75 17                	jne    766 <printf+0x14b>
        putc(fd, c);
 74f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 752:	0f be c0             	movsbl %al,%eax
 755:	83 ec 08             	sub    $0x8,%esp
 758:	50                   	push   %eax
 759:	ff 75 08             	pushl  0x8(%ebp)
 75c:	e8 e3 fd ff ff       	call   544 <putc>
 761:	83 c4 10             	add    $0x10,%esp
 764:	eb 25                	jmp    78b <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 766:	83 ec 08             	sub    $0x8,%esp
 769:	6a 25                	push   $0x25
 76b:	ff 75 08             	pushl  0x8(%ebp)
 76e:	e8 d1 fd ff ff       	call   544 <putc>
 773:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 776:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 779:	0f be c0             	movsbl %al,%eax
 77c:	83 ec 08             	sub    $0x8,%esp
 77f:	50                   	push   %eax
 780:	ff 75 08             	pushl  0x8(%ebp)
 783:	e8 bc fd ff ff       	call   544 <putc>
 788:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 78b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 792:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 796:	8b 55 0c             	mov    0xc(%ebp),%edx
 799:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79c:	01 d0                	add    %edx,%eax
 79e:	0f b6 00             	movzbl (%eax),%eax
 7a1:	84 c0                	test   %al,%al
 7a3:	0f 85 94 fe ff ff    	jne    63d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7a9:	90                   	nop
 7aa:	c9                   	leave  
 7ab:	c3                   	ret    

000007ac <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7ac:	55                   	push   %ebp
 7ad:	89 e5                	mov    %esp,%ebp
 7af:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7b2:	8b 45 08             	mov    0x8(%ebp),%eax
 7b5:	83 e8 08             	sub    $0x8,%eax
 7b8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7bb:	a1 80 0c 00 00       	mov    0xc80,%eax
 7c0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7c3:	eb 24                	jmp    7e9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7cd:	77 12                	ja     7e1 <free+0x35>
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d5:	77 24                	ja     7fb <free+0x4f>
 7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7df:	77 1a                	ja     7fb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	8b 00                	mov    (%eax),%eax
 7e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ec:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ef:	76 d4                	jbe    7c5 <free+0x19>
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f9:	76 ca                	jbe    7c5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	8b 40 04             	mov    0x4(%eax),%eax
 801:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 808:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80b:	01 c2                	add    %eax,%edx
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	8b 00                	mov    (%eax),%eax
 812:	39 c2                	cmp    %eax,%edx
 814:	75 24                	jne    83a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 816:	8b 45 f8             	mov    -0x8(%ebp),%eax
 819:	8b 50 04             	mov    0x4(%eax),%edx
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	8b 40 04             	mov    0x4(%eax),%eax
 824:	01 c2                	add    %eax,%edx
 826:	8b 45 f8             	mov    -0x8(%ebp),%eax
 829:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 82c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82f:	8b 00                	mov    (%eax),%eax
 831:	8b 10                	mov    (%eax),%edx
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	89 10                	mov    %edx,(%eax)
 838:	eb 0a                	jmp    844 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 83a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83d:	8b 10                	mov    (%eax),%edx
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 844:	8b 45 fc             	mov    -0x4(%ebp),%eax
 847:	8b 40 04             	mov    0x4(%eax),%eax
 84a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 851:	8b 45 fc             	mov    -0x4(%ebp),%eax
 854:	01 d0                	add    %edx,%eax
 856:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 859:	75 20                	jne    87b <free+0xcf>
    p->s.size += bp->s.size;
 85b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85e:	8b 50 04             	mov    0x4(%eax),%edx
 861:	8b 45 f8             	mov    -0x8(%ebp),%eax
 864:	8b 40 04             	mov    0x4(%eax),%eax
 867:	01 c2                	add    %eax,%edx
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 872:	8b 10                	mov    (%eax),%edx
 874:	8b 45 fc             	mov    -0x4(%ebp),%eax
 877:	89 10                	mov    %edx,(%eax)
 879:	eb 08                	jmp    883 <free+0xd7>
  } else
    p->s.ptr = bp;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 881:	89 10                	mov    %edx,(%eax)
  freep = p;
 883:	8b 45 fc             	mov    -0x4(%ebp),%eax
 886:	a3 80 0c 00 00       	mov    %eax,0xc80
}
 88b:	90                   	nop
 88c:	c9                   	leave  
 88d:	c3                   	ret    

0000088e <morecore>:

static Header*
morecore(uint nu)
{
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 894:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 89b:	77 07                	ja     8a4 <morecore+0x16>
    nu = 4096;
 89d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	c1 e0 03             	shl    $0x3,%eax
 8aa:	83 ec 0c             	sub    $0xc,%esp
 8ad:	50                   	push   %eax
 8ae:	e8 51 fc ff ff       	call   504 <sbrk>
 8b3:	83 c4 10             	add    $0x10,%esp
 8b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8b9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8bd:	75 07                	jne    8c6 <morecore+0x38>
    return 0;
 8bf:	b8 00 00 00 00       	mov    $0x0,%eax
 8c4:	eb 26                	jmp    8ec <morecore+0x5e>
  hp = (Header*)p;
 8c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cf:	8b 55 08             	mov    0x8(%ebp),%edx
 8d2:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d8:	83 c0 08             	add    $0x8,%eax
 8db:	83 ec 0c             	sub    $0xc,%esp
 8de:	50                   	push   %eax
 8df:	e8 c8 fe ff ff       	call   7ac <free>
 8e4:	83 c4 10             	add    $0x10,%esp
  return freep;
 8e7:	a1 80 0c 00 00       	mov    0xc80,%eax
}
 8ec:	c9                   	leave  
 8ed:	c3                   	ret    

000008ee <malloc>:

void*
malloc(uint nbytes)
{
 8ee:	55                   	push   %ebp
 8ef:	89 e5                	mov    %esp,%ebp
 8f1:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8f4:	8b 45 08             	mov    0x8(%ebp),%eax
 8f7:	83 c0 07             	add    $0x7,%eax
 8fa:	c1 e8 03             	shr    $0x3,%eax
 8fd:	83 c0 01             	add    $0x1,%eax
 900:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 903:	a1 80 0c 00 00       	mov    0xc80,%eax
 908:	89 45 f0             	mov    %eax,-0x10(%ebp)
 90b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 90f:	75 23                	jne    934 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 911:	c7 45 f0 78 0c 00 00 	movl   $0xc78,-0x10(%ebp)
 918:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91b:	a3 80 0c 00 00       	mov    %eax,0xc80
 920:	a1 80 0c 00 00       	mov    0xc80,%eax
 925:	a3 78 0c 00 00       	mov    %eax,0xc78
    base.s.size = 0;
 92a:	c7 05 7c 0c 00 00 00 	movl   $0x0,0xc7c
 931:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 934:	8b 45 f0             	mov    -0x10(%ebp),%eax
 937:	8b 00                	mov    (%eax),%eax
 939:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	8b 40 04             	mov    0x4(%eax),%eax
 942:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 945:	72 4d                	jb     994 <malloc+0xa6>
      if(p->s.size == nunits)
 947:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94a:	8b 40 04             	mov    0x4(%eax),%eax
 94d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 950:	75 0c                	jne    95e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 952:	8b 45 f4             	mov    -0xc(%ebp),%eax
 955:	8b 10                	mov    (%eax),%edx
 957:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95a:	89 10                	mov    %edx,(%eax)
 95c:	eb 26                	jmp    984 <malloc+0x96>
      else {
        p->s.size -= nunits;
 95e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 961:	8b 40 04             	mov    0x4(%eax),%eax
 964:	2b 45 ec             	sub    -0x14(%ebp),%eax
 967:	89 c2                	mov    %eax,%edx
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 96f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 972:	8b 40 04             	mov    0x4(%eax),%eax
 975:	c1 e0 03             	shl    $0x3,%eax
 978:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 97b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 981:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 984:	8b 45 f0             	mov    -0x10(%ebp),%eax
 987:	a3 80 0c 00 00       	mov    %eax,0xc80
      return (void*)(p + 1);
 98c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98f:	83 c0 08             	add    $0x8,%eax
 992:	eb 3b                	jmp    9cf <malloc+0xe1>
    }
    if(p == freep)
 994:	a1 80 0c 00 00       	mov    0xc80,%eax
 999:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 99c:	75 1e                	jne    9bc <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 99e:	83 ec 0c             	sub    $0xc,%esp
 9a1:	ff 75 ec             	pushl  -0x14(%ebp)
 9a4:	e8 e5 fe ff ff       	call   88e <morecore>
 9a9:	83 c4 10             	add    $0x10,%esp
 9ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
 9af:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9b3:	75 07                	jne    9bc <malloc+0xce>
        return 0;
 9b5:	b8 00 00 00 00       	mov    $0x0,%eax
 9ba:	eb 13                	jmp    9cf <malloc+0xe1>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c5:	8b 00                	mov    (%eax),%eax
 9c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9ca:	e9 6d ff ff ff       	jmp    93c <malloc+0x4e>
}
 9cf:	c9                   	leave  
 9d0:	c3                   	ret    
