
_proj0:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	push   -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
   f:	83 ec 10             	sub    $0x10,%esp
  12:	89 cb                	mov    %ecx,%ebx
    int i = 0;
  14:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    printf(1, "CS350 proj0 print in user space: ");
  1b:	83 ec 08             	sub    $0x8,%esp
  1e:	68 0c 08 00 00       	push   $0x80c
  23:	6a 01                	push   $0x1
  25:	e8 2a 04 00 00       	call   454 <printf>
  2a:	83 c4 10             	add    $0x10,%esp
    
    for (i = 1; i < argc; i++)
  2d:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  34:	eb 35                	jmp    6b <main+0x6b>
    {
        printf(1, argv[i]);
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  40:	8b 43 04             	mov    0x4(%ebx),%eax
  43:	01 d0                	add    %edx,%eax
  45:	8b 00                	mov    (%eax),%eax
  47:	83 ec 08             	sub    $0x8,%esp
  4a:	50                   	push   %eax
  4b:	6a 01                	push   $0x1
  4d:	e8 02 04 00 00       	call   454 <printf>
  52:	83 c4 10             	add    $0x10,%esp
        printf(1, " ");
  55:	83 ec 08             	sub    $0x8,%esp
  58:	68 2e 08 00 00       	push   $0x82e
  5d:	6a 01                	push   $0x1
  5f:	e8 f0 03 00 00       	call   454 <printf>
  64:	83 c4 10             	add    $0x10,%esp
    for (i = 1; i < argc; i++)
  67:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6e:	3b 03                	cmp    (%ebx),%eax
  70:	7c c4                	jl     36 <main+0x36>
    }

    printf(1, "\n");
  72:	83 ec 08             	sub    $0x8,%esp
  75:	68 30 08 00 00       	push   $0x830
  7a:	6a 01                	push   $0x1
  7c:	e8 d3 03 00 00       	call   454 <printf>
  81:	83 c4 10             	add    $0x10,%esp
    
    exit();
  84:	e8 57 02 00 00       	call   2e0 <exit>

00000089 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  89:	55                   	push   %ebp
  8a:	89 e5                	mov    %esp,%ebp
  8c:	57                   	push   %edi
  8d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  8e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  91:	8b 55 10             	mov    0x10(%ebp),%edx
  94:	8b 45 0c             	mov    0xc(%ebp),%eax
  97:	89 cb                	mov    %ecx,%ebx
  99:	89 df                	mov    %ebx,%edi
  9b:	89 d1                	mov    %edx,%ecx
  9d:	fc                   	cld
  9e:	f3 aa                	rep stos %al,%es:(%edi)
  a0:	89 ca                	mov    %ecx,%edx
  a2:	89 fb                	mov    %edi,%ebx
  a4:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  aa:	90                   	nop
  ab:	5b                   	pop    %ebx
  ac:	5f                   	pop    %edi
  ad:	5d                   	pop    %ebp
  ae:	c3                   	ret

000000af <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  af:	55                   	push   %ebp
  b0:	89 e5                	mov    %esp,%ebp
  b2:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  b5:	8b 45 08             	mov    0x8(%ebp),%eax
  b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  bb:	90                   	nop
  bc:	8b 55 0c             	mov    0xc(%ebp),%edx
  bf:	8d 42 01             	lea    0x1(%edx),%eax
  c2:	89 45 0c             	mov    %eax,0xc(%ebp)
  c5:	8b 45 08             	mov    0x8(%ebp),%eax
  c8:	8d 48 01             	lea    0x1(%eax),%ecx
  cb:	89 4d 08             	mov    %ecx,0x8(%ebp)
  ce:	0f b6 12             	movzbl (%edx),%edx
  d1:	88 10                	mov    %dl,(%eax)
  d3:	0f b6 00             	movzbl (%eax),%eax
  d6:	84 c0                	test   %al,%al
  d8:	75 e2                	jne    bc <strcpy+0xd>
    ;
  return os;
  da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dd:	c9                   	leave
  de:	c3                   	ret

000000df <strcmp>:

int
strcmp(const char *p, const char *q)
{
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e2:	eb 08                	jmp    ec <strcmp+0xd>
    p++, q++;
  e4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	84 c0                	test   %al,%al
  f4:	74 10                	je     106 <strcmp+0x27>
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	0f b6 10             	movzbl (%eax),%edx
  fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  ff:	0f b6 00             	movzbl (%eax),%eax
 102:	38 c2                	cmp    %al,%dl
 104:	74 de                	je     e4 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 106:	8b 45 08             	mov    0x8(%ebp),%eax
 109:	0f b6 00             	movzbl (%eax),%eax
 10c:	0f b6 d0             	movzbl %al,%edx
 10f:	8b 45 0c             	mov    0xc(%ebp),%eax
 112:	0f b6 00             	movzbl (%eax),%eax
 115:	0f b6 c0             	movzbl %al,%eax
 118:	29 c2                	sub    %eax,%edx
 11a:	89 d0                	mov    %edx,%eax
}
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret

0000011e <strlen>:

uint
strlen(char *s)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 124:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 12b:	eb 04                	jmp    131 <strlen+0x13>
 12d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 131:	8b 55 fc             	mov    -0x4(%ebp),%edx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	01 d0                	add    %edx,%eax
 139:	0f b6 00             	movzbl (%eax),%eax
 13c:	84 c0                	test   %al,%al
 13e:	75 ed                	jne    12d <strlen+0xf>
    ;
  return n;
 140:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 143:	c9                   	leave
 144:	c3                   	ret

00000145 <memset>:

void*
memset(void *dst, int c, uint n)
{
 145:	55                   	push   %ebp
 146:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 148:	8b 45 10             	mov    0x10(%ebp),%eax
 14b:	50                   	push   %eax
 14c:	ff 75 0c             	push   0xc(%ebp)
 14f:	ff 75 08             	push   0x8(%ebp)
 152:	e8 32 ff ff ff       	call   89 <stosb>
 157:	83 c4 0c             	add    $0xc,%esp
  return dst;
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 15d:	c9                   	leave
 15e:	c3                   	ret

0000015f <strchr>:

char*
strchr(const char *s, char c)
{
 15f:	55                   	push   %ebp
 160:	89 e5                	mov    %esp,%ebp
 162:	83 ec 04             	sub    $0x4,%esp
 165:	8b 45 0c             	mov    0xc(%ebp),%eax
 168:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 16b:	eb 14                	jmp    181 <strchr+0x22>
    if(*s == c)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	38 45 fc             	cmp    %al,-0x4(%ebp)
 176:	75 05                	jne    17d <strchr+0x1e>
      return (char*)s;
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	eb 13                	jmp    190 <strchr+0x31>
  for(; *s; s++)
 17d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 181:	8b 45 08             	mov    0x8(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	84 c0                	test   %al,%al
 189:	75 e2                	jne    16d <strchr+0xe>
  return 0;
 18b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 190:	c9                   	leave
 191:	c3                   	ret

00000192 <gets>:

char*
gets(char *buf, int max)
{
 192:	55                   	push   %ebp
 193:	89 e5                	mov    %esp,%ebp
 195:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 198:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 19f:	eb 42                	jmp    1e3 <gets+0x51>
    cc = read(0, &c, 1);
 1a1:	83 ec 04             	sub    $0x4,%esp
 1a4:	6a 01                	push   $0x1
 1a6:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a9:	50                   	push   %eax
 1aa:	6a 00                	push   $0x0
 1ac:	e8 47 01 00 00       	call   2f8 <read>
 1b1:	83 c4 10             	add    $0x10,%esp
 1b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bb:	7e 33                	jle    1f0 <gets+0x5e>
      break;
    buf[i++] = c;
 1bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c0:	8d 50 01             	lea    0x1(%eax),%edx
 1c3:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c6:	89 c2                	mov    %eax,%edx
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	01 c2                	add    %eax,%edx
 1cd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d1:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d7:	3c 0a                	cmp    $0xa,%al
 1d9:	74 16                	je     1f1 <gets+0x5f>
 1db:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1df:	3c 0d                	cmp    $0xd,%al
 1e1:	74 0e                	je     1f1 <gets+0x5f>
  for(i=0; i+1 < max; ){
 1e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e6:	83 c0 01             	add    $0x1,%eax
 1e9:	39 45 0c             	cmp    %eax,0xc(%ebp)
 1ec:	7f b3                	jg     1a1 <gets+0xf>
 1ee:	eb 01                	jmp    1f1 <gets+0x5f>
      break;
 1f0:	90                   	nop
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave
 200:	c3                   	ret

00000201 <stat>:

int
stat(char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	83 ec 08             	sub    $0x8,%esp
 20a:	6a 00                	push   $0x0
 20c:	ff 75 08             	push   0x8(%ebp)
 20f:	e8 0c 01 00 00       	call   320 <open>
 214:	83 c4 10             	add    $0x10,%esp
 217:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 21e:	79 07                	jns    227 <stat+0x26>
    return -1;
 220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 225:	eb 25                	jmp    24c <stat+0x4b>
  r = fstat(fd, st);
 227:	83 ec 08             	sub    $0x8,%esp
 22a:	ff 75 0c             	push   0xc(%ebp)
 22d:	ff 75 f4             	push   -0xc(%ebp)
 230:	e8 03 01 00 00       	call   338 <fstat>
 235:	83 c4 10             	add    $0x10,%esp
 238:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23b:	83 ec 0c             	sub    $0xc,%esp
 23e:	ff 75 f4             	push   -0xc(%ebp)
 241:	e8 c2 00 00 00       	call   308 <close>
 246:	83 c4 10             	add    $0x10,%esp
  return r;
 249:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24c:	c9                   	leave
 24d:	c3                   	ret

0000024e <atoi>:

int
atoi(const char *s)
{
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 254:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25b:	eb 25                	jmp    282 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 260:	89 d0                	mov    %edx,%eax
 262:	c1 e0 02             	shl    $0x2,%eax
 265:	01 d0                	add    %edx,%eax
 267:	01 c0                	add    %eax,%eax
 269:	89 c1                	mov    %eax,%ecx
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	8d 50 01             	lea    0x1(%eax),%edx
 271:	89 55 08             	mov    %edx,0x8(%ebp)
 274:	0f b6 00             	movzbl (%eax),%eax
 277:	0f be c0             	movsbl %al,%eax
 27a:	01 c8                	add    %ecx,%eax
 27c:	83 e8 30             	sub    $0x30,%eax
 27f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	0f b6 00             	movzbl (%eax),%eax
 288:	3c 2f                	cmp    $0x2f,%al
 28a:	7e 0a                	jle    296 <atoi+0x48>
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	0f b6 00             	movzbl (%eax),%eax
 292:	3c 39                	cmp    $0x39,%al
 294:	7e c7                	jle    25d <atoi+0xf>
  return n;
 296:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 299:	c9                   	leave
 29a:	c3                   	ret

0000029b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 29b:	55                   	push   %ebp
 29c:	89 e5                	mov    %esp,%ebp
 29e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
 2a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2aa:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ad:	eb 17                	jmp    2c6 <memmove+0x2b>
    *dst++ = *src++;
 2af:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2b2:	8d 42 01             	lea    0x1(%edx),%eax
 2b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
 2b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2bb:	8d 48 01             	lea    0x1(%eax),%ecx
 2be:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 2c1:	0f b6 12             	movzbl (%edx),%edx
 2c4:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 2c6:	8b 45 10             	mov    0x10(%ebp),%eax
 2c9:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cc:	89 55 10             	mov    %edx,0x10(%ebp)
 2cf:	85 c0                	test   %eax,%eax
 2d1:	7f dc                	jg     2af <memmove+0x14>
  return vdst;
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d6:	c9                   	leave
 2d7:	c3                   	ret

000002d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d8:	b8 01 00 00 00       	mov    $0x1,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret

000002e0 <exit>:
SYSCALL(exit)
 2e0:	b8 02 00 00 00       	mov    $0x2,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret

000002e8 <wait>:
SYSCALL(wait)
 2e8:	b8 03 00 00 00       	mov    $0x3,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret

000002f0 <pipe>:
SYSCALL(pipe)
 2f0:	b8 04 00 00 00       	mov    $0x4,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret

000002f8 <read>:
SYSCALL(read)
 2f8:	b8 05 00 00 00       	mov    $0x5,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret

00000300 <write>:
SYSCALL(write)
 300:	b8 10 00 00 00       	mov    $0x10,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret

00000308 <close>:
SYSCALL(close)
 308:	b8 15 00 00 00       	mov    $0x15,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret

00000310 <kill>:
SYSCALL(kill)
 310:	b8 06 00 00 00       	mov    $0x6,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret

00000318 <exec>:
SYSCALL(exec)
 318:	b8 07 00 00 00       	mov    $0x7,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret

00000320 <open>:
SYSCALL(open)
 320:	b8 0f 00 00 00       	mov    $0xf,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret

00000328 <mknod>:
SYSCALL(mknod)
 328:	b8 11 00 00 00       	mov    $0x11,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret

00000330 <unlink>:
SYSCALL(unlink)
 330:	b8 12 00 00 00       	mov    $0x12,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret

00000338 <fstat>:
SYSCALL(fstat)
 338:	b8 08 00 00 00       	mov    $0x8,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret

00000340 <link>:
SYSCALL(link)
 340:	b8 13 00 00 00       	mov    $0x13,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret

00000348 <mkdir>:
SYSCALL(mkdir)
 348:	b8 14 00 00 00       	mov    $0x14,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret

00000350 <chdir>:
SYSCALL(chdir)
 350:	b8 09 00 00 00       	mov    $0x9,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret

00000358 <dup>:
SYSCALL(dup)
 358:	b8 0a 00 00 00       	mov    $0xa,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret

00000360 <getpid>:
SYSCALL(getpid)
 360:	b8 0b 00 00 00       	mov    $0xb,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret

00000368 <sbrk>:
SYSCALL(sbrk)
 368:	b8 0c 00 00 00       	mov    $0xc,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret

00000370 <sleep>:
SYSCALL(sleep)
 370:	b8 0d 00 00 00       	mov    $0xd,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret

00000378 <uptime>:
SYSCALL(uptime)
 378:	b8 0e 00 00 00       	mov    $0xe,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret

00000380 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 18             	sub    $0x18,%esp
 386:	8b 45 0c             	mov    0xc(%ebp),%eax
 389:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 38c:	83 ec 04             	sub    $0x4,%esp
 38f:	6a 01                	push   $0x1
 391:	8d 45 f4             	lea    -0xc(%ebp),%eax
 394:	50                   	push   %eax
 395:	ff 75 08             	push   0x8(%ebp)
 398:	e8 63 ff ff ff       	call   300 <write>
 39d:	83 c4 10             	add    $0x10,%esp
}
 3a0:	90                   	nop
 3a1:	c9                   	leave
 3a2:	c3                   	ret

000003a3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a3:	55                   	push   %ebp
 3a4:	89 e5                	mov    %esp,%ebp
 3a6:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3b0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3b4:	74 17                	je     3cd <printint+0x2a>
 3b6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3ba:	79 11                	jns    3cd <printint+0x2a>
    neg = 1;
 3bc:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c6:	f7 d8                	neg    %eax
 3c8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3cb:	eb 06                	jmp    3d3 <printint+0x30>
  } else {
    x = xx;
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3d3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3da:	8b 4d 10             	mov    0x10(%ebp),%ecx
 3dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e0:	ba 00 00 00 00       	mov    $0x0,%edx
 3e5:	f7 f1                	div    %ecx
 3e7:	89 d1                	mov    %edx,%ecx
 3e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ec:	8d 50 01             	lea    0x1(%eax),%edx
 3ef:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3f2:	0f b6 91 84 0a 00 00 	movzbl 0xa84(%ecx),%edx
 3f9:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 3fd:	8b 4d 10             	mov    0x10(%ebp),%ecx
 400:	8b 45 ec             	mov    -0x14(%ebp),%eax
 403:	ba 00 00 00 00       	mov    $0x0,%edx
 408:	f7 f1                	div    %ecx
 40a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 40d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 411:	75 c7                	jne    3da <printint+0x37>
  if(neg)
 413:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 417:	74 2d                	je     446 <printint+0xa3>
    buf[i++] = '-';
 419:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41c:	8d 50 01             	lea    0x1(%eax),%edx
 41f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 422:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 427:	eb 1d                	jmp    446 <printint+0xa3>
    putc(fd, buf[i]);
 429:	8d 55 dc             	lea    -0x24(%ebp),%edx
 42c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42f:	01 d0                	add    %edx,%eax
 431:	0f b6 00             	movzbl (%eax),%eax
 434:	0f be c0             	movsbl %al,%eax
 437:	83 ec 08             	sub    $0x8,%esp
 43a:	50                   	push   %eax
 43b:	ff 75 08             	push   0x8(%ebp)
 43e:	e8 3d ff ff ff       	call   380 <putc>
 443:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 446:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 44a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 44e:	79 d9                	jns    429 <printint+0x86>
}
 450:	90                   	nop
 451:	90                   	nop
 452:	c9                   	leave
 453:	c3                   	ret

00000454 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 45a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 461:	8d 45 0c             	lea    0xc(%ebp),%eax
 464:	83 c0 04             	add    $0x4,%eax
 467:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 46a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 471:	e9 59 01 00 00       	jmp    5cf <printf+0x17b>
    c = fmt[i] & 0xff;
 476:	8b 55 0c             	mov    0xc(%ebp),%edx
 479:	8b 45 f0             	mov    -0x10(%ebp),%eax
 47c:	01 d0                	add    %edx,%eax
 47e:	0f b6 00             	movzbl (%eax),%eax
 481:	0f be c0             	movsbl %al,%eax
 484:	25 ff 00 00 00       	and    $0xff,%eax
 489:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 48c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 490:	75 2c                	jne    4be <printf+0x6a>
      if(c == '%'){
 492:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 496:	75 0c                	jne    4a4 <printf+0x50>
        state = '%';
 498:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 49f:	e9 27 01 00 00       	jmp    5cb <printf+0x177>
      } else {
        putc(fd, c);
 4a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a7:	0f be c0             	movsbl %al,%eax
 4aa:	83 ec 08             	sub    $0x8,%esp
 4ad:	50                   	push   %eax
 4ae:	ff 75 08             	push   0x8(%ebp)
 4b1:	e8 ca fe ff ff       	call   380 <putc>
 4b6:	83 c4 10             	add    $0x10,%esp
 4b9:	e9 0d 01 00 00       	jmp    5cb <printf+0x177>
      }
    } else if(state == '%'){
 4be:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4c2:	0f 85 03 01 00 00    	jne    5cb <printf+0x177>
      if(c == 'd'){
 4c8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4cc:	75 1e                	jne    4ec <printf+0x98>
        printint(fd, *ap, 10, 1);
 4ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d1:	8b 00                	mov    (%eax),%eax
 4d3:	6a 01                	push   $0x1
 4d5:	6a 0a                	push   $0xa
 4d7:	50                   	push   %eax
 4d8:	ff 75 08             	push   0x8(%ebp)
 4db:	e8 c3 fe ff ff       	call   3a3 <printint>
 4e0:	83 c4 10             	add    $0x10,%esp
        ap++;
 4e3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e7:	e9 d8 00 00 00       	jmp    5c4 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 4ec:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4f0:	74 06                	je     4f8 <printf+0xa4>
 4f2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4f6:	75 1e                	jne    516 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 4f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4fb:	8b 00                	mov    (%eax),%eax
 4fd:	6a 00                	push   $0x0
 4ff:	6a 10                	push   $0x10
 501:	50                   	push   %eax
 502:	ff 75 08             	push   0x8(%ebp)
 505:	e8 99 fe ff ff       	call   3a3 <printint>
 50a:	83 c4 10             	add    $0x10,%esp
        ap++;
 50d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 511:	e9 ae 00 00 00       	jmp    5c4 <printf+0x170>
      } else if(c == 's'){
 516:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 51a:	75 43                	jne    55f <printf+0x10b>
        s = (char*)*ap;
 51c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51f:	8b 00                	mov    (%eax),%eax
 521:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 524:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 528:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 52c:	75 25                	jne    553 <printf+0xff>
          s = "(null)";
 52e:	c7 45 f4 32 08 00 00 	movl   $0x832,-0xc(%ebp)
        while(*s != 0){
 535:	eb 1c                	jmp    553 <printf+0xff>
          putc(fd, *s);
 537:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53a:	0f b6 00             	movzbl (%eax),%eax
 53d:	0f be c0             	movsbl %al,%eax
 540:	83 ec 08             	sub    $0x8,%esp
 543:	50                   	push   %eax
 544:	ff 75 08             	push   0x8(%ebp)
 547:	e8 34 fe ff ff       	call   380 <putc>
 54c:	83 c4 10             	add    $0x10,%esp
          s++;
 54f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 553:	8b 45 f4             	mov    -0xc(%ebp),%eax
 556:	0f b6 00             	movzbl (%eax),%eax
 559:	84 c0                	test   %al,%al
 55b:	75 da                	jne    537 <printf+0xe3>
 55d:	eb 65                	jmp    5c4 <printf+0x170>
        }
      } else if(c == 'c'){
 55f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 563:	75 1d                	jne    582 <printf+0x12e>
        putc(fd, *ap);
 565:	8b 45 e8             	mov    -0x18(%ebp),%eax
 568:	8b 00                	mov    (%eax),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	83 ec 08             	sub    $0x8,%esp
 570:	50                   	push   %eax
 571:	ff 75 08             	push   0x8(%ebp)
 574:	e8 07 fe ff ff       	call   380 <putc>
 579:	83 c4 10             	add    $0x10,%esp
        ap++;
 57c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 580:	eb 42                	jmp    5c4 <printf+0x170>
      } else if(c == '%'){
 582:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 586:	75 17                	jne    59f <printf+0x14b>
        putc(fd, c);
 588:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58b:	0f be c0             	movsbl %al,%eax
 58e:	83 ec 08             	sub    $0x8,%esp
 591:	50                   	push   %eax
 592:	ff 75 08             	push   0x8(%ebp)
 595:	e8 e6 fd ff ff       	call   380 <putc>
 59a:	83 c4 10             	add    $0x10,%esp
 59d:	eb 25                	jmp    5c4 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59f:	83 ec 08             	sub    $0x8,%esp
 5a2:	6a 25                	push   $0x25
 5a4:	ff 75 08             	push   0x8(%ebp)
 5a7:	e8 d4 fd ff ff       	call   380 <putc>
 5ac:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 5af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b2:	0f be c0             	movsbl %al,%eax
 5b5:	83 ec 08             	sub    $0x8,%esp
 5b8:	50                   	push   %eax
 5b9:	ff 75 08             	push   0x8(%ebp)
 5bc:	e8 bf fd ff ff       	call   380 <putc>
 5c1:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 5c4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 5cb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5cf:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d5:	01 d0                	add    %edx,%eax
 5d7:	0f b6 00             	movzbl (%eax),%eax
 5da:	84 c0                	test   %al,%al
 5dc:	0f 85 94 fe ff ff    	jne    476 <printf+0x22>
    }
  }
}
 5e2:	90                   	nop
 5e3:	90                   	nop
 5e4:	c9                   	leave
 5e5:	c3                   	ret

000005e6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e6:	55                   	push   %ebp
 5e7:	89 e5                	mov    %esp,%ebp
 5e9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ec:	8b 45 08             	mov    0x8(%ebp),%eax
 5ef:	83 e8 08             	sub    $0x8,%eax
 5f2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f5:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 5fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fd:	eb 24                	jmp    623 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 602:	8b 00                	mov    (%eax),%eax
 604:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 607:	72 12                	jb     61b <free+0x35>
 609:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60c:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 60f:	72 24                	jb     635 <free+0x4f>
 611:	8b 45 fc             	mov    -0x4(%ebp),%eax
 614:	8b 00                	mov    (%eax),%eax
 616:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 619:	72 1a                	jb     635 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	89 45 fc             	mov    %eax,-0x4(%ebp)
 623:	8b 45 f8             	mov    -0x8(%ebp),%eax
 626:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 629:	73 d4                	jae    5ff <free+0x19>
 62b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62e:	8b 00                	mov    (%eax),%eax
 630:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 633:	73 ca                	jae    5ff <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 635:	8b 45 f8             	mov    -0x8(%ebp),%eax
 638:	8b 40 04             	mov    0x4(%eax),%eax
 63b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 642:	8b 45 f8             	mov    -0x8(%ebp),%eax
 645:	01 c2                	add    %eax,%edx
 647:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64a:	8b 00                	mov    (%eax),%eax
 64c:	39 c2                	cmp    %eax,%edx
 64e:	75 24                	jne    674 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 650:	8b 45 f8             	mov    -0x8(%ebp),%eax
 653:	8b 50 04             	mov    0x4(%eax),%edx
 656:	8b 45 fc             	mov    -0x4(%ebp),%eax
 659:	8b 00                	mov    (%eax),%eax
 65b:	8b 40 04             	mov    0x4(%eax),%eax
 65e:	01 c2                	add    %eax,%edx
 660:	8b 45 f8             	mov    -0x8(%ebp),%eax
 663:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 666:	8b 45 fc             	mov    -0x4(%ebp),%eax
 669:	8b 00                	mov    (%eax),%eax
 66b:	8b 10                	mov    (%eax),%edx
 66d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 670:	89 10                	mov    %edx,(%eax)
 672:	eb 0a                	jmp    67e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	8b 10                	mov    (%eax),%edx
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 67e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 681:	8b 40 04             	mov    0x4(%eax),%eax
 684:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	01 d0                	add    %edx,%eax
 690:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 693:	75 20                	jne    6b5 <free+0xcf>
    p->s.size += bp->s.size;
 695:	8b 45 fc             	mov    -0x4(%ebp),%eax
 698:	8b 50 04             	mov    0x4(%eax),%edx
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	8b 40 04             	mov    0x4(%eax),%eax
 6a1:	01 c2                	add    %eax,%edx
 6a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ac:	8b 10                	mov    (%eax),%edx
 6ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b1:	89 10                	mov    %edx,(%eax)
 6b3:	eb 08                	jmp    6bd <free+0xd7>
  } else
    p->s.ptr = bp;
 6b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6bb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	a3 a0 0a 00 00       	mov    %eax,0xaa0
}
 6c5:	90                   	nop
 6c6:	c9                   	leave
 6c7:	c3                   	ret

000006c8 <morecore>:

static Header*
morecore(uint nu)
{
 6c8:	55                   	push   %ebp
 6c9:	89 e5                	mov    %esp,%ebp
 6cb:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6ce:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d5:	77 07                	ja     6de <morecore+0x16>
    nu = 4096;
 6d7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	c1 e0 03             	shl    $0x3,%eax
 6e4:	83 ec 0c             	sub    $0xc,%esp
 6e7:	50                   	push   %eax
 6e8:	e8 7b fc ff ff       	call   368 <sbrk>
 6ed:	83 c4 10             	add    $0x10,%esp
 6f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6f3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f7:	75 07                	jne    700 <morecore+0x38>
    return 0;
 6f9:	b8 00 00 00 00       	mov    $0x0,%eax
 6fe:	eb 26                	jmp    726 <morecore+0x5e>
  hp = (Header*)p;
 700:	8b 45 f4             	mov    -0xc(%ebp),%eax
 703:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 706:	8b 45 f0             	mov    -0x10(%ebp),%eax
 709:	8b 55 08             	mov    0x8(%ebp),%edx
 70c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 70f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 712:	83 c0 08             	add    $0x8,%eax
 715:	83 ec 0c             	sub    $0xc,%esp
 718:	50                   	push   %eax
 719:	e8 c8 fe ff ff       	call   5e6 <free>
 71e:	83 c4 10             	add    $0x10,%esp
  return freep;
 721:	a1 a0 0a 00 00       	mov    0xaa0,%eax
}
 726:	c9                   	leave
 727:	c3                   	ret

00000728 <malloc>:

void*
malloc(uint nbytes)
{
 728:	55                   	push   %ebp
 729:	89 e5                	mov    %esp,%ebp
 72b:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	83 c0 07             	add    $0x7,%eax
 734:	c1 e8 03             	shr    $0x3,%eax
 737:	83 c0 01             	add    $0x1,%eax
 73a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 73d:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 742:	89 45 f0             	mov    %eax,-0x10(%ebp)
 745:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 749:	75 23                	jne    76e <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 74b:	c7 45 f0 98 0a 00 00 	movl   $0xa98,-0x10(%ebp)
 752:	8b 45 f0             	mov    -0x10(%ebp),%eax
 755:	a3 a0 0a 00 00       	mov    %eax,0xaa0
 75a:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 75f:	a3 98 0a 00 00       	mov    %eax,0xa98
    base.s.size = 0;
 764:	c7 05 9c 0a 00 00 00 	movl   $0x0,0xa9c
 76b:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 76e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 771:	8b 00                	mov    (%eax),%eax
 773:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 776:	8b 45 f4             	mov    -0xc(%ebp),%eax
 779:	8b 40 04             	mov    0x4(%eax),%eax
 77c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 77f:	72 4d                	jb     7ce <malloc+0xa6>
      if(p->s.size == nunits)
 781:	8b 45 f4             	mov    -0xc(%ebp),%eax
 784:	8b 40 04             	mov    0x4(%eax),%eax
 787:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 78a:	75 0c                	jne    798 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 78c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78f:	8b 10                	mov    (%eax),%edx
 791:	8b 45 f0             	mov    -0x10(%ebp),%eax
 794:	89 10                	mov    %edx,(%eax)
 796:	eb 26                	jmp    7be <malloc+0x96>
      else {
        p->s.size -= nunits;
 798:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79b:	8b 40 04             	mov    0x4(%eax),%eax
 79e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7a1:	89 c2                	mov    %eax,%edx
 7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ac:	8b 40 04             	mov    0x4(%eax),%eax
 7af:	c1 e0 03             	shl    $0x3,%eax
 7b2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7bb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7be:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c1:	a3 a0 0a 00 00       	mov    %eax,0xaa0
      return (void*)(p + 1);
 7c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c9:	83 c0 08             	add    $0x8,%eax
 7cc:	eb 3b                	jmp    809 <malloc+0xe1>
    }
    if(p == freep)
 7ce:	a1 a0 0a 00 00       	mov    0xaa0,%eax
 7d3:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7d6:	75 1e                	jne    7f6 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 7d8:	83 ec 0c             	sub    $0xc,%esp
 7db:	ff 75 ec             	push   -0x14(%ebp)
 7de:	e8 e5 fe ff ff       	call   6c8 <morecore>
 7e3:	83 c4 10             	add    $0x10,%esp
 7e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7ed:	75 07                	jne    7f6 <malloc+0xce>
        return 0;
 7ef:	b8 00 00 00 00       	mov    $0x0,%eax
 7f4:	eb 13                	jmp    809 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ff:	8b 00                	mov    (%eax),%eax
 801:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 804:	e9 6d ff ff ff       	jmp    776 <malloc+0x4e>
  }
}
 809:	c9                   	leave
 80a:	c3                   	ret
