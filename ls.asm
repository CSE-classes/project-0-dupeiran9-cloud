
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 14             	sub    $0x14,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	83 ec 0c             	sub    $0xc,%esp
   a:	ff 75 08             	push   0x8(%ebp)
   d:	e8 c7 03 00 00       	call   3d9 <strlen>
  12:	83 c4 10             	add    $0x10,%esp
  15:	8b 55 08             	mov    0x8(%ebp),%edx
  18:	01 d0                	add    %edx,%eax
  1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1d:	eb 04                	jmp    23 <fmtname+0x23>
  1f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  23:	8b 45 f4             	mov    -0xc(%ebp),%eax
  26:	3b 45 08             	cmp    0x8(%ebp),%eax
  29:	72 0a                	jb     35 <fmtname+0x35>
  2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2e:	0f b6 00             	movzbl (%eax),%eax
  31:	3c 2f                	cmp    $0x2f,%al
  33:	75 ea                	jne    1f <fmtname+0x1f>
    ;
  p++;
  35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  39:	83 ec 0c             	sub    $0xc,%esp
  3c:	ff 75 f4             	push   -0xc(%ebp)
  3f:	e8 95 03 00 00       	call   3d9 <strlen>
  44:	83 c4 10             	add    $0x10,%esp
  47:	83 f8 0d             	cmp    $0xd,%eax
  4a:	76 05                	jbe    51 <fmtname+0x51>
    return p;
  4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4f:	eb 60                	jmp    b1 <fmtname+0xb1>
  memmove(buf, p, strlen(p));
  51:	83 ec 0c             	sub    $0xc,%esp
  54:	ff 75 f4             	push   -0xc(%ebp)
  57:	e8 7d 03 00 00       	call   3d9 <strlen>
  5c:	83 c4 10             	add    $0x10,%esp
  5f:	83 ec 04             	sub    $0x4,%esp
  62:	50                   	push   %eax
  63:	ff 75 f4             	push   -0xc(%ebp)
  66:	68 c8 0d 00 00       	push   $0xdc8
  6b:	e8 e6 04 00 00       	call   556 <memmove>
  70:	83 c4 10             	add    $0x10,%esp
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  73:	83 ec 0c             	sub    $0xc,%esp
  76:	ff 75 f4             	push   -0xc(%ebp)
  79:	e8 5b 03 00 00       	call   3d9 <strlen>
  7e:	83 c4 10             	add    $0x10,%esp
  81:	ba 0e 00 00 00       	mov    $0xe,%edx
  86:	89 d3                	mov    %edx,%ebx
  88:	29 c3                	sub    %eax,%ebx
  8a:	83 ec 0c             	sub    $0xc,%esp
  8d:	ff 75 f4             	push   -0xc(%ebp)
  90:	e8 44 03 00 00       	call   3d9 <strlen>
  95:	83 c4 10             	add    $0x10,%esp
  98:	05 c8 0d 00 00       	add    $0xdc8,%eax
  9d:	83 ec 04             	sub    $0x4,%esp
  a0:	53                   	push   %ebx
  a1:	6a 20                	push   $0x20
  a3:	50                   	push   %eax
  a4:	e8 57 03 00 00       	call   400 <memset>
  a9:	83 c4 10             	add    $0x10,%esp
  return buf;
  ac:	b8 c8 0d 00 00       	mov    $0xdc8,%eax
}
  b1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  b4:	c9                   	leave
  b5:	c3                   	ret

000000b6 <ls>:

void
ls(char *path)
{
  b6:	55                   	push   %ebp
  b7:	89 e5                	mov    %esp,%ebp
  b9:	57                   	push   %edi
  ba:	56                   	push   %esi
  bb:	53                   	push   %ebx
  bc:	81 ec 3c 02 00 00    	sub    $0x23c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  c2:	83 ec 08             	sub    $0x8,%esp
  c5:	6a 00                	push   $0x0
  c7:	ff 75 08             	push   0x8(%ebp)
  ca:	e8 0c 05 00 00       	call   5db <open>
  cf:	83 c4 10             	add    $0x10,%esp
  d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d5:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d9:	79 1a                	jns    f5 <ls+0x3f>
    printf(2, "ls: cannot open %s\n", path);
  db:	83 ec 04             	sub    $0x4,%esp
  de:	ff 75 08             	push   0x8(%ebp)
  e1:	68 c6 0a 00 00       	push   $0xac6
  e6:	6a 02                	push   $0x2
  e8:	e8 22 06 00 00       	call   70f <printf>
  ed:	83 c4 10             	add    $0x10,%esp
    return;
  f0:	e9 e3 01 00 00       	jmp    2d8 <ls+0x222>
  }
  
  if(fstat(fd, &st) < 0){
  f5:	83 ec 08             	sub    $0x8,%esp
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	50                   	push   %eax
  ff:	ff 75 e4             	push   -0x1c(%ebp)
 102:	e8 ec 04 00 00       	call   5f3 <fstat>
 107:	83 c4 10             	add    $0x10,%esp
 10a:	85 c0                	test   %eax,%eax
 10c:	79 28                	jns    136 <ls+0x80>
    printf(2, "ls: cannot stat %s\n", path);
 10e:	83 ec 04             	sub    $0x4,%esp
 111:	ff 75 08             	push   0x8(%ebp)
 114:	68 da 0a 00 00       	push   $0xada
 119:	6a 02                	push   $0x2
 11b:	e8 ef 05 00 00       	call   70f <printf>
 120:	83 c4 10             	add    $0x10,%esp
    close(fd);
 123:	83 ec 0c             	sub    $0xc,%esp
 126:	ff 75 e4             	push   -0x1c(%ebp)
 129:	e8 95 04 00 00       	call   5c3 <close>
 12e:	83 c4 10             	add    $0x10,%esp
    return;
 131:	e9 a2 01 00 00       	jmp    2d8 <ls+0x222>
  }
  
  switch(st.type){
 136:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 13d:	98                   	cwtl
 13e:	83 f8 01             	cmp    $0x1,%eax
 141:	74 48                	je     18b <ls+0xd5>
 143:	83 f8 02             	cmp    $0x2,%eax
 146:	0f 85 7e 01 00 00    	jne    2ca <ls+0x214>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 14c:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 152:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 158:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 15f:	0f bf d8             	movswl %ax,%ebx
 162:	83 ec 0c             	sub    $0xc,%esp
 165:	ff 75 08             	push   0x8(%ebp)
 168:	e8 93 fe ff ff       	call   0 <fmtname>
 16d:	83 c4 10             	add    $0x10,%esp
 170:	83 ec 08             	sub    $0x8,%esp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
 176:	50                   	push   %eax
 177:	68 ee 0a 00 00       	push   $0xaee
 17c:	6a 01                	push   $0x1
 17e:	e8 8c 05 00 00       	call   70f <printf>
 183:	83 c4 20             	add    $0x20,%esp
    break;
 186:	e9 3f 01 00 00       	jmp    2ca <ls+0x214>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 18b:	83 ec 0c             	sub    $0xc,%esp
 18e:	ff 75 08             	push   0x8(%ebp)
 191:	e8 43 02 00 00       	call   3d9 <strlen>
 196:	83 c4 10             	add    $0x10,%esp
 199:	83 c0 10             	add    $0x10,%eax
 19c:	3d 00 02 00 00       	cmp    $0x200,%eax
 1a1:	76 17                	jbe    1ba <ls+0x104>
      printf(1, "ls: path too long\n");
 1a3:	83 ec 08             	sub    $0x8,%esp
 1a6:	68 fb 0a 00 00       	push   $0xafb
 1ab:	6a 01                	push   $0x1
 1ad:	e8 5d 05 00 00       	call   70f <printf>
 1b2:	83 c4 10             	add    $0x10,%esp
      break;
 1b5:	e9 10 01 00 00       	jmp    2ca <ls+0x214>
    }
    strcpy(buf, path);
 1ba:	83 ec 08             	sub    $0x8,%esp
 1bd:	ff 75 08             	push   0x8(%ebp)
 1c0:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1c6:	50                   	push   %eax
 1c7:	e8 9e 01 00 00       	call   36a <strcpy>
 1cc:	83 c4 10             	add    $0x10,%esp
    p = buf+strlen(buf);
 1cf:	83 ec 0c             	sub    $0xc,%esp
 1d2:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d8:	50                   	push   %eax
 1d9:	e8 fb 01 00 00       	call   3d9 <strlen>
 1de:	83 c4 10             	add    $0x10,%esp
 1e1:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1e7:	01 d0                	add    %edx,%eax
 1e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1ec:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1ef:	8d 50 01             	lea    0x1(%eax),%edx
 1f2:	89 55 e0             	mov    %edx,-0x20(%ebp)
 1f5:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 1f8:	e9 ac 00 00 00       	jmp    2a9 <ls+0x1f3>
      if(de.inum == 0)
 1fd:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 204:	66 85 c0             	test   %ax,%ax
 207:	0f 84 9b 00 00 00    	je     2a8 <ls+0x1f2>
        continue;
      memmove(p, de.name, DIRSIZ);
 20d:	83 ec 04             	sub    $0x4,%esp
 210:	6a 0e                	push   $0xe
 212:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 218:	83 c0 02             	add    $0x2,%eax
 21b:	50                   	push   %eax
 21c:	ff 75 e0             	push   -0x20(%ebp)
 21f:	e8 32 03 00 00       	call   556 <memmove>
 224:	83 c4 10             	add    $0x10,%esp
      p[DIRSIZ] = 0;
 227:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22a:	83 c0 0e             	add    $0xe,%eax
 22d:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 230:	83 ec 08             	sub    $0x8,%esp
 233:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 239:	50                   	push   %eax
 23a:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 240:	50                   	push   %eax
 241:	e8 76 02 00 00       	call   4bc <stat>
 246:	83 c4 10             	add    $0x10,%esp
 249:	85 c0                	test   %eax,%eax
 24b:	79 1b                	jns    268 <ls+0x1b2>
        printf(1, "ls: cannot stat %s\n", buf);
 24d:	83 ec 04             	sub    $0x4,%esp
 250:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 256:	50                   	push   %eax
 257:	68 da 0a 00 00       	push   $0xada
 25c:	6a 01                	push   $0x1
 25e:	e8 ac 04 00 00       	call   70f <printf>
 263:	83 c4 10             	add    $0x10,%esp
        continue;
 266:	eb 41                	jmp    2a9 <ls+0x1f3>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 268:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 26e:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 274:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 27b:	0f bf d8             	movswl %ax,%ebx
 27e:	83 ec 0c             	sub    $0xc,%esp
 281:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 287:	50                   	push   %eax
 288:	e8 73 fd ff ff       	call   0 <fmtname>
 28d:	83 c4 10             	add    $0x10,%esp
 290:	83 ec 08             	sub    $0x8,%esp
 293:	57                   	push   %edi
 294:	56                   	push   %esi
 295:	53                   	push   %ebx
 296:	50                   	push   %eax
 297:	68 ee 0a 00 00       	push   $0xaee
 29c:	6a 01                	push   $0x1
 29e:	e8 6c 04 00 00       	call   70f <printf>
 2a3:	83 c4 20             	add    $0x20,%esp
 2a6:	eb 01                	jmp    2a9 <ls+0x1f3>
        continue;
 2a8:	90                   	nop
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2a9:	83 ec 04             	sub    $0x4,%esp
 2ac:	6a 10                	push   $0x10
 2ae:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2b4:	50                   	push   %eax
 2b5:	ff 75 e4             	push   -0x1c(%ebp)
 2b8:	e8 f6 02 00 00       	call   5b3 <read>
 2bd:	83 c4 10             	add    $0x10,%esp
 2c0:	83 f8 10             	cmp    $0x10,%eax
 2c3:	0f 84 34 ff ff ff    	je     1fd <ls+0x147>
    }
    break;
 2c9:	90                   	nop
  }
  close(fd);
 2ca:	83 ec 0c             	sub    $0xc,%esp
 2cd:	ff 75 e4             	push   -0x1c(%ebp)
 2d0:	e8 ee 02 00 00       	call   5c3 <close>
 2d5:	83 c4 10             	add    $0x10,%esp
}
 2d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2db:	5b                   	pop    %ebx
 2dc:	5e                   	pop    %esi
 2dd:	5f                   	pop    %edi
 2de:	5d                   	pop    %ebp
 2df:	c3                   	ret

000002e0 <main>:

int
main(int argc, char *argv[])
{
 2e0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 2e4:	83 e4 f0             	and    $0xfffffff0,%esp
 2e7:	ff 71 fc             	push   -0x4(%ecx)
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	53                   	push   %ebx
 2ee:	51                   	push   %ecx
 2ef:	83 ec 10             	sub    $0x10,%esp
 2f2:	89 cb                	mov    %ecx,%ebx
  int i;

  if(argc < 2){
 2f4:	83 3b 01             	cmpl   $0x1,(%ebx)
 2f7:	7f 15                	jg     30e <main+0x2e>
    ls(".");
 2f9:	83 ec 0c             	sub    $0xc,%esp
 2fc:	68 0e 0b 00 00       	push   $0xb0e
 301:	e8 b0 fd ff ff       	call   b6 <ls>
 306:	83 c4 10             	add    $0x10,%esp
    exit();
 309:	e8 8d 02 00 00       	call   59b <exit>
  }
  for(i=1; i<argc; i++)
 30e:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 315:	eb 21                	jmp    338 <main+0x58>
    ls(argv[i]);
 317:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 321:	8b 43 04             	mov    0x4(%ebx),%eax
 324:	01 d0                	add    %edx,%eax
 326:	8b 00                	mov    (%eax),%eax
 328:	83 ec 0c             	sub    $0xc,%esp
 32b:	50                   	push   %eax
 32c:	e8 85 fd ff ff       	call   b6 <ls>
 331:	83 c4 10             	add    $0x10,%esp
  for(i=1; i<argc; i++)
 334:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 338:	8b 45 f4             	mov    -0xc(%ebp),%eax
 33b:	3b 03                	cmp    (%ebx),%eax
 33d:	7c d8                	jl     317 <main+0x37>
  exit();
 33f:	e8 57 02 00 00       	call   59b <exit>

00000344 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 344:	55                   	push   %ebp
 345:	89 e5                	mov    %esp,%ebp
 347:	57                   	push   %edi
 348:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 349:	8b 4d 08             	mov    0x8(%ebp),%ecx
 34c:	8b 55 10             	mov    0x10(%ebp),%edx
 34f:	8b 45 0c             	mov    0xc(%ebp),%eax
 352:	89 cb                	mov    %ecx,%ebx
 354:	89 df                	mov    %ebx,%edi
 356:	89 d1                	mov    %edx,%ecx
 358:	fc                   	cld
 359:	f3 aa                	rep stos %al,%es:(%edi)
 35b:	89 ca                	mov    %ecx,%edx
 35d:	89 fb                	mov    %edi,%ebx
 35f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 362:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 365:	90                   	nop
 366:	5b                   	pop    %ebx
 367:	5f                   	pop    %edi
 368:	5d                   	pop    %ebp
 369:	c3                   	ret

0000036a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 36a:	55                   	push   %ebp
 36b:	89 e5                	mov    %esp,%ebp
 36d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 370:	8b 45 08             	mov    0x8(%ebp),%eax
 373:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 376:	90                   	nop
 377:	8b 55 0c             	mov    0xc(%ebp),%edx
 37a:	8d 42 01             	lea    0x1(%edx),%eax
 37d:	89 45 0c             	mov    %eax,0xc(%ebp)
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	8d 48 01             	lea    0x1(%eax),%ecx
 386:	89 4d 08             	mov    %ecx,0x8(%ebp)
 389:	0f b6 12             	movzbl (%edx),%edx
 38c:	88 10                	mov    %dl,(%eax)
 38e:	0f b6 00             	movzbl (%eax),%eax
 391:	84 c0                	test   %al,%al
 393:	75 e2                	jne    377 <strcpy+0xd>
    ;
  return os;
 395:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 398:	c9                   	leave
 399:	c3                   	ret

0000039a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 39d:	eb 08                	jmp    3a7 <strcmp+0xd>
    p++, q++;
 39f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3a3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	0f b6 00             	movzbl (%eax),%eax
 3ad:	84 c0                	test   %al,%al
 3af:	74 10                	je     3c1 <strcmp+0x27>
 3b1:	8b 45 08             	mov    0x8(%ebp),%eax
 3b4:	0f b6 10             	movzbl (%eax),%edx
 3b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ba:	0f b6 00             	movzbl (%eax),%eax
 3bd:	38 c2                	cmp    %al,%dl
 3bf:	74 de                	je     39f <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
 3c1:	8b 45 08             	mov    0x8(%ebp),%eax
 3c4:	0f b6 00             	movzbl (%eax),%eax
 3c7:	0f b6 d0             	movzbl %al,%edx
 3ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cd:	0f b6 00             	movzbl (%eax),%eax
 3d0:	0f b6 c0             	movzbl %al,%eax
 3d3:	29 c2                	sub    %eax,%edx
 3d5:	89 d0                	mov    %edx,%eax
}
 3d7:	5d                   	pop    %ebp
 3d8:	c3                   	ret

000003d9 <strlen>:

uint
strlen(char *s)
{
 3d9:	55                   	push   %ebp
 3da:	89 e5                	mov    %esp,%ebp
 3dc:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3df:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3e6:	eb 04                	jmp    3ec <strlen+0x13>
 3e8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3ec:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3ef:	8b 45 08             	mov    0x8(%ebp),%eax
 3f2:	01 d0                	add    %edx,%eax
 3f4:	0f b6 00             	movzbl (%eax),%eax
 3f7:	84 c0                	test   %al,%al
 3f9:	75 ed                	jne    3e8 <strlen+0xf>
    ;
  return n;
 3fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fe:	c9                   	leave
 3ff:	c3                   	ret

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
 403:	8b 45 10             	mov    0x10(%ebp),%eax
 406:	50                   	push   %eax
 407:	ff 75 0c             	push   0xc(%ebp)
 40a:	ff 75 08             	push   0x8(%ebp)
 40d:	e8 32 ff ff ff       	call   344 <stosb>
 412:	83 c4 0c             	add    $0xc,%esp
  return dst;
 415:	8b 45 08             	mov    0x8(%ebp),%eax
}
 418:	c9                   	leave
 419:	c3                   	ret

0000041a <strchr>:

char*
strchr(const char *s, char c)
{
 41a:	55                   	push   %ebp
 41b:	89 e5                	mov    %esp,%ebp
 41d:	83 ec 04             	sub    $0x4,%esp
 420:	8b 45 0c             	mov    0xc(%ebp),%eax
 423:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 426:	eb 14                	jmp    43c <strchr+0x22>
    if(*s == c)
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	0f b6 00             	movzbl (%eax),%eax
 42e:	38 45 fc             	cmp    %al,-0x4(%ebp)
 431:	75 05                	jne    438 <strchr+0x1e>
      return (char*)s;
 433:	8b 45 08             	mov    0x8(%ebp),%eax
 436:	eb 13                	jmp    44b <strchr+0x31>
  for(; *s; s++)
 438:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 43c:	8b 45 08             	mov    0x8(%ebp),%eax
 43f:	0f b6 00             	movzbl (%eax),%eax
 442:	84 c0                	test   %al,%al
 444:	75 e2                	jne    428 <strchr+0xe>
  return 0;
 446:	b8 00 00 00 00       	mov    $0x0,%eax
}
 44b:	c9                   	leave
 44c:	c3                   	ret

0000044d <gets>:

char*
gets(char *buf, int max)
{
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 453:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 45a:	eb 42                	jmp    49e <gets+0x51>
    cc = read(0, &c, 1);
 45c:	83 ec 04             	sub    $0x4,%esp
 45f:	6a 01                	push   $0x1
 461:	8d 45 ef             	lea    -0x11(%ebp),%eax
 464:	50                   	push   %eax
 465:	6a 00                	push   $0x0
 467:	e8 47 01 00 00       	call   5b3 <read>
 46c:	83 c4 10             	add    $0x10,%esp
 46f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 472:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 476:	7e 33                	jle    4ab <gets+0x5e>
      break;
    buf[i++] = c;
 478:	8b 45 f4             	mov    -0xc(%ebp),%eax
 47b:	8d 50 01             	lea    0x1(%eax),%edx
 47e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 481:	89 c2                	mov    %eax,%edx
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	01 c2                	add    %eax,%edx
 488:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 48c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 48e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 492:	3c 0a                	cmp    $0xa,%al
 494:	74 16                	je     4ac <gets+0x5f>
 496:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 49a:	3c 0d                	cmp    $0xd,%al
 49c:	74 0e                	je     4ac <gets+0x5f>
  for(i=0; i+1 < max; ){
 49e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a1:	83 c0 01             	add    $0x1,%eax
 4a4:	39 45 0c             	cmp    %eax,0xc(%ebp)
 4a7:	7f b3                	jg     45c <gets+0xf>
 4a9:	eb 01                	jmp    4ac <gets+0x5f>
      break;
 4ab:	90                   	nop
      break;
  }
  buf[i] = '\0';
 4ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4af:	8b 45 08             	mov    0x8(%ebp),%eax
 4b2:	01 d0                	add    %edx,%eax
 4b4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4ba:	c9                   	leave
 4bb:	c3                   	ret

000004bc <stat>:

int
stat(char *n, struct stat *st)
{
 4bc:	55                   	push   %ebp
 4bd:	89 e5                	mov    %esp,%ebp
 4bf:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4c2:	83 ec 08             	sub    $0x8,%esp
 4c5:	6a 00                	push   $0x0
 4c7:	ff 75 08             	push   0x8(%ebp)
 4ca:	e8 0c 01 00 00       	call   5db <open>
 4cf:	83 c4 10             	add    $0x10,%esp
 4d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4d5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4d9:	79 07                	jns    4e2 <stat+0x26>
    return -1;
 4db:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4e0:	eb 25                	jmp    507 <stat+0x4b>
  r = fstat(fd, st);
 4e2:	83 ec 08             	sub    $0x8,%esp
 4e5:	ff 75 0c             	push   0xc(%ebp)
 4e8:	ff 75 f4             	push   -0xc(%ebp)
 4eb:	e8 03 01 00 00       	call   5f3 <fstat>
 4f0:	83 c4 10             	add    $0x10,%esp
 4f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4f6:	83 ec 0c             	sub    $0xc,%esp
 4f9:	ff 75 f4             	push   -0xc(%ebp)
 4fc:	e8 c2 00 00 00       	call   5c3 <close>
 501:	83 c4 10             	add    $0x10,%esp
  return r;
 504:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 507:	c9                   	leave
 508:	c3                   	ret

00000509 <atoi>:

int
atoi(const char *s)
{
 509:	55                   	push   %ebp
 50a:	89 e5                	mov    %esp,%ebp
 50c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 50f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 516:	eb 25                	jmp    53d <atoi+0x34>
    n = n*10 + *s++ - '0';
 518:	8b 55 fc             	mov    -0x4(%ebp),%edx
 51b:	89 d0                	mov    %edx,%eax
 51d:	c1 e0 02             	shl    $0x2,%eax
 520:	01 d0                	add    %edx,%eax
 522:	01 c0                	add    %eax,%eax
 524:	89 c1                	mov    %eax,%ecx
 526:	8b 45 08             	mov    0x8(%ebp),%eax
 529:	8d 50 01             	lea    0x1(%eax),%edx
 52c:	89 55 08             	mov    %edx,0x8(%ebp)
 52f:	0f b6 00             	movzbl (%eax),%eax
 532:	0f be c0             	movsbl %al,%eax
 535:	01 c8                	add    %ecx,%eax
 537:	83 e8 30             	sub    $0x30,%eax
 53a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53d:	8b 45 08             	mov    0x8(%ebp),%eax
 540:	0f b6 00             	movzbl (%eax),%eax
 543:	3c 2f                	cmp    $0x2f,%al
 545:	7e 0a                	jle    551 <atoi+0x48>
 547:	8b 45 08             	mov    0x8(%ebp),%eax
 54a:	0f b6 00             	movzbl (%eax),%eax
 54d:	3c 39                	cmp    $0x39,%al
 54f:	7e c7                	jle    518 <atoi+0xf>
  return n;
 551:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 554:	c9                   	leave
 555:	c3                   	ret

00000556 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 556:	55                   	push   %ebp
 557:	89 e5                	mov    %esp,%ebp
 559:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 55c:	8b 45 08             	mov    0x8(%ebp),%eax
 55f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 562:	8b 45 0c             	mov    0xc(%ebp),%eax
 565:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 568:	eb 17                	jmp    581 <memmove+0x2b>
    *dst++ = *src++;
 56a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 56d:	8d 42 01             	lea    0x1(%edx),%eax
 570:	89 45 f8             	mov    %eax,-0x8(%ebp)
 573:	8b 45 fc             	mov    -0x4(%ebp),%eax
 576:	8d 48 01             	lea    0x1(%eax),%ecx
 579:	89 4d fc             	mov    %ecx,-0x4(%ebp)
 57c:	0f b6 12             	movzbl (%edx),%edx
 57f:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
 581:	8b 45 10             	mov    0x10(%ebp),%eax
 584:	8d 50 ff             	lea    -0x1(%eax),%edx
 587:	89 55 10             	mov    %edx,0x10(%ebp)
 58a:	85 c0                	test   %eax,%eax
 58c:	7f dc                	jg     56a <memmove+0x14>
  return vdst;
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 591:	c9                   	leave
 592:	c3                   	ret

00000593 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 593:	b8 01 00 00 00       	mov    $0x1,%eax
 598:	cd 40                	int    $0x40
 59a:	c3                   	ret

0000059b <exit>:
SYSCALL(exit)
 59b:	b8 02 00 00 00       	mov    $0x2,%eax
 5a0:	cd 40                	int    $0x40
 5a2:	c3                   	ret

000005a3 <wait>:
SYSCALL(wait)
 5a3:	b8 03 00 00 00       	mov    $0x3,%eax
 5a8:	cd 40                	int    $0x40
 5aa:	c3                   	ret

000005ab <pipe>:
SYSCALL(pipe)
 5ab:	b8 04 00 00 00       	mov    $0x4,%eax
 5b0:	cd 40                	int    $0x40
 5b2:	c3                   	ret

000005b3 <read>:
SYSCALL(read)
 5b3:	b8 05 00 00 00       	mov    $0x5,%eax
 5b8:	cd 40                	int    $0x40
 5ba:	c3                   	ret

000005bb <write>:
SYSCALL(write)
 5bb:	b8 10 00 00 00       	mov    $0x10,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret

000005c3 <close>:
SYSCALL(close)
 5c3:	b8 15 00 00 00       	mov    $0x15,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret

000005cb <kill>:
SYSCALL(kill)
 5cb:	b8 06 00 00 00       	mov    $0x6,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret

000005d3 <exec>:
SYSCALL(exec)
 5d3:	b8 07 00 00 00       	mov    $0x7,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret

000005db <open>:
SYSCALL(open)
 5db:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret

000005e3 <mknod>:
SYSCALL(mknod)
 5e3:	b8 11 00 00 00       	mov    $0x11,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret

000005eb <unlink>:
SYSCALL(unlink)
 5eb:	b8 12 00 00 00       	mov    $0x12,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret

000005f3 <fstat>:
SYSCALL(fstat)
 5f3:	b8 08 00 00 00       	mov    $0x8,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret

000005fb <link>:
SYSCALL(link)
 5fb:	b8 13 00 00 00       	mov    $0x13,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret

00000603 <mkdir>:
SYSCALL(mkdir)
 603:	b8 14 00 00 00       	mov    $0x14,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret

0000060b <chdir>:
SYSCALL(chdir)
 60b:	b8 09 00 00 00       	mov    $0x9,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret

00000613 <dup>:
SYSCALL(dup)
 613:	b8 0a 00 00 00       	mov    $0xa,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret

0000061b <getpid>:
SYSCALL(getpid)
 61b:	b8 0b 00 00 00       	mov    $0xb,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret

00000623 <sbrk>:
SYSCALL(sbrk)
 623:	b8 0c 00 00 00       	mov    $0xc,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret

0000062b <sleep>:
SYSCALL(sleep)
 62b:	b8 0d 00 00 00       	mov    $0xd,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret

00000633 <uptime>:
SYSCALL(uptime)
 633:	b8 0e 00 00 00       	mov    $0xe,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret

0000063b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 63b:	55                   	push   %ebp
 63c:	89 e5                	mov    %esp,%ebp
 63e:	83 ec 18             	sub    $0x18,%esp
 641:	8b 45 0c             	mov    0xc(%ebp),%eax
 644:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 647:	83 ec 04             	sub    $0x4,%esp
 64a:	6a 01                	push   $0x1
 64c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 64f:	50                   	push   %eax
 650:	ff 75 08             	push   0x8(%ebp)
 653:	e8 63 ff ff ff       	call   5bb <write>
 658:	83 c4 10             	add    $0x10,%esp
}
 65b:	90                   	nop
 65c:	c9                   	leave
 65d:	c3                   	ret

0000065e <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 65e:	55                   	push   %ebp
 65f:	89 e5                	mov    %esp,%ebp
 661:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 664:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 66b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 66f:	74 17                	je     688 <printint+0x2a>
 671:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 675:	79 11                	jns    688 <printint+0x2a>
    neg = 1;
 677:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 67e:	8b 45 0c             	mov    0xc(%ebp),%eax
 681:	f7 d8                	neg    %eax
 683:	89 45 ec             	mov    %eax,-0x14(%ebp)
 686:	eb 06                	jmp    68e <printint+0x30>
  } else {
    x = xx;
 688:	8b 45 0c             	mov    0xc(%ebp),%eax
 68b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 68e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 695:	8b 4d 10             	mov    0x10(%ebp),%ecx
 698:	8b 45 ec             	mov    -0x14(%ebp),%eax
 69b:	ba 00 00 00 00       	mov    $0x0,%edx
 6a0:	f7 f1                	div    %ecx
 6a2:	89 d1                	mov    %edx,%ecx
 6a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a7:	8d 50 01             	lea    0x1(%eax),%edx
 6aa:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6ad:	0f b6 91 b4 0d 00 00 	movzbl 0xdb4(%ecx),%edx
 6b4:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
 6b8:	8b 4d 10             	mov    0x10(%ebp),%ecx
 6bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6be:	ba 00 00 00 00       	mov    $0x0,%edx
 6c3:	f7 f1                	div    %ecx
 6c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6c8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6cc:	75 c7                	jne    695 <printint+0x37>
  if(neg)
 6ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6d2:	74 2d                	je     701 <printint+0xa3>
    buf[i++] = '-';
 6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d7:	8d 50 01             	lea    0x1(%eax),%edx
 6da:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6dd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6e2:	eb 1d                	jmp    701 <printint+0xa3>
    putc(fd, buf[i]);
 6e4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ea:	01 d0                	add    %edx,%eax
 6ec:	0f b6 00             	movzbl (%eax),%eax
 6ef:	0f be c0             	movsbl %al,%eax
 6f2:	83 ec 08             	sub    $0x8,%esp
 6f5:	50                   	push   %eax
 6f6:	ff 75 08             	push   0x8(%ebp)
 6f9:	e8 3d ff ff ff       	call   63b <putc>
 6fe:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
 701:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 705:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 709:	79 d9                	jns    6e4 <printint+0x86>
}
 70b:	90                   	nop
 70c:	90                   	nop
 70d:	c9                   	leave
 70e:	c3                   	ret

0000070f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 70f:	55                   	push   %ebp
 710:	89 e5                	mov    %esp,%ebp
 712:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 715:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 71c:	8d 45 0c             	lea    0xc(%ebp),%eax
 71f:	83 c0 04             	add    $0x4,%eax
 722:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 725:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 72c:	e9 59 01 00 00       	jmp    88a <printf+0x17b>
    c = fmt[i] & 0xff;
 731:	8b 55 0c             	mov    0xc(%ebp),%edx
 734:	8b 45 f0             	mov    -0x10(%ebp),%eax
 737:	01 d0                	add    %edx,%eax
 739:	0f b6 00             	movzbl (%eax),%eax
 73c:	0f be c0             	movsbl %al,%eax
 73f:	25 ff 00 00 00       	and    $0xff,%eax
 744:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 747:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 74b:	75 2c                	jne    779 <printf+0x6a>
      if(c == '%'){
 74d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 751:	75 0c                	jne    75f <printf+0x50>
        state = '%';
 753:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 75a:	e9 27 01 00 00       	jmp    886 <printf+0x177>
      } else {
        putc(fd, c);
 75f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 762:	0f be c0             	movsbl %al,%eax
 765:	83 ec 08             	sub    $0x8,%esp
 768:	50                   	push   %eax
 769:	ff 75 08             	push   0x8(%ebp)
 76c:	e8 ca fe ff ff       	call   63b <putc>
 771:	83 c4 10             	add    $0x10,%esp
 774:	e9 0d 01 00 00       	jmp    886 <printf+0x177>
      }
    } else if(state == '%'){
 779:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 77d:	0f 85 03 01 00 00    	jne    886 <printf+0x177>
      if(c == 'd'){
 783:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 787:	75 1e                	jne    7a7 <printf+0x98>
        printint(fd, *ap, 10, 1);
 789:	8b 45 e8             	mov    -0x18(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	6a 01                	push   $0x1
 790:	6a 0a                	push   $0xa
 792:	50                   	push   %eax
 793:	ff 75 08             	push   0x8(%ebp)
 796:	e8 c3 fe ff ff       	call   65e <printint>
 79b:	83 c4 10             	add    $0x10,%esp
        ap++;
 79e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a2:	e9 d8 00 00 00       	jmp    87f <printf+0x170>
      } else if(c == 'x' || c == 'p'){
 7a7:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7ab:	74 06                	je     7b3 <printf+0xa4>
 7ad:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7b1:	75 1e                	jne    7d1 <printf+0xc2>
        printint(fd, *ap, 16, 0);
 7b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b6:	8b 00                	mov    (%eax),%eax
 7b8:	6a 00                	push   $0x0
 7ba:	6a 10                	push   $0x10
 7bc:	50                   	push   %eax
 7bd:	ff 75 08             	push   0x8(%ebp)
 7c0:	e8 99 fe ff ff       	call   65e <printint>
 7c5:	83 c4 10             	add    $0x10,%esp
        ap++;
 7c8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7cc:	e9 ae 00 00 00       	jmp    87f <printf+0x170>
      } else if(c == 's'){
 7d1:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7d5:	75 43                	jne    81a <printf+0x10b>
        s = (char*)*ap;
 7d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7df:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7e3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e7:	75 25                	jne    80e <printf+0xff>
          s = "(null)";
 7e9:	c7 45 f4 10 0b 00 00 	movl   $0xb10,-0xc(%ebp)
        while(*s != 0){
 7f0:	eb 1c                	jmp    80e <printf+0xff>
          putc(fd, *s);
 7f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f5:	0f b6 00             	movzbl (%eax),%eax
 7f8:	0f be c0             	movsbl %al,%eax
 7fb:	83 ec 08             	sub    $0x8,%esp
 7fe:	50                   	push   %eax
 7ff:	ff 75 08             	push   0x8(%ebp)
 802:	e8 34 fe ff ff       	call   63b <putc>
 807:	83 c4 10             	add    $0x10,%esp
          s++;
 80a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
 80e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 811:	0f b6 00             	movzbl (%eax),%eax
 814:	84 c0                	test   %al,%al
 816:	75 da                	jne    7f2 <printf+0xe3>
 818:	eb 65                	jmp    87f <printf+0x170>
        }
      } else if(c == 'c'){
 81a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 81e:	75 1d                	jne    83d <printf+0x12e>
        putc(fd, *ap);
 820:	8b 45 e8             	mov    -0x18(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	0f be c0             	movsbl %al,%eax
 828:	83 ec 08             	sub    $0x8,%esp
 82b:	50                   	push   %eax
 82c:	ff 75 08             	push   0x8(%ebp)
 82f:	e8 07 fe ff ff       	call   63b <putc>
 834:	83 c4 10             	add    $0x10,%esp
        ap++;
 837:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 83b:	eb 42                	jmp    87f <printf+0x170>
      } else if(c == '%'){
 83d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 841:	75 17                	jne    85a <printf+0x14b>
        putc(fd, c);
 843:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 846:	0f be c0             	movsbl %al,%eax
 849:	83 ec 08             	sub    $0x8,%esp
 84c:	50                   	push   %eax
 84d:	ff 75 08             	push   0x8(%ebp)
 850:	e8 e6 fd ff ff       	call   63b <putc>
 855:	83 c4 10             	add    $0x10,%esp
 858:	eb 25                	jmp    87f <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 85a:	83 ec 08             	sub    $0x8,%esp
 85d:	6a 25                	push   $0x25
 85f:	ff 75 08             	push   0x8(%ebp)
 862:	e8 d4 fd ff ff       	call   63b <putc>
 867:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
 86a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86d:	0f be c0             	movsbl %al,%eax
 870:	83 ec 08             	sub    $0x8,%esp
 873:	50                   	push   %eax
 874:	ff 75 08             	push   0x8(%ebp)
 877:	e8 bf fd ff ff       	call   63b <putc>
 87c:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 87f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
 886:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 88a:	8b 55 0c             	mov    0xc(%ebp),%edx
 88d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 890:	01 d0                	add    %edx,%eax
 892:	0f b6 00             	movzbl (%eax),%eax
 895:	84 c0                	test   %al,%al
 897:	0f 85 94 fe ff ff    	jne    731 <printf+0x22>
    }
  }
}
 89d:	90                   	nop
 89e:	90                   	nop
 89f:	c9                   	leave
 8a0:	c3                   	ret

000008a1 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8a1:	55                   	push   %ebp
 8a2:	89 e5                	mov    %esp,%ebp
 8a4:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a7:	8b 45 08             	mov    0x8(%ebp),%eax
 8aa:	83 e8 08             	sub    $0x8,%eax
 8ad:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8b0:	a1 e0 0d 00 00       	mov    0xde0,%eax
 8b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8b8:	eb 24                	jmp    8de <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bd:	8b 00                	mov    (%eax),%eax
 8bf:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 8c2:	72 12                	jb     8d6 <free+0x35>
 8c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c7:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 8ca:	72 24                	jb     8f0 <free+0x4f>
 8cc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cf:	8b 00                	mov    (%eax),%eax
 8d1:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8d4:	72 1a                	jb     8f0 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d9:	8b 00                	mov    (%eax),%eax
 8db:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8de:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e1:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 8e4:	73 d4                	jae    8ba <free+0x19>
 8e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e9:	8b 00                	mov    (%eax),%eax
 8eb:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 8ee:	73 ca                	jae    8ba <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f3:	8b 40 04             	mov    0x4(%eax),%eax
 8f6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 900:	01 c2                	add    %eax,%edx
 902:	8b 45 fc             	mov    -0x4(%ebp),%eax
 905:	8b 00                	mov    (%eax),%eax
 907:	39 c2                	cmp    %eax,%edx
 909:	75 24                	jne    92f <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 90b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90e:	8b 50 04             	mov    0x4(%eax),%edx
 911:	8b 45 fc             	mov    -0x4(%ebp),%eax
 914:	8b 00                	mov    (%eax),%eax
 916:	8b 40 04             	mov    0x4(%eax),%eax
 919:	01 c2                	add    %eax,%edx
 91b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91e:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 921:	8b 45 fc             	mov    -0x4(%ebp),%eax
 924:	8b 00                	mov    (%eax),%eax
 926:	8b 10                	mov    (%eax),%edx
 928:	8b 45 f8             	mov    -0x8(%ebp),%eax
 92b:	89 10                	mov    %edx,(%eax)
 92d:	eb 0a                	jmp    939 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 92f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 932:	8b 10                	mov    (%eax),%edx
 934:	8b 45 f8             	mov    -0x8(%ebp),%eax
 937:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 939:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93c:	8b 40 04             	mov    0x4(%eax),%eax
 93f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 946:	8b 45 fc             	mov    -0x4(%ebp),%eax
 949:	01 d0                	add    %edx,%eax
 94b:	39 45 f8             	cmp    %eax,-0x8(%ebp)
 94e:	75 20                	jne    970 <free+0xcf>
    p->s.size += bp->s.size;
 950:	8b 45 fc             	mov    -0x4(%ebp),%eax
 953:	8b 50 04             	mov    0x4(%eax),%edx
 956:	8b 45 f8             	mov    -0x8(%ebp),%eax
 959:	8b 40 04             	mov    0x4(%eax),%eax
 95c:	01 c2                	add    %eax,%edx
 95e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 961:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 964:	8b 45 f8             	mov    -0x8(%ebp),%eax
 967:	8b 10                	mov    (%eax),%edx
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	89 10                	mov    %edx,(%eax)
 96e:	eb 08                	jmp    978 <free+0xd7>
  } else
    p->s.ptr = bp;
 970:	8b 45 fc             	mov    -0x4(%ebp),%eax
 973:	8b 55 f8             	mov    -0x8(%ebp),%edx
 976:	89 10                	mov    %edx,(%eax)
  freep = p;
 978:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97b:	a3 e0 0d 00 00       	mov    %eax,0xde0
}
 980:	90                   	nop
 981:	c9                   	leave
 982:	c3                   	ret

00000983 <morecore>:

static Header*
morecore(uint nu)
{
 983:	55                   	push   %ebp
 984:	89 e5                	mov    %esp,%ebp
 986:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 989:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 990:	77 07                	ja     999 <morecore+0x16>
    nu = 4096;
 992:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 999:	8b 45 08             	mov    0x8(%ebp),%eax
 99c:	c1 e0 03             	shl    $0x3,%eax
 99f:	83 ec 0c             	sub    $0xc,%esp
 9a2:	50                   	push   %eax
 9a3:	e8 7b fc ff ff       	call   623 <sbrk>
 9a8:	83 c4 10             	add    $0x10,%esp
 9ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9ae:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9b2:	75 07                	jne    9bb <morecore+0x38>
    return 0;
 9b4:	b8 00 00 00 00       	mov    $0x0,%eax
 9b9:	eb 26                	jmp    9e1 <morecore+0x5e>
  hp = (Header*)p;
 9bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9be:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c4:	8b 55 08             	mov    0x8(%ebp),%edx
 9c7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9cd:	83 c0 08             	add    $0x8,%eax
 9d0:	83 ec 0c             	sub    $0xc,%esp
 9d3:	50                   	push   %eax
 9d4:	e8 c8 fe ff ff       	call   8a1 <free>
 9d9:	83 c4 10             	add    $0x10,%esp
  return freep;
 9dc:	a1 e0 0d 00 00       	mov    0xde0,%eax
}
 9e1:	c9                   	leave
 9e2:	c3                   	ret

000009e3 <malloc>:

void*
malloc(uint nbytes)
{
 9e3:	55                   	push   %ebp
 9e4:	89 e5                	mov    %esp,%ebp
 9e6:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
 9ec:	83 c0 07             	add    $0x7,%eax
 9ef:	c1 e8 03             	shr    $0x3,%eax
 9f2:	83 c0 01             	add    $0x1,%eax
 9f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9f8:	a1 e0 0d 00 00       	mov    0xde0,%eax
 9fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a00:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a04:	75 23                	jne    a29 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a06:	c7 45 f0 d8 0d 00 00 	movl   $0xdd8,-0x10(%ebp)
 a0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a10:	a3 e0 0d 00 00       	mov    %eax,0xde0
 a15:	a1 e0 0d 00 00       	mov    0xde0,%eax
 a1a:	a3 d8 0d 00 00       	mov    %eax,0xdd8
    base.s.size = 0;
 a1f:	c7 05 dc 0d 00 00 00 	movl   $0x0,0xddc
 a26:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2c:	8b 00                	mov    (%eax),%eax
 a2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a34:	8b 40 04             	mov    0x4(%eax),%eax
 a37:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a3a:	72 4d                	jb     a89 <malloc+0xa6>
      if(p->s.size == nunits)
 a3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3f:	8b 40 04             	mov    0x4(%eax),%eax
 a42:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a45:	75 0c                	jne    a53 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a47:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4a:	8b 10                	mov    (%eax),%edx
 a4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4f:	89 10                	mov    %edx,(%eax)
 a51:	eb 26                	jmp    a79 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a56:	8b 40 04             	mov    0x4(%eax),%eax
 a59:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a5c:	89 c2                	mov    %eax,%edx
 a5e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a61:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a64:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a67:	8b 40 04             	mov    0x4(%eax),%eax
 a6a:	c1 e0 03             	shl    $0x3,%eax
 a6d:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a70:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a73:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a76:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7c:	a3 e0 0d 00 00       	mov    %eax,0xde0
      return (void*)(p + 1);
 a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a84:	83 c0 08             	add    $0x8,%eax
 a87:	eb 3b                	jmp    ac4 <malloc+0xe1>
    }
    if(p == freep)
 a89:	a1 e0 0d 00 00       	mov    0xde0,%eax
 a8e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a91:	75 1e                	jne    ab1 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
 a93:	83 ec 0c             	sub    $0xc,%esp
 a96:	ff 75 ec             	push   -0x14(%ebp)
 a99:	e8 e5 fe ff ff       	call   983 <morecore>
 a9e:	83 c4 10             	add    $0x10,%esp
 aa1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aa4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 aa8:	75 07                	jne    ab1 <malloc+0xce>
        return 0;
 aaa:	b8 00 00 00 00       	mov    $0x0,%eax
 aaf:	eb 13                	jmp    ac4 <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aba:	8b 00                	mov    (%eax),%eax
 abc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 abf:	e9 6d ff ff ff       	jmp    a31 <malloc+0x4e>
  }
}
 ac4:	c9                   	leave
 ac5:	c3                   	ret
