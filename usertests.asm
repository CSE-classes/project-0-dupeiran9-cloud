
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "iput test\n");
       6:	a1 b4 62 00 00       	mov    0x62b4,%eax
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 16 44 00 00       	push   $0x4416
      13:	50                   	push   %eax
      14:	e8 2d 40 00 00       	call   4046 <printf>
      19:	83 c4 10             	add    $0x10,%esp

  if(mkdir("iputdir") < 0){
      1c:	83 ec 0c             	sub    $0xc,%esp
      1f:	68 21 44 00 00       	push   $0x4421
      24:	e8 11 3f 00 00       	call   3f3a <mkdir>
      29:	83 c4 10             	add    $0x10,%esp
      2c:	85 c0                	test   %eax,%eax
      2e:	79 1b                	jns    4b <iputtest+0x4b>
    printf(stdout, "mkdir failed\n");
      30:	a1 b4 62 00 00       	mov    0x62b4,%eax
      35:	83 ec 08             	sub    $0x8,%esp
      38:	68 29 44 00 00       	push   $0x4429
      3d:	50                   	push   %eax
      3e:	e8 03 40 00 00       	call   4046 <printf>
      43:	83 c4 10             	add    $0x10,%esp
    exit();
      46:	e8 87 3e 00 00       	call   3ed2 <exit>
  }
  if(chdir("iputdir") < 0){
      4b:	83 ec 0c             	sub    $0xc,%esp
      4e:	68 21 44 00 00       	push   $0x4421
      53:	e8 ea 3e 00 00       	call   3f42 <chdir>
      58:	83 c4 10             	add    $0x10,%esp
      5b:	85 c0                	test   %eax,%eax
      5d:	79 1b                	jns    7a <iputtest+0x7a>
    printf(stdout, "chdir iputdir failed\n");
      5f:	a1 b4 62 00 00       	mov    0x62b4,%eax
      64:	83 ec 08             	sub    $0x8,%esp
      67:	68 37 44 00 00       	push   $0x4437
      6c:	50                   	push   %eax
      6d:	e8 d4 3f 00 00       	call   4046 <printf>
      72:	83 c4 10             	add    $0x10,%esp
    exit();
      75:	e8 58 3e 00 00       	call   3ed2 <exit>
  }
  if(unlink("../iputdir") < 0){
      7a:	83 ec 0c             	sub    $0xc,%esp
      7d:	68 4d 44 00 00       	push   $0x444d
      82:	e8 9b 3e 00 00       	call   3f22 <unlink>
      87:	83 c4 10             	add    $0x10,%esp
      8a:	85 c0                	test   %eax,%eax
      8c:	79 1b                	jns    a9 <iputtest+0xa9>
    printf(stdout, "unlink ../iputdir failed\n");
      8e:	a1 b4 62 00 00       	mov    0x62b4,%eax
      93:	83 ec 08             	sub    $0x8,%esp
      96:	68 58 44 00 00       	push   $0x4458
      9b:	50                   	push   %eax
      9c:	e8 a5 3f 00 00       	call   4046 <printf>
      a1:	83 c4 10             	add    $0x10,%esp
    exit();
      a4:	e8 29 3e 00 00       	call   3ed2 <exit>
  }
  if(chdir("/") < 0){
      a9:	83 ec 0c             	sub    $0xc,%esp
      ac:	68 72 44 00 00       	push   $0x4472
      b1:	e8 8c 3e 00 00       	call   3f42 <chdir>
      b6:	83 c4 10             	add    $0x10,%esp
      b9:	85 c0                	test   %eax,%eax
      bb:	79 1b                	jns    d8 <iputtest+0xd8>
    printf(stdout, "chdir / failed\n");
      bd:	a1 b4 62 00 00       	mov    0x62b4,%eax
      c2:	83 ec 08             	sub    $0x8,%esp
      c5:	68 74 44 00 00       	push   $0x4474
      ca:	50                   	push   %eax
      cb:	e8 76 3f 00 00       	call   4046 <printf>
      d0:	83 c4 10             	add    $0x10,%esp
    exit();
      d3:	e8 fa 3d 00 00       	call   3ed2 <exit>
  }
  printf(stdout, "iput test ok\n");
      d8:	a1 b4 62 00 00       	mov    0x62b4,%eax
      dd:	83 ec 08             	sub    $0x8,%esp
      e0:	68 84 44 00 00       	push   $0x4484
      e5:	50                   	push   %eax
      e6:	e8 5b 3f 00 00       	call   4046 <printf>
      eb:	83 c4 10             	add    $0x10,%esp
}
      ee:	90                   	nop
      ef:	c9                   	leave
      f0:	c3                   	ret

000000f1 <exitiputtest>:

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
      f1:	55                   	push   %ebp
      f2:	89 e5                	mov    %esp,%ebp
      f4:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "exitiput test\n");
      f7:	a1 b4 62 00 00       	mov    0x62b4,%eax
      fc:	83 ec 08             	sub    $0x8,%esp
      ff:	68 92 44 00 00       	push   $0x4492
     104:	50                   	push   %eax
     105:	e8 3c 3f 00 00       	call   4046 <printf>
     10a:	83 c4 10             	add    $0x10,%esp

  pid = fork();
     10d:	e8 b8 3d 00 00       	call   3eca <fork>
     112:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     115:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     119:	79 1b                	jns    136 <exitiputtest+0x45>
    printf(stdout, "fork failed\n");
     11b:	a1 b4 62 00 00       	mov    0x62b4,%eax
     120:	83 ec 08             	sub    $0x8,%esp
     123:	68 a1 44 00 00       	push   $0x44a1
     128:	50                   	push   %eax
     129:	e8 18 3f 00 00       	call   4046 <printf>
     12e:	83 c4 10             	add    $0x10,%esp
    exit();
     131:	e8 9c 3d 00 00       	call   3ed2 <exit>
  }
  if(pid == 0){
     136:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     13a:	0f 85 92 00 00 00    	jne    1d2 <exitiputtest+0xe1>
    if(mkdir("iputdir") < 0){
     140:	83 ec 0c             	sub    $0xc,%esp
     143:	68 21 44 00 00       	push   $0x4421
     148:	e8 ed 3d 00 00       	call   3f3a <mkdir>
     14d:	83 c4 10             	add    $0x10,%esp
     150:	85 c0                	test   %eax,%eax
     152:	79 1b                	jns    16f <exitiputtest+0x7e>
      printf(stdout, "mkdir failed\n");
     154:	a1 b4 62 00 00       	mov    0x62b4,%eax
     159:	83 ec 08             	sub    $0x8,%esp
     15c:	68 29 44 00 00       	push   $0x4429
     161:	50                   	push   %eax
     162:	e8 df 3e 00 00       	call   4046 <printf>
     167:	83 c4 10             	add    $0x10,%esp
      exit();
     16a:	e8 63 3d 00 00       	call   3ed2 <exit>
    }
    if(chdir("iputdir") < 0){
     16f:	83 ec 0c             	sub    $0xc,%esp
     172:	68 21 44 00 00       	push   $0x4421
     177:	e8 c6 3d 00 00       	call   3f42 <chdir>
     17c:	83 c4 10             	add    $0x10,%esp
     17f:	85 c0                	test   %eax,%eax
     181:	79 1b                	jns    19e <exitiputtest+0xad>
      printf(stdout, "child chdir failed\n");
     183:	a1 b4 62 00 00       	mov    0x62b4,%eax
     188:	83 ec 08             	sub    $0x8,%esp
     18b:	68 ae 44 00 00       	push   $0x44ae
     190:	50                   	push   %eax
     191:	e8 b0 3e 00 00       	call   4046 <printf>
     196:	83 c4 10             	add    $0x10,%esp
      exit();
     199:	e8 34 3d 00 00       	call   3ed2 <exit>
    }
    if(unlink("../iputdir") < 0){
     19e:	83 ec 0c             	sub    $0xc,%esp
     1a1:	68 4d 44 00 00       	push   $0x444d
     1a6:	e8 77 3d 00 00       	call   3f22 <unlink>
     1ab:	83 c4 10             	add    $0x10,%esp
     1ae:	85 c0                	test   %eax,%eax
     1b0:	79 1b                	jns    1cd <exitiputtest+0xdc>
      printf(stdout, "unlink ../iputdir failed\n");
     1b2:	a1 b4 62 00 00       	mov    0x62b4,%eax
     1b7:	83 ec 08             	sub    $0x8,%esp
     1ba:	68 58 44 00 00       	push   $0x4458
     1bf:	50                   	push   %eax
     1c0:	e8 81 3e 00 00       	call   4046 <printf>
     1c5:	83 c4 10             	add    $0x10,%esp
      exit();
     1c8:	e8 05 3d 00 00       	call   3ed2 <exit>
    }
    exit();
     1cd:	e8 00 3d 00 00       	call   3ed2 <exit>
  }
  wait();
     1d2:	e8 03 3d 00 00       	call   3eda <wait>
  printf(stdout, "exitiput test ok\n");
     1d7:	a1 b4 62 00 00       	mov    0x62b4,%eax
     1dc:	83 ec 08             	sub    $0x8,%esp
     1df:	68 c2 44 00 00       	push   $0x44c2
     1e4:	50                   	push   %eax
     1e5:	e8 5c 3e 00 00       	call   4046 <printf>
     1ea:	83 c4 10             	add    $0x10,%esp
}
     1ed:	90                   	nop
     1ee:	c9                   	leave
     1ef:	c3                   	ret

000001f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	83 ec 18             	sub    $0x18,%esp
  int pid;

  printf(stdout, "openiput test\n");
     1f6:	a1 b4 62 00 00       	mov    0x62b4,%eax
     1fb:	83 ec 08             	sub    $0x8,%esp
     1fe:	68 d4 44 00 00       	push   $0x44d4
     203:	50                   	push   %eax
     204:	e8 3d 3e 00 00       	call   4046 <printf>
     209:	83 c4 10             	add    $0x10,%esp
  if(mkdir("oidir") < 0){
     20c:	83 ec 0c             	sub    $0xc,%esp
     20f:	68 e3 44 00 00       	push   $0x44e3
     214:	e8 21 3d 00 00       	call   3f3a <mkdir>
     219:	83 c4 10             	add    $0x10,%esp
     21c:	85 c0                	test   %eax,%eax
     21e:	79 1b                	jns    23b <openiputtest+0x4b>
    printf(stdout, "mkdir oidir failed\n");
     220:	a1 b4 62 00 00       	mov    0x62b4,%eax
     225:	83 ec 08             	sub    $0x8,%esp
     228:	68 e9 44 00 00       	push   $0x44e9
     22d:	50                   	push   %eax
     22e:	e8 13 3e 00 00       	call   4046 <printf>
     233:	83 c4 10             	add    $0x10,%esp
    exit();
     236:	e8 97 3c 00 00       	call   3ed2 <exit>
  }
  pid = fork();
     23b:	e8 8a 3c 00 00       	call   3eca <fork>
     240:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid < 0){
     243:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     247:	79 1b                	jns    264 <openiputtest+0x74>
    printf(stdout, "fork failed\n");
     249:	a1 b4 62 00 00       	mov    0x62b4,%eax
     24e:	83 ec 08             	sub    $0x8,%esp
     251:	68 a1 44 00 00       	push   $0x44a1
     256:	50                   	push   %eax
     257:	e8 ea 3d 00 00       	call   4046 <printf>
     25c:	83 c4 10             	add    $0x10,%esp
    exit();
     25f:	e8 6e 3c 00 00       	call   3ed2 <exit>
  }
  if(pid == 0){
     264:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     268:	75 3b                	jne    2a5 <openiputtest+0xb5>
    int fd = open("oidir", O_RDWR);
     26a:	83 ec 08             	sub    $0x8,%esp
     26d:	6a 02                	push   $0x2
     26f:	68 e3 44 00 00       	push   $0x44e3
     274:	e8 99 3c 00 00       	call   3f12 <open>
     279:	83 c4 10             	add    $0x10,%esp
     27c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0){
     27f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     283:	78 1b                	js     2a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     285:	a1 b4 62 00 00       	mov    0x62b4,%eax
     28a:	83 ec 08             	sub    $0x8,%esp
     28d:	68 00 45 00 00       	push   $0x4500
     292:	50                   	push   %eax
     293:	e8 ae 3d 00 00       	call   4046 <printf>
     298:	83 c4 10             	add    $0x10,%esp
      exit();
     29b:	e8 32 3c 00 00       	call   3ed2 <exit>
    }
    exit();
     2a0:	e8 2d 3c 00 00       	call   3ed2 <exit>
  }
  sleep(1);
     2a5:	83 ec 0c             	sub    $0xc,%esp
     2a8:	6a 01                	push   $0x1
     2aa:	e8 b3 3c 00 00       	call   3f62 <sleep>
     2af:	83 c4 10             	add    $0x10,%esp
  if(unlink("oidir") != 0){
     2b2:	83 ec 0c             	sub    $0xc,%esp
     2b5:	68 e3 44 00 00       	push   $0x44e3
     2ba:	e8 63 3c 00 00       	call   3f22 <unlink>
     2bf:	83 c4 10             	add    $0x10,%esp
     2c2:	85 c0                	test   %eax,%eax
     2c4:	74 1b                	je     2e1 <openiputtest+0xf1>
    printf(stdout, "unlink failed\n");
     2c6:	a1 b4 62 00 00       	mov    0x62b4,%eax
     2cb:	83 ec 08             	sub    $0x8,%esp
     2ce:	68 24 45 00 00       	push   $0x4524
     2d3:	50                   	push   %eax
     2d4:	e8 6d 3d 00 00       	call   4046 <printf>
     2d9:	83 c4 10             	add    $0x10,%esp
    exit();
     2dc:	e8 f1 3b 00 00       	call   3ed2 <exit>
  }
  wait();
     2e1:	e8 f4 3b 00 00       	call   3eda <wait>
  printf(stdout, "openiput test ok\n");
     2e6:	a1 b4 62 00 00       	mov    0x62b4,%eax
     2eb:	83 ec 08             	sub    $0x8,%esp
     2ee:	68 33 45 00 00       	push   $0x4533
     2f3:	50                   	push   %eax
     2f4:	e8 4d 3d 00 00       	call   4046 <printf>
     2f9:	83 c4 10             	add    $0x10,%esp
}
     2fc:	90                   	nop
     2fd:	c9                   	leave
     2fe:	c3                   	ret

000002ff <opentest>:

// simple file system tests

void
opentest(void)
{
     2ff:	55                   	push   %ebp
     300:	89 e5                	mov    %esp,%ebp
     302:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(stdout, "open test\n");
     305:	a1 b4 62 00 00       	mov    0x62b4,%eax
     30a:	83 ec 08             	sub    $0x8,%esp
     30d:	68 45 45 00 00       	push   $0x4545
     312:	50                   	push   %eax
     313:	e8 2e 3d 00 00       	call   4046 <printf>
     318:	83 c4 10             	add    $0x10,%esp
  fd = open("echo", 0);
     31b:	83 ec 08             	sub    $0x8,%esp
     31e:	6a 00                	push   $0x0
     320:	68 00 44 00 00       	push   $0x4400
     325:	e8 e8 3b 00 00       	call   3f12 <open>
     32a:	83 c4 10             	add    $0x10,%esp
     32d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
     330:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     334:	79 1b                	jns    351 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
     336:	a1 b4 62 00 00       	mov    0x62b4,%eax
     33b:	83 ec 08             	sub    $0x8,%esp
     33e:	68 50 45 00 00       	push   $0x4550
     343:	50                   	push   %eax
     344:	e8 fd 3c 00 00       	call   4046 <printf>
     349:	83 c4 10             	add    $0x10,%esp
    exit();
     34c:	e8 81 3b 00 00       	call   3ed2 <exit>
  }
  close(fd);
     351:	83 ec 0c             	sub    $0xc,%esp
     354:	ff 75 f4             	push   -0xc(%ebp)
     357:	e8 9e 3b 00 00       	call   3efa <close>
     35c:	83 c4 10             	add    $0x10,%esp
  fd = open("doesnotexist", 0);
     35f:	83 ec 08             	sub    $0x8,%esp
     362:	6a 00                	push   $0x0
     364:	68 63 45 00 00       	push   $0x4563
     369:	e8 a4 3b 00 00       	call   3f12 <open>
     36e:	83 c4 10             	add    $0x10,%esp
     371:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
     374:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     378:	78 1b                	js     395 <opentest+0x96>
    printf(stdout, "open doesnotexist succeeded!\n");
     37a:	a1 b4 62 00 00       	mov    0x62b4,%eax
     37f:	83 ec 08             	sub    $0x8,%esp
     382:	68 70 45 00 00       	push   $0x4570
     387:	50                   	push   %eax
     388:	e8 b9 3c 00 00       	call   4046 <printf>
     38d:	83 c4 10             	add    $0x10,%esp
    exit();
     390:	e8 3d 3b 00 00       	call   3ed2 <exit>
  }
  printf(stdout, "open test ok\n");
     395:	a1 b4 62 00 00       	mov    0x62b4,%eax
     39a:	83 ec 08             	sub    $0x8,%esp
     39d:	68 8e 45 00 00       	push   $0x458e
     3a2:	50                   	push   %eax
     3a3:	e8 9e 3c 00 00       	call   4046 <printf>
     3a8:	83 c4 10             	add    $0x10,%esp
}
     3ab:	90                   	nop
     3ac:	c9                   	leave
     3ad:	c3                   	ret

000003ae <writetest>:

void
writetest(void)
{
     3ae:	55                   	push   %ebp
     3af:	89 e5                	mov    %esp,%ebp
     3b1:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
     3b4:	a1 b4 62 00 00       	mov    0x62b4,%eax
     3b9:	83 ec 08             	sub    $0x8,%esp
     3bc:	68 9c 45 00 00       	push   $0x459c
     3c1:	50                   	push   %eax
     3c2:	e8 7f 3c 00 00       	call   4046 <printf>
     3c7:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_CREATE|O_RDWR);
     3ca:	83 ec 08             	sub    $0x8,%esp
     3cd:	68 02 02 00 00       	push   $0x202
     3d2:	68 ad 45 00 00       	push   $0x45ad
     3d7:	e8 36 3b 00 00       	call   3f12 <open>
     3dc:	83 c4 10             	add    $0x10,%esp
     3df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     3e2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3e6:	78 22                	js     40a <writetest+0x5c>
    printf(stdout, "creat small succeeded; ok\n");
     3e8:	a1 b4 62 00 00       	mov    0x62b4,%eax
     3ed:	83 ec 08             	sub    $0x8,%esp
     3f0:	68 b3 45 00 00       	push   $0x45b3
     3f5:	50                   	push   %eax
     3f6:	e8 4b 3c 00 00       	call   4046 <printf>
     3fb:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     3fe:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     405:	e9 8f 00 00 00       	jmp    499 <writetest+0xeb>
    printf(stdout, "error: creat small failed!\n");
     40a:	a1 b4 62 00 00       	mov    0x62b4,%eax
     40f:	83 ec 08             	sub    $0x8,%esp
     412:	68 ce 45 00 00       	push   $0x45ce
     417:	50                   	push   %eax
     418:	e8 29 3c 00 00       	call   4046 <printf>
     41d:	83 c4 10             	add    $0x10,%esp
    exit();
     420:	e8 ad 3a 00 00       	call   3ed2 <exit>
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     425:	83 ec 04             	sub    $0x4,%esp
     428:	6a 0a                	push   $0xa
     42a:	68 ea 45 00 00       	push   $0x45ea
     42f:	ff 75 f0             	push   -0x10(%ebp)
     432:	e8 bb 3a 00 00       	call   3ef2 <write>
     437:	83 c4 10             	add    $0x10,%esp
     43a:	83 f8 0a             	cmp    $0xa,%eax
     43d:	74 1e                	je     45d <writetest+0xaf>
      printf(stdout, "error: write aa %d new file failed\n", i);
     43f:	a1 b4 62 00 00       	mov    0x62b4,%eax
     444:	83 ec 04             	sub    $0x4,%esp
     447:	ff 75 f4             	push   -0xc(%ebp)
     44a:	68 f8 45 00 00       	push   $0x45f8
     44f:	50                   	push   %eax
     450:	e8 f1 3b 00 00       	call   4046 <printf>
     455:	83 c4 10             	add    $0x10,%esp
      exit();
     458:	e8 75 3a 00 00       	call   3ed2 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     45d:	83 ec 04             	sub    $0x4,%esp
     460:	6a 0a                	push   $0xa
     462:	68 1c 46 00 00       	push   $0x461c
     467:	ff 75 f0             	push   -0x10(%ebp)
     46a:	e8 83 3a 00 00       	call   3ef2 <write>
     46f:	83 c4 10             	add    $0x10,%esp
     472:	83 f8 0a             	cmp    $0xa,%eax
     475:	74 1e                	je     495 <writetest+0xe7>
      printf(stdout, "error: write bb %d new file failed\n", i);
     477:	a1 b4 62 00 00       	mov    0x62b4,%eax
     47c:	83 ec 04             	sub    $0x4,%esp
     47f:	ff 75 f4             	push   -0xc(%ebp)
     482:	68 28 46 00 00       	push   $0x4628
     487:	50                   	push   %eax
     488:	e8 b9 3b 00 00       	call   4046 <printf>
     48d:	83 c4 10             	add    $0x10,%esp
      exit();
     490:	e8 3d 3a 00 00       	call   3ed2 <exit>
  for(i = 0; i < 100; i++){
     495:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     499:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     49d:	7e 86                	jle    425 <writetest+0x77>
    }
  }
  printf(stdout, "writes ok\n");
     49f:	a1 b4 62 00 00       	mov    0x62b4,%eax
     4a4:	83 ec 08             	sub    $0x8,%esp
     4a7:	68 4c 46 00 00       	push   $0x464c
     4ac:	50                   	push   %eax
     4ad:	e8 94 3b 00 00       	call   4046 <printf>
     4b2:	83 c4 10             	add    $0x10,%esp
  close(fd);
     4b5:	83 ec 0c             	sub    $0xc,%esp
     4b8:	ff 75 f0             	push   -0x10(%ebp)
     4bb:	e8 3a 3a 00 00       	call   3efa <close>
     4c0:	83 c4 10             	add    $0x10,%esp
  fd = open("small", O_RDONLY);
     4c3:	83 ec 08             	sub    $0x8,%esp
     4c6:	6a 00                	push   $0x0
     4c8:	68 ad 45 00 00       	push   $0x45ad
     4cd:	e8 40 3a 00 00       	call   3f12 <open>
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     4d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     4dc:	78 3c                	js     51a <writetest+0x16c>
    printf(stdout, "open small succeeded ok\n");
     4de:	a1 b4 62 00 00       	mov    0x62b4,%eax
     4e3:	83 ec 08             	sub    $0x8,%esp
     4e6:	68 57 46 00 00       	push   $0x4657
     4eb:	50                   	push   %eax
     4ec:	e8 55 3b 00 00       	call   4046 <printf>
     4f1:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     4f4:	83 ec 04             	sub    $0x4,%esp
     4f7:	68 d0 07 00 00       	push   $0x7d0
     4fc:	68 e0 62 00 00       	push   $0x62e0
     501:	ff 75 f0             	push   -0x10(%ebp)
     504:	e8 e1 39 00 00       	call   3eea <read>
     509:	83 c4 10             	add    $0x10,%esp
     50c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     50f:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     516:	75 57                	jne    56f <writetest+0x1c1>
     518:	eb 1b                	jmp    535 <writetest+0x187>
    printf(stdout, "error: open small failed!\n");
     51a:	a1 b4 62 00 00       	mov    0x62b4,%eax
     51f:	83 ec 08             	sub    $0x8,%esp
     522:	68 70 46 00 00       	push   $0x4670
     527:	50                   	push   %eax
     528:	e8 19 3b 00 00       	call   4046 <printf>
     52d:	83 c4 10             	add    $0x10,%esp
    exit();
     530:	e8 9d 39 00 00       	call   3ed2 <exit>
    printf(stdout, "read succeeded ok\n");
     535:	a1 b4 62 00 00       	mov    0x62b4,%eax
     53a:	83 ec 08             	sub    $0x8,%esp
     53d:	68 8b 46 00 00       	push   $0x468b
     542:	50                   	push   %eax
     543:	e8 fe 3a 00 00       	call   4046 <printf>
     548:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     54b:	83 ec 0c             	sub    $0xc,%esp
     54e:	ff 75 f0             	push   -0x10(%ebp)
     551:	e8 a4 39 00 00       	call   3efa <close>
     556:	83 c4 10             	add    $0x10,%esp

  if(unlink("small") < 0){
     559:	83 ec 0c             	sub    $0xc,%esp
     55c:	68 ad 45 00 00       	push   $0x45ad
     561:	e8 bc 39 00 00       	call   3f22 <unlink>
     566:	83 c4 10             	add    $0x10,%esp
     569:	85 c0                	test   %eax,%eax
     56b:	79 38                	jns    5a5 <writetest+0x1f7>
     56d:	eb 1b                	jmp    58a <writetest+0x1dc>
    printf(stdout, "read failed\n");
     56f:	a1 b4 62 00 00       	mov    0x62b4,%eax
     574:	83 ec 08             	sub    $0x8,%esp
     577:	68 9e 46 00 00       	push   $0x469e
     57c:	50                   	push   %eax
     57d:	e8 c4 3a 00 00       	call   4046 <printf>
     582:	83 c4 10             	add    $0x10,%esp
    exit();
     585:	e8 48 39 00 00       	call   3ed2 <exit>
    printf(stdout, "unlink small failed\n");
     58a:	a1 b4 62 00 00       	mov    0x62b4,%eax
     58f:	83 ec 08             	sub    $0x8,%esp
     592:	68 ab 46 00 00       	push   $0x46ab
     597:	50                   	push   %eax
     598:	e8 a9 3a 00 00       	call   4046 <printf>
     59d:	83 c4 10             	add    $0x10,%esp
    exit();
     5a0:	e8 2d 39 00 00       	call   3ed2 <exit>
  }
  printf(stdout, "small file test ok\n");
     5a5:	a1 b4 62 00 00       	mov    0x62b4,%eax
     5aa:	83 ec 08             	sub    $0x8,%esp
     5ad:	68 c0 46 00 00       	push   $0x46c0
     5b2:	50                   	push   %eax
     5b3:	e8 8e 3a 00 00       	call   4046 <printf>
     5b8:	83 c4 10             	add    $0x10,%esp
}
     5bb:	90                   	nop
     5bc:	c9                   	leave
     5bd:	c3                   	ret

000005be <writetest1>:

void
writetest1(void)
{
     5be:	55                   	push   %ebp
     5bf:	89 e5                	mov    %esp,%ebp
     5c1:	83 ec 18             	sub    $0x18,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     5c4:	a1 b4 62 00 00       	mov    0x62b4,%eax
     5c9:	83 ec 08             	sub    $0x8,%esp
     5cc:	68 d4 46 00 00       	push   $0x46d4
     5d1:	50                   	push   %eax
     5d2:	e8 6f 3a 00 00       	call   4046 <printf>
     5d7:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_CREATE|O_RDWR);
     5da:	83 ec 08             	sub    $0x8,%esp
     5dd:	68 02 02 00 00       	push   $0x202
     5e2:	68 e4 46 00 00       	push   $0x46e4
     5e7:	e8 26 39 00 00       	call   3f12 <open>
     5ec:	83 c4 10             	add    $0x10,%esp
     5ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     5f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     5f6:	79 1b                	jns    613 <writetest1+0x55>
    printf(stdout, "error: creat big failed!\n");
     5f8:	a1 b4 62 00 00       	mov    0x62b4,%eax
     5fd:	83 ec 08             	sub    $0x8,%esp
     600:	68 e8 46 00 00       	push   $0x46e8
     605:	50                   	push   %eax
     606:	e8 3b 3a 00 00       	call   4046 <printf>
     60b:	83 c4 10             	add    $0x10,%esp
    exit();
     60e:	e8 bf 38 00 00       	call   3ed2 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     613:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     61a:	eb 4b                	jmp    667 <writetest1+0xa9>
    ((int*)buf)[0] = i;
     61c:	ba e0 62 00 00       	mov    $0x62e0,%edx
     621:	8b 45 f4             	mov    -0xc(%ebp),%eax
     624:	89 02                	mov    %eax,(%edx)
    if(write(fd, buf, 512) != 512){
     626:	83 ec 04             	sub    $0x4,%esp
     629:	68 00 02 00 00       	push   $0x200
     62e:	68 e0 62 00 00       	push   $0x62e0
     633:	ff 75 ec             	push   -0x14(%ebp)
     636:	e8 b7 38 00 00       	call   3ef2 <write>
     63b:	83 c4 10             	add    $0x10,%esp
     63e:	3d 00 02 00 00       	cmp    $0x200,%eax
     643:	74 1e                	je     663 <writetest1+0xa5>
      printf(stdout, "error: write big file failed\n", i);
     645:	a1 b4 62 00 00       	mov    0x62b4,%eax
     64a:	83 ec 04             	sub    $0x4,%esp
     64d:	ff 75 f4             	push   -0xc(%ebp)
     650:	68 02 47 00 00       	push   $0x4702
     655:	50                   	push   %eax
     656:	e8 eb 39 00 00       	call   4046 <printf>
     65b:	83 c4 10             	add    $0x10,%esp
      exit();
     65e:	e8 6f 38 00 00       	call   3ed2 <exit>
  for(i = 0; i < MAXFILE; i++){
     663:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     667:	8b 45 f4             	mov    -0xc(%ebp),%eax
     66a:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     66f:	76 ab                	jbe    61c <writetest1+0x5e>
    }
  }

  close(fd);
     671:	83 ec 0c             	sub    $0xc,%esp
     674:	ff 75 ec             	push   -0x14(%ebp)
     677:	e8 7e 38 00 00       	call   3efa <close>
     67c:	83 c4 10             	add    $0x10,%esp

  fd = open("big", O_RDONLY);
     67f:	83 ec 08             	sub    $0x8,%esp
     682:	6a 00                	push   $0x0
     684:	68 e4 46 00 00       	push   $0x46e4
     689:	e8 84 38 00 00       	call   3f12 <open>
     68e:	83 c4 10             	add    $0x10,%esp
     691:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     694:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     698:	79 1b                	jns    6b5 <writetest1+0xf7>
    printf(stdout, "error: open big failed!\n");
     69a:	a1 b4 62 00 00       	mov    0x62b4,%eax
     69f:	83 ec 08             	sub    $0x8,%esp
     6a2:	68 20 47 00 00       	push   $0x4720
     6a7:	50                   	push   %eax
     6a8:	e8 99 39 00 00       	call   4046 <printf>
     6ad:	83 c4 10             	add    $0x10,%esp
    exit();
     6b0:	e8 1d 38 00 00       	call   3ed2 <exit>
  }

  n = 0;
     6b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     6bc:	83 ec 04             	sub    $0x4,%esp
     6bf:	68 00 02 00 00       	push   $0x200
     6c4:	68 e0 62 00 00       	push   $0x62e0
     6c9:	ff 75 ec             	push   -0x14(%ebp)
     6cc:	e8 19 38 00 00       	call   3eea <read>
     6d1:	83 c4 10             	add    $0x10,%esp
     6d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     6d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     6db:	75 27                	jne    704 <writetest1+0x146>
      if(n == MAXFILE - 1){
     6dd:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     6e4:	75 7d                	jne    763 <writetest1+0x1a5>
        printf(stdout, "read only %d blocks from big", n);
     6e6:	a1 b4 62 00 00       	mov    0x62b4,%eax
     6eb:	83 ec 04             	sub    $0x4,%esp
     6ee:	ff 75 f0             	push   -0x10(%ebp)
     6f1:	68 39 47 00 00       	push   $0x4739
     6f6:	50                   	push   %eax
     6f7:	e8 4a 39 00 00       	call   4046 <printf>
     6fc:	83 c4 10             	add    $0x10,%esp
        exit();
     6ff:	e8 ce 37 00 00       	call   3ed2 <exit>
      }
      break;
    } else if(i != 512){
     704:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     70b:	74 1e                	je     72b <writetest1+0x16d>
      printf(stdout, "read failed %d\n", i);
     70d:	a1 b4 62 00 00       	mov    0x62b4,%eax
     712:	83 ec 04             	sub    $0x4,%esp
     715:	ff 75 f4             	push   -0xc(%ebp)
     718:	68 56 47 00 00       	push   $0x4756
     71d:	50                   	push   %eax
     71e:	e8 23 39 00 00       	call   4046 <printf>
     723:	83 c4 10             	add    $0x10,%esp
      exit();
     726:	e8 a7 37 00 00       	call   3ed2 <exit>
    }
    if(((int*)buf)[0] != n){
     72b:	b8 e0 62 00 00       	mov    $0x62e0,%eax
     730:	8b 00                	mov    (%eax),%eax
     732:	39 45 f0             	cmp    %eax,-0x10(%ebp)
     735:	74 23                	je     75a <writetest1+0x19c>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     737:	b8 e0 62 00 00       	mov    $0x62e0,%eax
      printf(stdout, "read content of block %d is %d\n",
     73c:	8b 10                	mov    (%eax),%edx
     73e:	a1 b4 62 00 00       	mov    0x62b4,%eax
     743:	52                   	push   %edx
     744:	ff 75 f0             	push   -0x10(%ebp)
     747:	68 68 47 00 00       	push   $0x4768
     74c:	50                   	push   %eax
     74d:	e8 f4 38 00 00       	call   4046 <printf>
     752:	83 c4 10             	add    $0x10,%esp
      exit();
     755:	e8 78 37 00 00       	call   3ed2 <exit>
    }
    n++;
     75a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    i = read(fd, buf, 512);
     75e:	e9 59 ff ff ff       	jmp    6bc <writetest1+0xfe>
      break;
     763:	90                   	nop
  }
  close(fd);
     764:	83 ec 0c             	sub    $0xc,%esp
     767:	ff 75 ec             	push   -0x14(%ebp)
     76a:	e8 8b 37 00 00       	call   3efa <close>
     76f:	83 c4 10             	add    $0x10,%esp
  if(unlink("big") < 0){
     772:	83 ec 0c             	sub    $0xc,%esp
     775:	68 e4 46 00 00       	push   $0x46e4
     77a:	e8 a3 37 00 00       	call   3f22 <unlink>
     77f:	83 c4 10             	add    $0x10,%esp
     782:	85 c0                	test   %eax,%eax
     784:	79 1b                	jns    7a1 <writetest1+0x1e3>
    printf(stdout, "unlink big failed\n");
     786:	a1 b4 62 00 00       	mov    0x62b4,%eax
     78b:	83 ec 08             	sub    $0x8,%esp
     78e:	68 88 47 00 00       	push   $0x4788
     793:	50                   	push   %eax
     794:	e8 ad 38 00 00       	call   4046 <printf>
     799:	83 c4 10             	add    $0x10,%esp
    exit();
     79c:	e8 31 37 00 00       	call   3ed2 <exit>
  }
  printf(stdout, "big files ok\n");
     7a1:	a1 b4 62 00 00       	mov    0x62b4,%eax
     7a6:	83 ec 08             	sub    $0x8,%esp
     7a9:	68 9b 47 00 00       	push   $0x479b
     7ae:	50                   	push   %eax
     7af:	e8 92 38 00 00       	call   4046 <printf>
     7b4:	83 c4 10             	add    $0x10,%esp
}
     7b7:	90                   	nop
     7b8:	c9                   	leave
     7b9:	c3                   	ret

000007ba <createtest>:

void
createtest(void)
{
     7ba:	55                   	push   %ebp
     7bb:	89 e5                	mov    %esp,%ebp
     7bd:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     7c0:	a1 b4 62 00 00       	mov    0x62b4,%eax
     7c5:	83 ec 08             	sub    $0x8,%esp
     7c8:	68 ac 47 00 00       	push   $0x47ac
     7cd:	50                   	push   %eax
     7ce:	e8 73 38 00 00       	call   4046 <printf>
     7d3:	83 c4 10             	add    $0x10,%esp

  name[0] = 'a';
     7d6:	c6 05 e0 82 00 00 61 	movb   $0x61,0x82e0
  name[2] = '\0';
     7dd:	c6 05 e2 82 00 00 00 	movb   $0x0,0x82e2
  for(i = 0; i < 52; i++){
     7e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     7eb:	eb 35                	jmp    822 <createtest+0x68>
    name[1] = '0' + i;
     7ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7f0:	83 c0 30             	add    $0x30,%eax
     7f3:	a2 e1 82 00 00       	mov    %al,0x82e1
    fd = open(name, O_CREATE|O_RDWR);
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 02 02 00 00       	push   $0x202
     800:	68 e0 82 00 00       	push   $0x82e0
     805:	e8 08 37 00 00       	call   3f12 <open>
     80a:	83 c4 10             	add    $0x10,%esp
     80d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     810:	83 ec 0c             	sub    $0xc,%esp
     813:	ff 75 f0             	push   -0x10(%ebp)
     816:	e8 df 36 00 00       	call   3efa <close>
     81b:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 52; i++){
     81e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     822:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     826:	7e c5                	jle    7ed <createtest+0x33>
  }
  name[0] = 'a';
     828:	c6 05 e0 82 00 00 61 	movb   $0x61,0x82e0
  name[2] = '\0';
     82f:	c6 05 e2 82 00 00 00 	movb   $0x0,0x82e2
  for(i = 0; i < 52; i++){
     836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     83d:	eb 1f                	jmp    85e <createtest+0xa4>
    name[1] = '0' + i;
     83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     842:	83 c0 30             	add    $0x30,%eax
     845:	a2 e1 82 00 00       	mov    %al,0x82e1
    unlink(name);
     84a:	83 ec 0c             	sub    $0xc,%esp
     84d:	68 e0 82 00 00       	push   $0x82e0
     852:	e8 cb 36 00 00       	call   3f22 <unlink>
     857:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 52; i++){
     85a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     85e:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     862:	7e db                	jle    83f <createtest+0x85>
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     864:	a1 b4 62 00 00       	mov    0x62b4,%eax
     869:	83 ec 08             	sub    $0x8,%esp
     86c:	68 d4 47 00 00       	push   $0x47d4
     871:	50                   	push   %eax
     872:	e8 cf 37 00 00       	call   4046 <printf>
     877:	83 c4 10             	add    $0x10,%esp
}
     87a:	90                   	nop
     87b:	c9                   	leave
     87c:	c3                   	ret

0000087d <dirtest>:

void dirtest(void)
{
     87d:	55                   	push   %ebp
     87e:	89 e5                	mov    %esp,%ebp
     880:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "mkdir test\n");
     883:	a1 b4 62 00 00       	mov    0x62b4,%eax
     888:	83 ec 08             	sub    $0x8,%esp
     88b:	68 fa 47 00 00       	push   $0x47fa
     890:	50                   	push   %eax
     891:	e8 b0 37 00 00       	call   4046 <printf>
     896:	83 c4 10             	add    $0x10,%esp

  if(mkdir("dir0") < 0){
     899:	83 ec 0c             	sub    $0xc,%esp
     89c:	68 06 48 00 00       	push   $0x4806
     8a1:	e8 94 36 00 00       	call   3f3a <mkdir>
     8a6:	83 c4 10             	add    $0x10,%esp
     8a9:	85 c0                	test   %eax,%eax
     8ab:	79 1b                	jns    8c8 <dirtest+0x4b>
    printf(stdout, "mkdir failed\n");
     8ad:	a1 b4 62 00 00       	mov    0x62b4,%eax
     8b2:	83 ec 08             	sub    $0x8,%esp
     8b5:	68 29 44 00 00       	push   $0x4429
     8ba:	50                   	push   %eax
     8bb:	e8 86 37 00 00       	call   4046 <printf>
     8c0:	83 c4 10             	add    $0x10,%esp
    exit();
     8c3:	e8 0a 36 00 00       	call   3ed2 <exit>
  }

  if(chdir("dir0") < 0){
     8c8:	83 ec 0c             	sub    $0xc,%esp
     8cb:	68 06 48 00 00       	push   $0x4806
     8d0:	e8 6d 36 00 00       	call   3f42 <chdir>
     8d5:	83 c4 10             	add    $0x10,%esp
     8d8:	85 c0                	test   %eax,%eax
     8da:	79 1b                	jns    8f7 <dirtest+0x7a>
    printf(stdout, "chdir dir0 failed\n");
     8dc:	a1 b4 62 00 00       	mov    0x62b4,%eax
     8e1:	83 ec 08             	sub    $0x8,%esp
     8e4:	68 0b 48 00 00       	push   $0x480b
     8e9:	50                   	push   %eax
     8ea:	e8 57 37 00 00       	call   4046 <printf>
     8ef:	83 c4 10             	add    $0x10,%esp
    exit();
     8f2:	e8 db 35 00 00       	call   3ed2 <exit>
  }

  if(chdir("..") < 0){
     8f7:	83 ec 0c             	sub    $0xc,%esp
     8fa:	68 1e 48 00 00       	push   $0x481e
     8ff:	e8 3e 36 00 00       	call   3f42 <chdir>
     904:	83 c4 10             	add    $0x10,%esp
     907:	85 c0                	test   %eax,%eax
     909:	79 1b                	jns    926 <dirtest+0xa9>
    printf(stdout, "chdir .. failed\n");
     90b:	a1 b4 62 00 00       	mov    0x62b4,%eax
     910:	83 ec 08             	sub    $0x8,%esp
     913:	68 21 48 00 00       	push   $0x4821
     918:	50                   	push   %eax
     919:	e8 28 37 00 00       	call   4046 <printf>
     91e:	83 c4 10             	add    $0x10,%esp
    exit();
     921:	e8 ac 35 00 00       	call   3ed2 <exit>
  }

  if(unlink("dir0") < 0){
     926:	83 ec 0c             	sub    $0xc,%esp
     929:	68 06 48 00 00       	push   $0x4806
     92e:	e8 ef 35 00 00       	call   3f22 <unlink>
     933:	83 c4 10             	add    $0x10,%esp
     936:	85 c0                	test   %eax,%eax
     938:	79 1b                	jns    955 <dirtest+0xd8>
    printf(stdout, "unlink dir0 failed\n");
     93a:	a1 b4 62 00 00       	mov    0x62b4,%eax
     93f:	83 ec 08             	sub    $0x8,%esp
     942:	68 32 48 00 00       	push   $0x4832
     947:	50                   	push   %eax
     948:	e8 f9 36 00 00       	call   4046 <printf>
     94d:	83 c4 10             	add    $0x10,%esp
    exit();
     950:	e8 7d 35 00 00       	call   3ed2 <exit>
  }
  printf(stdout, "mkdir test ok\n");
     955:	a1 b4 62 00 00       	mov    0x62b4,%eax
     95a:	83 ec 08             	sub    $0x8,%esp
     95d:	68 46 48 00 00       	push   $0x4846
     962:	50                   	push   %eax
     963:	e8 de 36 00 00       	call   4046 <printf>
     968:	83 c4 10             	add    $0x10,%esp
}
     96b:	90                   	nop
     96c:	c9                   	leave
     96d:	c3                   	ret

0000096e <exectest>:

void
exectest(void)
{
     96e:	55                   	push   %ebp
     96f:	89 e5                	mov    %esp,%ebp
     971:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "exec test\n");
     974:	a1 b4 62 00 00       	mov    0x62b4,%eax
     979:	83 ec 08             	sub    $0x8,%esp
     97c:	68 55 48 00 00       	push   $0x4855
     981:	50                   	push   %eax
     982:	e8 bf 36 00 00       	call   4046 <printf>
     987:	83 c4 10             	add    $0x10,%esp
  if(exec("echo", echoargv) < 0){
     98a:	83 ec 08             	sub    $0x8,%esp
     98d:	68 a0 62 00 00       	push   $0x62a0
     992:	68 00 44 00 00       	push   $0x4400
     997:	e8 6e 35 00 00       	call   3f0a <exec>
     99c:	83 c4 10             	add    $0x10,%esp
     99f:	85 c0                	test   %eax,%eax
     9a1:	79 1b                	jns    9be <exectest+0x50>
    printf(stdout, "exec echo failed\n");
     9a3:	a1 b4 62 00 00       	mov    0x62b4,%eax
     9a8:	83 ec 08             	sub    $0x8,%esp
     9ab:	68 60 48 00 00       	push   $0x4860
     9b0:	50                   	push   %eax
     9b1:	e8 90 36 00 00       	call   4046 <printf>
     9b6:	83 c4 10             	add    $0x10,%esp
    exit();
     9b9:	e8 14 35 00 00       	call   3ed2 <exit>
  }
}
     9be:	90                   	nop
     9bf:	c9                   	leave
     9c0:	c3                   	ret

000009c1 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     9c1:	55                   	push   %ebp
     9c2:	89 e5                	mov    %esp,%ebp
     9c4:	83 ec 28             	sub    $0x28,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     9c7:	83 ec 0c             	sub    $0xc,%esp
     9ca:	8d 45 d8             	lea    -0x28(%ebp),%eax
     9cd:	50                   	push   %eax
     9ce:	e8 0f 35 00 00       	call   3ee2 <pipe>
     9d3:	83 c4 10             	add    $0x10,%esp
     9d6:	85 c0                	test   %eax,%eax
     9d8:	74 17                	je     9f1 <pipe1+0x30>
    printf(1, "pipe() failed\n");
     9da:	83 ec 08             	sub    $0x8,%esp
     9dd:	68 72 48 00 00       	push   $0x4872
     9e2:	6a 01                	push   $0x1
     9e4:	e8 5d 36 00 00       	call   4046 <printf>
     9e9:	83 c4 10             	add    $0x10,%esp
    exit();
     9ec:	e8 e1 34 00 00       	call   3ed2 <exit>
  }
  pid = fork();
     9f1:	e8 d4 34 00 00       	call   3eca <fork>
     9f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     9f9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     a00:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     a04:	0f 85 89 00 00 00    	jne    a93 <pipe1+0xd2>
    close(fds[0]);
     a0a:	8b 45 d8             	mov    -0x28(%ebp),%eax
     a0d:	83 ec 0c             	sub    $0xc,%esp
     a10:	50                   	push   %eax
     a11:	e8 e4 34 00 00       	call   3efa <close>
     a16:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
     a19:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     a20:	eb 66                	jmp    a88 <pipe1+0xc7>
      for(i = 0; i < 1033; i++)
     a22:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     a29:	eb 19                	jmp    a44 <pipe1+0x83>
        buf[i] = seq++;
     a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a2e:	8d 50 01             	lea    0x1(%eax),%edx
     a31:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a34:	89 c2                	mov    %eax,%edx
     a36:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a39:	05 e0 62 00 00       	add    $0x62e0,%eax
     a3e:	88 10                	mov    %dl,(%eax)
      for(i = 0; i < 1033; i++)
     a40:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     a44:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     a4b:	7e de                	jle    a2b <pipe1+0x6a>
      if(write(fds[1], buf, 1033) != 1033){
     a4d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     a50:	83 ec 04             	sub    $0x4,%esp
     a53:	68 09 04 00 00       	push   $0x409
     a58:	68 e0 62 00 00       	push   $0x62e0
     a5d:	50                   	push   %eax
     a5e:	e8 8f 34 00 00       	call   3ef2 <write>
     a63:	83 c4 10             	add    $0x10,%esp
     a66:	3d 09 04 00 00       	cmp    $0x409,%eax
     a6b:	74 17                	je     a84 <pipe1+0xc3>
        printf(1, "pipe1 oops 1\n");
     a6d:	83 ec 08             	sub    $0x8,%esp
     a70:	68 81 48 00 00       	push   $0x4881
     a75:	6a 01                	push   $0x1
     a77:	e8 ca 35 00 00       	call   4046 <printf>
     a7c:	83 c4 10             	add    $0x10,%esp
        exit();
     a7f:	e8 4e 34 00 00       	call   3ed2 <exit>
    for(n = 0; n < 5; n++){
     a84:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     a88:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     a8c:	7e 94                	jle    a22 <pipe1+0x61>
      }
    }
    exit();
     a8e:	e8 3f 34 00 00       	call   3ed2 <exit>
  } else if(pid > 0){
     a93:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     a97:	0f 8e f4 00 00 00    	jle    b91 <pipe1+0x1d0>
    close(fds[1]);
     a9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     aa0:	83 ec 0c             	sub    $0xc,%esp
     aa3:	50                   	push   %eax
     aa4:	e8 51 34 00 00       	call   3efa <close>
     aa9:	83 c4 10             	add    $0x10,%esp
    total = 0;
     aac:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     ab3:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     aba:	eb 66                	jmp    b22 <pipe1+0x161>
      for(i = 0; i < n; i++){
     abc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ac3:	eb 3b                	jmp    b00 <pipe1+0x13f>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     ac5:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ac8:	05 e0 62 00 00       	add    $0x62e0,%eax
     acd:	0f b6 00             	movzbl (%eax),%eax
     ad0:	0f be c8             	movsbl %al,%ecx
     ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad6:	8d 50 01             	lea    0x1(%eax),%edx
     ad9:	89 55 f4             	mov    %edx,-0xc(%ebp)
     adc:	31 c8                	xor    %ecx,%eax
     ade:	0f b6 c0             	movzbl %al,%eax
     ae1:	85 c0                	test   %eax,%eax
     ae3:	74 17                	je     afc <pipe1+0x13b>
          printf(1, "pipe1 oops 2\n");
     ae5:	83 ec 08             	sub    $0x8,%esp
     ae8:	68 8f 48 00 00       	push   $0x488f
     aed:	6a 01                	push   $0x1
     aef:	e8 52 35 00 00       	call   4046 <printf>
     af4:	83 c4 10             	add    $0x10,%esp
     af7:	e9 ac 00 00 00       	jmp    ba8 <pipe1+0x1e7>
      for(i = 0; i < n; i++){
     afc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b03:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     b06:	7c bd                	jl     ac5 <pipe1+0x104>
          return;
        }
      }
      total += n;
     b08:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b0b:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     b0e:	d1 65 e8             	shll   $1,-0x18(%ebp)
      if(cc > sizeof(buf))
     b11:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b14:	3d 00 20 00 00       	cmp    $0x2000,%eax
     b19:	76 07                	jbe    b22 <pipe1+0x161>
        cc = sizeof(buf);
     b1b:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     b22:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b25:	83 ec 04             	sub    $0x4,%esp
     b28:	ff 75 e8             	push   -0x18(%ebp)
     b2b:	68 e0 62 00 00       	push   $0x62e0
     b30:	50                   	push   %eax
     b31:	e8 b4 33 00 00       	call   3eea <read>
     b36:	83 c4 10             	add    $0x10,%esp
     b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
     b3c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     b40:	0f 8f 76 ff ff ff    	jg     abc <pipe1+0xfb>
    }
    if(total != 5 * 1033){
     b46:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     b4d:	74 1a                	je     b69 <pipe1+0x1a8>
      printf(1, "pipe1 oops 3 total %d\n", total);
     b4f:	83 ec 04             	sub    $0x4,%esp
     b52:	ff 75 e4             	push   -0x1c(%ebp)
     b55:	68 9d 48 00 00       	push   $0x489d
     b5a:	6a 01                	push   $0x1
     b5c:	e8 e5 34 00 00       	call   4046 <printf>
     b61:	83 c4 10             	add    $0x10,%esp
      exit();
     b64:	e8 69 33 00 00       	call   3ed2 <exit>
    }
    close(fds[0]);
     b69:	8b 45 d8             	mov    -0x28(%ebp),%eax
     b6c:	83 ec 0c             	sub    $0xc,%esp
     b6f:	50                   	push   %eax
     b70:	e8 85 33 00 00       	call   3efa <close>
     b75:	83 c4 10             	add    $0x10,%esp
    wait();
     b78:	e8 5d 33 00 00       	call   3eda <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b7d:	83 ec 08             	sub    $0x8,%esp
     b80:	68 c3 48 00 00       	push   $0x48c3
     b85:	6a 01                	push   $0x1
     b87:	e8 ba 34 00 00       	call   4046 <printf>
     b8c:	83 c4 10             	add    $0x10,%esp
     b8f:	eb 17                	jmp    ba8 <pipe1+0x1e7>
    printf(1, "fork() failed\n");
     b91:	83 ec 08             	sub    $0x8,%esp
     b94:	68 b4 48 00 00       	push   $0x48b4
     b99:	6a 01                	push   $0x1
     b9b:	e8 a6 34 00 00       	call   4046 <printf>
     ba0:	83 c4 10             	add    $0x10,%esp
    exit();
     ba3:	e8 2a 33 00 00       	call   3ed2 <exit>
}
     ba8:	c9                   	leave
     ba9:	c3                   	ret

00000baa <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     baa:	55                   	push   %ebp
     bab:	89 e5                	mov    %esp,%ebp
     bad:	83 ec 28             	sub    $0x28,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     bb0:	83 ec 08             	sub    $0x8,%esp
     bb3:	68 cd 48 00 00       	push   $0x48cd
     bb8:	6a 01                	push   $0x1
     bba:	e8 87 34 00 00       	call   4046 <printf>
     bbf:	83 c4 10             	add    $0x10,%esp
  pid1 = fork();
     bc2:	e8 03 33 00 00       	call   3eca <fork>
     bc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     bca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     bce:	75 03                	jne    bd3 <preempt+0x29>
    for(;;)
     bd0:	90                   	nop
     bd1:	eb fd                	jmp    bd0 <preempt+0x26>
      ;

  pid2 = fork();
     bd3:	e8 f2 32 00 00       	call   3eca <fork>
     bd8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     bdb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     bdf:	75 03                	jne    be4 <preempt+0x3a>
    for(;;)
     be1:	90                   	nop
     be2:	eb fd                	jmp    be1 <preempt+0x37>
      ;

  pipe(pfds);
     be4:	83 ec 0c             	sub    $0xc,%esp
     be7:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     bea:	50                   	push   %eax
     beb:	e8 f2 32 00 00       	call   3ee2 <pipe>
     bf0:	83 c4 10             	add    $0x10,%esp
  pid3 = fork();
     bf3:	e8 d2 32 00 00       	call   3eca <fork>
     bf8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     bfb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     bff:	75 4e                	jne    c4f <preempt+0xa5>
    close(pfds[0]);
     c01:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c04:	83 ec 0c             	sub    $0xc,%esp
     c07:	50                   	push   %eax
     c08:	e8 ed 32 00 00       	call   3efa <close>
     c0d:	83 c4 10             	add    $0x10,%esp
    if(write(pfds[1], "x", 1) != 1)
     c10:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c13:	83 ec 04             	sub    $0x4,%esp
     c16:	6a 01                	push   $0x1
     c18:	68 d7 48 00 00       	push   $0x48d7
     c1d:	50                   	push   %eax
     c1e:	e8 cf 32 00 00       	call   3ef2 <write>
     c23:	83 c4 10             	add    $0x10,%esp
     c26:	83 f8 01             	cmp    $0x1,%eax
     c29:	74 12                	je     c3d <preempt+0x93>
      printf(1, "preempt write error");
     c2b:	83 ec 08             	sub    $0x8,%esp
     c2e:	68 d9 48 00 00       	push   $0x48d9
     c33:	6a 01                	push   $0x1
     c35:	e8 0c 34 00 00       	call   4046 <printf>
     c3a:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c40:	83 ec 0c             	sub    $0xc,%esp
     c43:	50                   	push   %eax
     c44:	e8 b1 32 00 00       	call   3efa <close>
     c49:	83 c4 10             	add    $0x10,%esp
    for(;;)
     c4c:	90                   	nop
     c4d:	eb fd                	jmp    c4c <preempt+0xa2>
      ;
  }

  close(pfds[1]);
     c4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c52:	83 ec 0c             	sub    $0xc,%esp
     c55:	50                   	push   %eax
     c56:	e8 9f 32 00 00       	call   3efa <close>
     c5b:	83 c4 10             	add    $0x10,%esp
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c5e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c61:	83 ec 04             	sub    $0x4,%esp
     c64:	68 00 20 00 00       	push   $0x2000
     c69:	68 e0 62 00 00       	push   $0x62e0
     c6e:	50                   	push   %eax
     c6f:	e8 76 32 00 00       	call   3eea <read>
     c74:	83 c4 10             	add    $0x10,%esp
     c77:	83 f8 01             	cmp    $0x1,%eax
     c7a:	74 14                	je     c90 <preempt+0xe6>
    printf(1, "preempt read error");
     c7c:	83 ec 08             	sub    $0x8,%esp
     c7f:	68 ed 48 00 00       	push   $0x48ed
     c84:	6a 01                	push   $0x1
     c86:	e8 bb 33 00 00       	call   4046 <printf>
     c8b:	83 c4 10             	add    $0x10,%esp
     c8e:	eb 7e                	jmp    d0e <preempt+0x164>
    return;
  }
  close(pfds[0]);
     c90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c93:	83 ec 0c             	sub    $0xc,%esp
     c96:	50                   	push   %eax
     c97:	e8 5e 32 00 00       	call   3efa <close>
     c9c:	83 c4 10             	add    $0x10,%esp
  printf(1, "kill... ");
     c9f:	83 ec 08             	sub    $0x8,%esp
     ca2:	68 00 49 00 00       	push   $0x4900
     ca7:	6a 01                	push   $0x1
     ca9:	e8 98 33 00 00       	call   4046 <printf>
     cae:	83 c4 10             	add    $0x10,%esp
  kill(pid1);
     cb1:	83 ec 0c             	sub    $0xc,%esp
     cb4:	ff 75 f4             	push   -0xc(%ebp)
     cb7:	e8 46 32 00 00       	call   3f02 <kill>
     cbc:	83 c4 10             	add    $0x10,%esp
  kill(pid2);
     cbf:	83 ec 0c             	sub    $0xc,%esp
     cc2:	ff 75 f0             	push   -0x10(%ebp)
     cc5:	e8 38 32 00 00       	call   3f02 <kill>
     cca:	83 c4 10             	add    $0x10,%esp
  kill(pid3);
     ccd:	83 ec 0c             	sub    $0xc,%esp
     cd0:	ff 75 ec             	push   -0x14(%ebp)
     cd3:	e8 2a 32 00 00       	call   3f02 <kill>
     cd8:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
     cdb:	83 ec 08             	sub    $0x8,%esp
     cde:	68 09 49 00 00       	push   $0x4909
     ce3:	6a 01                	push   $0x1
     ce5:	e8 5c 33 00 00       	call   4046 <printf>
     cea:	83 c4 10             	add    $0x10,%esp
  wait();
     ced:	e8 e8 31 00 00       	call   3eda <wait>
  wait();
     cf2:	e8 e3 31 00 00       	call   3eda <wait>
  wait();
     cf7:	e8 de 31 00 00       	call   3eda <wait>
  printf(1, "preempt ok\n");
     cfc:	83 ec 08             	sub    $0x8,%esp
     cff:	68 12 49 00 00       	push   $0x4912
     d04:	6a 01                	push   $0x1
     d06:	e8 3b 33 00 00       	call   4046 <printf>
     d0b:	83 c4 10             	add    $0x10,%esp
}
     d0e:	c9                   	leave
     d0f:	c3                   	ret

00000d10 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	83 ec 18             	sub    $0x18,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     d16:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d1d:	eb 4f                	jmp    d6e <exitwait+0x5e>
    pid = fork();
     d1f:	e8 a6 31 00 00       	call   3eca <fork>
     d24:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     d27:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d2b:	79 14                	jns    d41 <exitwait+0x31>
      printf(1, "fork failed\n");
     d2d:	83 ec 08             	sub    $0x8,%esp
     d30:	68 a1 44 00 00       	push   $0x44a1
     d35:	6a 01                	push   $0x1
     d37:	e8 0a 33 00 00       	call   4046 <printf>
     d3c:	83 c4 10             	add    $0x10,%esp
      return;
     d3f:	eb 45                	jmp    d86 <exitwait+0x76>
    }
    if(pid){
     d41:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     d45:	74 1e                	je     d65 <exitwait+0x55>
      if(wait() != pid){
     d47:	e8 8e 31 00 00       	call   3eda <wait>
     d4c:	39 45 f0             	cmp    %eax,-0x10(%ebp)
     d4f:	74 19                	je     d6a <exitwait+0x5a>
        printf(1, "wait wrong pid\n");
     d51:	83 ec 08             	sub    $0x8,%esp
     d54:	68 1e 49 00 00       	push   $0x491e
     d59:	6a 01                	push   $0x1
     d5b:	e8 e6 32 00 00       	call   4046 <printf>
     d60:	83 c4 10             	add    $0x10,%esp
        return;
     d63:	eb 21                	jmp    d86 <exitwait+0x76>
      }
    } else {
      exit();
     d65:	e8 68 31 00 00       	call   3ed2 <exit>
  for(i = 0; i < 100; i++){
     d6a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     d6e:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     d72:	7e ab                	jle    d1f <exitwait+0xf>
    }
  }
  printf(1, "exitwait ok\n");
     d74:	83 ec 08             	sub    $0x8,%esp
     d77:	68 2e 49 00 00       	push   $0x492e
     d7c:	6a 01                	push   $0x1
     d7e:	e8 c3 32 00 00       	call   4046 <printf>
     d83:	83 c4 10             	add    $0x10,%esp
}
     d86:	c9                   	leave
     d87:	c3                   	ret

00000d88 <mem>:

void
mem(void)
{
     d88:	55                   	push   %ebp
     d89:	89 e5                	mov    %esp,%ebp
     d8b:	83 ec 18             	sub    $0x18,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d8e:	83 ec 08             	sub    $0x8,%esp
     d91:	68 3b 49 00 00       	push   $0x493b
     d96:	6a 01                	push   $0x1
     d98:	e8 a9 32 00 00       	call   4046 <printf>
     d9d:	83 c4 10             	add    $0x10,%esp
  ppid = getpid();
     da0:	e8 ad 31 00 00       	call   3f52 <getpid>
     da5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     da8:	e8 1d 31 00 00       	call   3eca <fork>
     dad:	89 45 ec             	mov    %eax,-0x14(%ebp)
     db0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     db4:	0f 85 b7 00 00 00    	jne    e71 <mem+0xe9>
    m1 = 0;
     dba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     dc1:	eb 0e                	jmp    dd1 <mem+0x49>
      *(char**)m2 = m1;
     dc3:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dc6:	8b 55 f4             	mov    -0xc(%ebp),%edx
     dc9:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     dcb:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dce:	89 45 f4             	mov    %eax,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     dd1:	83 ec 0c             	sub    $0xc,%esp
     dd4:	68 11 27 00 00       	push   $0x2711
     dd9:	e8 3c 35 00 00       	call   431a <malloc>
     dde:	83 c4 10             	add    $0x10,%esp
     de1:	89 45 e8             	mov    %eax,-0x18(%ebp)
     de4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     de8:	75 d9                	jne    dc3 <mem+0x3b>
    }
    while(m1){
     dea:	eb 1c                	jmp    e08 <mem+0x80>
      m2 = *(char**)m1;
     dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
     def:	8b 00                	mov    (%eax),%eax
     df1:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     df4:	83 ec 0c             	sub    $0xc,%esp
     df7:	ff 75 f4             	push   -0xc(%ebp)
     dfa:	e8 d9 33 00 00       	call   41d8 <free>
     dff:	83 c4 10             	add    $0x10,%esp
      m1 = m2;
     e02:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e05:	89 45 f4             	mov    %eax,-0xc(%ebp)
    while(m1){
     e08:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e0c:	75 de                	jne    dec <mem+0x64>
    }
    m1 = malloc(1024*20);
     e0e:	83 ec 0c             	sub    $0xc,%esp
     e11:	68 00 50 00 00       	push   $0x5000
     e16:	e8 ff 34 00 00       	call   431a <malloc>
     e1b:	83 c4 10             	add    $0x10,%esp
     e1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     e21:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e25:	75 25                	jne    e4c <mem+0xc4>
      printf(1, "couldn't allocate mem?!!\n");
     e27:	83 ec 08             	sub    $0x8,%esp
     e2a:	68 45 49 00 00       	push   $0x4945
     e2f:	6a 01                	push   $0x1
     e31:	e8 10 32 00 00       	call   4046 <printf>
     e36:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
     e39:	83 ec 0c             	sub    $0xc,%esp
     e3c:	ff 75 f0             	push   -0x10(%ebp)
     e3f:	e8 be 30 00 00       	call   3f02 <kill>
     e44:	83 c4 10             	add    $0x10,%esp
      exit();
     e47:	e8 86 30 00 00       	call   3ed2 <exit>
    }
    free(m1);
     e4c:	83 ec 0c             	sub    $0xc,%esp
     e4f:	ff 75 f4             	push   -0xc(%ebp)
     e52:	e8 81 33 00 00       	call   41d8 <free>
     e57:	83 c4 10             	add    $0x10,%esp
    printf(1, "mem ok\n");
     e5a:	83 ec 08             	sub    $0x8,%esp
     e5d:	68 5f 49 00 00       	push   $0x495f
     e62:	6a 01                	push   $0x1
     e64:	e8 dd 31 00 00       	call   4046 <printf>
     e69:	83 c4 10             	add    $0x10,%esp
    exit();
     e6c:	e8 61 30 00 00       	call   3ed2 <exit>
  } else {
    wait();
     e71:	e8 64 30 00 00       	call   3eda <wait>
  }
}
     e76:	90                   	nop
     e77:	c9                   	leave
     e78:	c3                   	ret

00000e79 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e79:	55                   	push   %ebp
     e7a:	89 e5                	mov    %esp,%ebp
     e7c:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e7f:	83 ec 08             	sub    $0x8,%esp
     e82:	68 67 49 00 00       	push   $0x4967
     e87:	6a 01                	push   $0x1
     e89:	e8 b8 31 00 00       	call   4046 <printf>
     e8e:	83 c4 10             	add    $0x10,%esp

  unlink("sharedfd");
     e91:	83 ec 0c             	sub    $0xc,%esp
     e94:	68 76 49 00 00       	push   $0x4976
     e99:	e8 84 30 00 00       	call   3f22 <unlink>
     e9e:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", O_CREATE|O_RDWR);
     ea1:	83 ec 08             	sub    $0x8,%esp
     ea4:	68 02 02 00 00       	push   $0x202
     ea9:	68 76 49 00 00       	push   $0x4976
     eae:	e8 5f 30 00 00       	call   3f12 <open>
     eb3:	83 c4 10             	add    $0x10,%esp
     eb6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     eb9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     ebd:	79 17                	jns    ed6 <sharedfd+0x5d>
    printf(1, "fstests: cannot open sharedfd for writing");
     ebf:	83 ec 08             	sub    $0x8,%esp
     ec2:	68 80 49 00 00       	push   $0x4980
     ec7:	6a 01                	push   $0x1
     ec9:	e8 78 31 00 00       	call   4046 <printf>
     ece:	83 c4 10             	add    $0x10,%esp
    return;
     ed1:	e9 84 01 00 00       	jmp    105a <sharedfd+0x1e1>
  }
  pid = fork();
     ed6:	e8 ef 2f 00 00       	call   3eca <fork>
     edb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ede:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     ee2:	75 07                	jne    eeb <sharedfd+0x72>
     ee4:	b8 63 00 00 00       	mov    $0x63,%eax
     ee9:	eb 05                	jmp    ef0 <sharedfd+0x77>
     eeb:	b8 70 00 00 00       	mov    $0x70,%eax
     ef0:	83 ec 04             	sub    $0x4,%esp
     ef3:	6a 0a                	push   $0xa
     ef5:	50                   	push   %eax
     ef6:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     ef9:	50                   	push   %eax
     efa:	e8 38 2e 00 00       	call   3d37 <memset>
     eff:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 1000; i++){
     f02:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f09:	eb 31                	jmp    f3c <sharedfd+0xc3>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     f0b:	83 ec 04             	sub    $0x4,%esp
     f0e:	6a 0a                	push   $0xa
     f10:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     f13:	50                   	push   %eax
     f14:	ff 75 e8             	push   -0x18(%ebp)
     f17:	e8 d6 2f 00 00       	call   3ef2 <write>
     f1c:	83 c4 10             	add    $0x10,%esp
     f1f:	83 f8 0a             	cmp    $0xa,%eax
     f22:	74 14                	je     f38 <sharedfd+0xbf>
      printf(1, "fstests: write sharedfd failed\n");
     f24:	83 ec 08             	sub    $0x8,%esp
     f27:	68 ac 49 00 00       	push   $0x49ac
     f2c:	6a 01                	push   $0x1
     f2e:	e8 13 31 00 00       	call   4046 <printf>
     f33:	83 c4 10             	add    $0x10,%esp
      break;
     f36:	eb 0d                	jmp    f45 <sharedfd+0xcc>
  for(i = 0; i < 1000; i++){
     f38:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f3c:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     f43:	7e c6                	jle    f0b <sharedfd+0x92>
    }
  }
  if(pid == 0)
     f45:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     f49:	75 05                	jne    f50 <sharedfd+0xd7>
    exit();
     f4b:	e8 82 2f 00 00       	call   3ed2 <exit>
  else
    wait();
     f50:	e8 85 2f 00 00       	call   3eda <wait>
  close(fd);
     f55:	83 ec 0c             	sub    $0xc,%esp
     f58:	ff 75 e8             	push   -0x18(%ebp)
     f5b:	e8 9a 2f 00 00       	call   3efa <close>
     f60:	83 c4 10             	add    $0x10,%esp
  fd = open("sharedfd", 0);
     f63:	83 ec 08             	sub    $0x8,%esp
     f66:	6a 00                	push   $0x0
     f68:	68 76 49 00 00       	push   $0x4976
     f6d:	e8 a0 2f 00 00       	call   3f12 <open>
     f72:	83 c4 10             	add    $0x10,%esp
     f75:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     f78:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     f7c:	79 17                	jns    f95 <sharedfd+0x11c>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     f7e:	83 ec 08             	sub    $0x8,%esp
     f81:	68 cc 49 00 00       	push   $0x49cc
     f86:	6a 01                	push   $0x1
     f88:	e8 b9 30 00 00       	call   4046 <printf>
     f8d:	83 c4 10             	add    $0x10,%esp
    return;
     f90:	e9 c5 00 00 00       	jmp    105a <sharedfd+0x1e1>
  }
  nc = np = 0;
     f95:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     f9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f9f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fa2:	eb 3b                	jmp    fdf <sharedfd+0x166>
    for(i = 0; i < sizeof(buf); i++){
     fa4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     fab:	eb 2a                	jmp    fd7 <sharedfd+0x15e>
      if(buf[i] == 'c')
     fad:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     fb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fb3:	01 d0                	add    %edx,%eax
     fb5:	0f b6 00             	movzbl (%eax),%eax
     fb8:	3c 63                	cmp    $0x63,%al
     fba:	75 04                	jne    fc0 <sharedfd+0x147>
        nc++;
     fbc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     fc0:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     fc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fc6:	01 d0                	add    %edx,%eax
     fc8:	0f b6 00             	movzbl (%eax),%eax
     fcb:	3c 70                	cmp    $0x70,%al
     fcd:	75 04                	jne    fd3 <sharedfd+0x15a>
        np++;
     fcf:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    for(i = 0; i < sizeof(buf); i++){
     fd3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     fd7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     fda:	83 f8 09             	cmp    $0x9,%eax
     fdd:	76 ce                	jbe    fad <sharedfd+0x134>
  while((n = read(fd, buf, sizeof(buf))) > 0){
     fdf:	83 ec 04             	sub    $0x4,%esp
     fe2:	6a 0a                	push   $0xa
     fe4:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     fe7:	50                   	push   %eax
     fe8:	ff 75 e8             	push   -0x18(%ebp)
     feb:	e8 fa 2e 00 00       	call   3eea <read>
     ff0:	83 c4 10             	add    $0x10,%esp
     ff3:	89 45 e0             	mov    %eax,-0x20(%ebp)
     ff6:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ffa:	7f a8                	jg     fa4 <sharedfd+0x12b>
    }
  }
  close(fd);
     ffc:	83 ec 0c             	sub    $0xc,%esp
     fff:	ff 75 e8             	push   -0x18(%ebp)
    1002:	e8 f3 2e 00 00       	call   3efa <close>
    1007:	83 c4 10             	add    $0x10,%esp
  unlink("sharedfd");
    100a:	83 ec 0c             	sub    $0xc,%esp
    100d:	68 76 49 00 00       	push   $0x4976
    1012:	e8 0b 2f 00 00       	call   3f22 <unlink>
    1017:	83 c4 10             	add    $0x10,%esp
  if(nc == 10000 && np == 10000){
    101a:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
    1021:	75 1d                	jne    1040 <sharedfd+0x1c7>
    1023:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
    102a:	75 14                	jne    1040 <sharedfd+0x1c7>
    printf(1, "sharedfd ok\n");
    102c:	83 ec 08             	sub    $0x8,%esp
    102f:	68 f7 49 00 00       	push   $0x49f7
    1034:	6a 01                	push   $0x1
    1036:	e8 0b 30 00 00       	call   4046 <printf>
    103b:	83 c4 10             	add    $0x10,%esp
    103e:	eb 1a                	jmp    105a <sharedfd+0x1e1>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1040:	ff 75 ec             	push   -0x14(%ebp)
    1043:	ff 75 f0             	push   -0x10(%ebp)
    1046:	68 04 4a 00 00       	push   $0x4a04
    104b:	6a 01                	push   $0x1
    104d:	e8 f4 2f 00 00       	call   4046 <printf>
    1052:	83 c4 10             	add    $0x10,%esp
    exit();
    1055:	e8 78 2e 00 00       	call   3ed2 <exit>
  }
}
    105a:	c9                   	leave
    105b:	c3                   	ret

0000105c <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    105c:	55                   	push   %ebp
    105d:	89 e5                	mov    %esp,%ebp
    105f:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1062:	c7 45 c8 19 4a 00 00 	movl   $0x4a19,-0x38(%ebp)
    1069:	c7 45 cc 1c 4a 00 00 	movl   $0x4a1c,-0x34(%ebp)
    1070:	c7 45 d0 1f 4a 00 00 	movl   $0x4a1f,-0x30(%ebp)
    1077:	c7 45 d4 22 4a 00 00 	movl   $0x4a22,-0x2c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    107e:	83 ec 08             	sub    $0x8,%esp
    1081:	68 25 4a 00 00       	push   $0x4a25
    1086:	6a 01                	push   $0x1
    1088:	e8 b9 2f 00 00       	call   4046 <printf>
    108d:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    1090:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1097:	e9 f0 00 00 00       	jmp    118c <fourfiles+0x130>
    fname = names[pi];
    109c:	8b 45 e8             	mov    -0x18(%ebp),%eax
    109f:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    10a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    unlink(fname);
    10a6:	83 ec 0c             	sub    $0xc,%esp
    10a9:	ff 75 e4             	push   -0x1c(%ebp)
    10ac:	e8 71 2e 00 00       	call   3f22 <unlink>
    10b1:	83 c4 10             	add    $0x10,%esp

    pid = fork();
    10b4:	e8 11 2e 00 00       	call   3eca <fork>
    10b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    if(pid < 0){
    10bc:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    10c0:	79 17                	jns    10d9 <fourfiles+0x7d>
      printf(1, "fork failed\n");
    10c2:	83 ec 08             	sub    $0x8,%esp
    10c5:	68 a1 44 00 00       	push   $0x44a1
    10ca:	6a 01                	push   $0x1
    10cc:	e8 75 2f 00 00       	call   4046 <printf>
    10d1:	83 c4 10             	add    $0x10,%esp
      exit();
    10d4:	e8 f9 2d 00 00       	call   3ed2 <exit>
    }

    if(pid == 0){
    10d9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
    10dd:	0f 85 a5 00 00 00    	jne    1188 <fourfiles+0x12c>
      fd = open(fname, O_CREATE | O_RDWR);
    10e3:	83 ec 08             	sub    $0x8,%esp
    10e6:	68 02 02 00 00       	push   $0x202
    10eb:	ff 75 e4             	push   -0x1c(%ebp)
    10ee:	e8 1f 2e 00 00       	call   3f12 <open>
    10f3:	83 c4 10             	add    $0x10,%esp
    10f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
      if(fd < 0){
    10f9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
    10fd:	79 17                	jns    1116 <fourfiles+0xba>
        printf(1, "create failed\n");
    10ff:	83 ec 08             	sub    $0x8,%esp
    1102:	68 35 4a 00 00       	push   $0x4a35
    1107:	6a 01                	push   $0x1
    1109:	e8 38 2f 00 00       	call   4046 <printf>
    110e:	83 c4 10             	add    $0x10,%esp
        exit();
    1111:	e8 bc 2d 00 00       	call   3ed2 <exit>
      }
      
      memset(buf, '0'+pi, 512);
    1116:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1119:	83 c0 30             	add    $0x30,%eax
    111c:	83 ec 04             	sub    $0x4,%esp
    111f:	68 00 02 00 00       	push   $0x200
    1124:	50                   	push   %eax
    1125:	68 e0 62 00 00       	push   $0x62e0
    112a:	e8 08 2c 00 00       	call   3d37 <memset>
    112f:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
    1132:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1139:	eb 42                	jmp    117d <fourfiles+0x121>
        if((n = write(fd, buf, 500)) != 500){
    113b:	83 ec 04             	sub    $0x4,%esp
    113e:	68 f4 01 00 00       	push   $0x1f4
    1143:	68 e0 62 00 00       	push   $0x62e0
    1148:	ff 75 e0             	push   -0x20(%ebp)
    114b:	e8 a2 2d 00 00       	call   3ef2 <write>
    1150:	83 c4 10             	add    $0x10,%esp
    1153:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1156:	81 7d dc f4 01 00 00 	cmpl   $0x1f4,-0x24(%ebp)
    115d:	74 1a                	je     1179 <fourfiles+0x11d>
          printf(1, "write failed %d\n", n);
    115f:	83 ec 04             	sub    $0x4,%esp
    1162:	ff 75 dc             	push   -0x24(%ebp)
    1165:	68 44 4a 00 00       	push   $0x4a44
    116a:	6a 01                	push   $0x1
    116c:	e8 d5 2e 00 00       	call   4046 <printf>
    1171:	83 c4 10             	add    $0x10,%esp
          exit();
    1174:	e8 59 2d 00 00       	call   3ed2 <exit>
      for(i = 0; i < 12; i++){
    1179:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    117d:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
    1181:	7e b8                	jle    113b <fourfiles+0xdf>
        }
      }
      exit();
    1183:	e8 4a 2d 00 00       	call   3ed2 <exit>
  for(pi = 0; pi < 4; pi++){
    1188:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    118c:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    1190:	0f 8e 06 ff ff ff    	jle    109c <fourfiles+0x40>
    }
  }

  for(pi = 0; pi < 4; pi++){
    1196:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    119d:	eb 09                	jmp    11a8 <fourfiles+0x14c>
    wait();
    119f:	e8 36 2d 00 00       	call   3eda <wait>
  for(pi = 0; pi < 4; pi++){
    11a4:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    11a8:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
    11ac:	7e f1                	jle    119f <fourfiles+0x143>
  }

  for(i = 0; i < 2; i++){
    11ae:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    11b5:	e9 d4 00 00 00       	jmp    128e <fourfiles+0x232>
    fname = names[i];
    11ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11bd:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    11c1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    fd = open(fname, 0);
    11c4:	83 ec 08             	sub    $0x8,%esp
    11c7:	6a 00                	push   $0x0
    11c9:	ff 75 e4             	push   -0x1c(%ebp)
    11cc:	e8 41 2d 00 00       	call   3f12 <open>
    11d1:	83 c4 10             	add    $0x10,%esp
    11d4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    total = 0;
    11d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    11de:	eb 4a                	jmp    122a <fourfiles+0x1ce>
      for(j = 0; j < n; j++){
    11e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    11e7:	eb 33                	jmp    121c <fourfiles+0x1c0>
        if(buf[j] != '0'+i){
    11e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11ec:	05 e0 62 00 00       	add    $0x62e0,%eax
    11f1:	0f b6 00             	movzbl (%eax),%eax
    11f4:	0f be d0             	movsbl %al,%edx
    11f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11fa:	83 c0 30             	add    $0x30,%eax
    11fd:	39 c2                	cmp    %eax,%edx
    11ff:	74 17                	je     1218 <fourfiles+0x1bc>
          printf(1, "wrong char\n");
    1201:	83 ec 08             	sub    $0x8,%esp
    1204:	68 55 4a 00 00       	push   $0x4a55
    1209:	6a 01                	push   $0x1
    120b:	e8 36 2e 00 00       	call   4046 <printf>
    1210:	83 c4 10             	add    $0x10,%esp
          exit();
    1213:	e8 ba 2c 00 00       	call   3ed2 <exit>
      for(j = 0; j < n; j++){
    1218:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    121c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    121f:	3b 45 dc             	cmp    -0x24(%ebp),%eax
    1222:	7c c5                	jl     11e9 <fourfiles+0x18d>
        }
      }
      total += n;
    1224:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1227:	01 45 ec             	add    %eax,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
    122a:	83 ec 04             	sub    $0x4,%esp
    122d:	68 00 20 00 00       	push   $0x2000
    1232:	68 e0 62 00 00       	push   $0x62e0
    1237:	ff 75 e0             	push   -0x20(%ebp)
    123a:	e8 ab 2c 00 00       	call   3eea <read>
    123f:	83 c4 10             	add    $0x10,%esp
    1242:	89 45 dc             	mov    %eax,-0x24(%ebp)
    1245:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
    1249:	7f 95                	jg     11e0 <fourfiles+0x184>
    }
    close(fd);
    124b:	83 ec 0c             	sub    $0xc,%esp
    124e:	ff 75 e0             	push   -0x20(%ebp)
    1251:	e8 a4 2c 00 00       	call   3efa <close>
    1256:	83 c4 10             	add    $0x10,%esp
    if(total != 12*500){
    1259:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
    1260:	74 1a                	je     127c <fourfiles+0x220>
      printf(1, "wrong length %d\n", total);
    1262:	83 ec 04             	sub    $0x4,%esp
    1265:	ff 75 ec             	push   -0x14(%ebp)
    1268:	68 61 4a 00 00       	push   $0x4a61
    126d:	6a 01                	push   $0x1
    126f:	e8 d2 2d 00 00       	call   4046 <printf>
    1274:	83 c4 10             	add    $0x10,%esp
      exit();
    1277:	e8 56 2c 00 00       	call   3ed2 <exit>
    }
    unlink(fname);
    127c:	83 ec 0c             	sub    $0xc,%esp
    127f:	ff 75 e4             	push   -0x1c(%ebp)
    1282:	e8 9b 2c 00 00       	call   3f22 <unlink>
    1287:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 2; i++){
    128a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    128e:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
    1292:	0f 8e 22 ff ff ff    	jle    11ba <fourfiles+0x15e>
  }

  printf(1, "fourfiles ok\n");
    1298:	83 ec 08             	sub    $0x8,%esp
    129b:	68 72 4a 00 00       	push   $0x4a72
    12a0:	6a 01                	push   $0x1
    12a2:	e8 9f 2d 00 00       	call   4046 <printf>
    12a7:	83 c4 10             	add    $0x10,%esp
}
    12aa:	90                   	nop
    12ab:	c9                   	leave
    12ac:	c3                   	ret

000012ad <createdelete>:

// four processes create and delete different files in same directory
void
createdelete(void)
{
    12ad:	55                   	push   %ebp
    12ae:	89 e5                	mov    %esp,%ebp
    12b0:	83 ec 38             	sub    $0x38,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    12b3:	83 ec 08             	sub    $0x8,%esp
    12b6:	68 80 4a 00 00       	push   $0x4a80
    12bb:	6a 01                	push   $0x1
    12bd:	e8 84 2d 00 00       	call   4046 <printf>
    12c2:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    12c5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    12cc:	e9 f6 00 00 00       	jmp    13c7 <createdelete+0x11a>
    pid = fork();
    12d1:	e8 f4 2b 00 00       	call   3eca <fork>
    12d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pid < 0){
    12d9:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    12dd:	79 17                	jns    12f6 <createdelete+0x49>
      printf(1, "fork failed\n");
    12df:	83 ec 08             	sub    $0x8,%esp
    12e2:	68 a1 44 00 00       	push   $0x44a1
    12e7:	6a 01                	push   $0x1
    12e9:	e8 58 2d 00 00       	call   4046 <printf>
    12ee:	83 c4 10             	add    $0x10,%esp
      exit();
    12f1:	e8 dc 2b 00 00       	call   3ed2 <exit>
    }

    if(pid == 0){
    12f6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    12fa:	0f 85 c3 00 00 00    	jne    13c3 <createdelete+0x116>
      name[0] = 'p' + pi;
    1300:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1303:	83 c0 70             	add    $0x70,%eax
    1306:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[2] = '\0';
    1309:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
      for(i = 0; i < N; i++){
    130d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1314:	e9 9b 00 00 00       	jmp    13b4 <createdelete+0x107>
        name[1] = '0' + i;
    1319:	8b 45 f4             	mov    -0xc(%ebp),%eax
    131c:	83 c0 30             	add    $0x30,%eax
    131f:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1322:	83 ec 08             	sub    $0x8,%esp
    1325:	68 02 02 00 00       	push   $0x202
    132a:	8d 45 c8             	lea    -0x38(%ebp),%eax
    132d:	50                   	push   %eax
    132e:	e8 df 2b 00 00       	call   3f12 <open>
    1333:	83 c4 10             	add    $0x10,%esp
    1336:	89 45 ec             	mov    %eax,-0x14(%ebp)
        if(fd < 0){
    1339:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    133d:	79 17                	jns    1356 <createdelete+0xa9>
          printf(1, "create failed\n");
    133f:	83 ec 08             	sub    $0x8,%esp
    1342:	68 35 4a 00 00       	push   $0x4a35
    1347:	6a 01                	push   $0x1
    1349:	e8 f8 2c 00 00       	call   4046 <printf>
    134e:	83 c4 10             	add    $0x10,%esp
          exit();
    1351:	e8 7c 2b 00 00       	call   3ed2 <exit>
        }
        close(fd);
    1356:	83 ec 0c             	sub    $0xc,%esp
    1359:	ff 75 ec             	push   -0x14(%ebp)
    135c:	e8 99 2b 00 00       	call   3efa <close>
    1361:	83 c4 10             	add    $0x10,%esp
        if(i > 0 && (i % 2 ) == 0){
    1364:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1368:	7e 46                	jle    13b0 <createdelete+0x103>
    136a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    136d:	83 e0 01             	and    $0x1,%eax
    1370:	85 c0                	test   %eax,%eax
    1372:	75 3c                	jne    13b0 <createdelete+0x103>
          name[1] = '0' + (i / 2);
    1374:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1377:	89 c2                	mov    %eax,%edx
    1379:	c1 ea 1f             	shr    $0x1f,%edx
    137c:	01 d0                	add    %edx,%eax
    137e:	d1 f8                	sar    $1,%eax
    1380:	83 c0 30             	add    $0x30,%eax
    1383:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1386:	83 ec 0c             	sub    $0xc,%esp
    1389:	8d 45 c8             	lea    -0x38(%ebp),%eax
    138c:	50                   	push   %eax
    138d:	e8 90 2b 00 00       	call   3f22 <unlink>
    1392:	83 c4 10             	add    $0x10,%esp
    1395:	85 c0                	test   %eax,%eax
    1397:	79 17                	jns    13b0 <createdelete+0x103>
            printf(1, "unlink failed\n");
    1399:	83 ec 08             	sub    $0x8,%esp
    139c:	68 24 45 00 00       	push   $0x4524
    13a1:	6a 01                	push   $0x1
    13a3:	e8 9e 2c 00 00       	call   4046 <printf>
    13a8:	83 c4 10             	add    $0x10,%esp
            exit();
    13ab:	e8 22 2b 00 00       	call   3ed2 <exit>
      for(i = 0; i < N; i++){
    13b0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    13b4:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    13b8:	0f 8e 5b ff ff ff    	jle    1319 <createdelete+0x6c>
          }
        }
      }
      exit();
    13be:	e8 0f 2b 00 00       	call   3ed2 <exit>
  for(pi = 0; pi < 4; pi++){
    13c3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    13c7:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    13cb:	0f 8e 00 ff ff ff    	jle    12d1 <createdelete+0x24>
    }
  }

  for(pi = 0; pi < 4; pi++){
    13d1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    13d8:	eb 09                	jmp    13e3 <createdelete+0x136>
    wait();
    13da:	e8 fb 2a 00 00       	call   3eda <wait>
  for(pi = 0; pi < 4; pi++){
    13df:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    13e3:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    13e7:	7e f1                	jle    13da <createdelete+0x12d>
  }

  name[0] = name[1] = name[2] = 0;
    13e9:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    13ed:	0f b6 45 ca          	movzbl -0x36(%ebp),%eax
    13f1:	88 45 c9             	mov    %al,-0x37(%ebp)
    13f4:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
    13f8:	88 45 c8             	mov    %al,-0x38(%ebp)
  for(i = 0; i < N; i++){
    13fb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1402:	e9 b2 00 00 00       	jmp    14b9 <createdelete+0x20c>
    for(pi = 0; pi < 4; pi++){
    1407:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    140e:	e9 98 00 00 00       	jmp    14ab <createdelete+0x1fe>
      name[0] = 'p' + pi;
    1413:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1416:	83 c0 70             	add    $0x70,%eax
    1419:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    141c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    141f:	83 c0 30             	add    $0x30,%eax
    1422:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1425:	83 ec 08             	sub    $0x8,%esp
    1428:	6a 00                	push   $0x0
    142a:	8d 45 c8             	lea    -0x38(%ebp),%eax
    142d:	50                   	push   %eax
    142e:	e8 df 2a 00 00       	call   3f12 <open>
    1433:	83 c4 10             	add    $0x10,%esp
    1436:	89 45 ec             	mov    %eax,-0x14(%ebp)
      if((i == 0 || i >= N/2) && fd < 0){
    1439:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    143d:	74 06                	je     1445 <createdelete+0x198>
    143f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1443:	7e 21                	jle    1466 <createdelete+0x1b9>
    1445:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1449:	79 1b                	jns    1466 <createdelete+0x1b9>
        printf(1, "oops createdelete %s didn't exist\n", name);
    144b:	83 ec 04             	sub    $0x4,%esp
    144e:	8d 45 c8             	lea    -0x38(%ebp),%eax
    1451:	50                   	push   %eax
    1452:	68 94 4a 00 00       	push   $0x4a94
    1457:	6a 01                	push   $0x1
    1459:	e8 e8 2b 00 00       	call   4046 <printf>
    145e:	83 c4 10             	add    $0x10,%esp
        exit();
    1461:	e8 6c 2a 00 00       	call   3ed2 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1466:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    146a:	7e 27                	jle    1493 <createdelete+0x1e6>
    146c:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    1470:	7f 21                	jg     1493 <createdelete+0x1e6>
    1472:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1476:	78 1b                	js     1493 <createdelete+0x1e6>
        printf(1, "oops createdelete %s did exist\n", name);
    1478:	83 ec 04             	sub    $0x4,%esp
    147b:	8d 45 c8             	lea    -0x38(%ebp),%eax
    147e:	50                   	push   %eax
    147f:	68 b8 4a 00 00       	push   $0x4ab8
    1484:	6a 01                	push   $0x1
    1486:	e8 bb 2b 00 00       	call   4046 <printf>
    148b:	83 c4 10             	add    $0x10,%esp
        exit();
    148e:	e8 3f 2a 00 00       	call   3ed2 <exit>
      }
      if(fd >= 0)
    1493:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1497:	78 0e                	js     14a7 <createdelete+0x1fa>
        close(fd);
    1499:	83 ec 0c             	sub    $0xc,%esp
    149c:	ff 75 ec             	push   -0x14(%ebp)
    149f:	e8 56 2a 00 00       	call   3efa <close>
    14a4:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    14a7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    14ab:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    14af:	0f 8e 5e ff ff ff    	jle    1413 <createdelete+0x166>
  for(i = 0; i < N; i++){
    14b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    14b9:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    14bd:	0f 8e 44 ff ff ff    	jle    1407 <createdelete+0x15a>
    }
  }

  for(i = 0; i < N; i++){
    14c3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    14ca:	eb 38                	jmp    1504 <createdelete+0x257>
    for(pi = 0; pi < 4; pi++){
    14cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    14d3:	eb 25                	jmp    14fa <createdelete+0x24d>
      name[0] = 'p' + i;
    14d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14d8:	83 c0 70             	add    $0x70,%eax
    14db:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    14de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e1:	83 c0 30             	add    $0x30,%eax
    14e4:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    14e7:	83 ec 0c             	sub    $0xc,%esp
    14ea:	8d 45 c8             	lea    -0x38(%ebp),%eax
    14ed:	50                   	push   %eax
    14ee:	e8 2f 2a 00 00       	call   3f22 <unlink>
    14f3:	83 c4 10             	add    $0x10,%esp
    for(pi = 0; pi < 4; pi++){
    14f6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    14fa:	83 7d f0 03          	cmpl   $0x3,-0x10(%ebp)
    14fe:	7e d5                	jle    14d5 <createdelete+0x228>
  for(i = 0; i < N; i++){
    1500:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1504:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1508:	7e c2                	jle    14cc <createdelete+0x21f>
    }
  }

  printf(1, "createdelete ok\n");
    150a:	83 ec 08             	sub    $0x8,%esp
    150d:	68 d8 4a 00 00       	push   $0x4ad8
    1512:	6a 01                	push   $0x1
    1514:	e8 2d 2b 00 00       	call   4046 <printf>
    1519:	83 c4 10             	add    $0x10,%esp
}
    151c:	90                   	nop
    151d:	c9                   	leave
    151e:	c3                   	ret

0000151f <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    151f:	55                   	push   %ebp
    1520:	89 e5                	mov    %esp,%ebp
    1522:	83 ec 18             	sub    $0x18,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1525:	83 ec 08             	sub    $0x8,%esp
    1528:	68 e9 4a 00 00       	push   $0x4ae9
    152d:	6a 01                	push   $0x1
    152f:	e8 12 2b 00 00       	call   4046 <printf>
    1534:	83 c4 10             	add    $0x10,%esp
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1537:	83 ec 08             	sub    $0x8,%esp
    153a:	68 02 02 00 00       	push   $0x202
    153f:	68 fa 4a 00 00       	push   $0x4afa
    1544:	e8 c9 29 00 00       	call   3f12 <open>
    1549:	83 c4 10             	add    $0x10,%esp
    154c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    154f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1553:	79 17                	jns    156c <unlinkread+0x4d>
    printf(1, "create unlinkread failed\n");
    1555:	83 ec 08             	sub    $0x8,%esp
    1558:	68 05 4b 00 00       	push   $0x4b05
    155d:	6a 01                	push   $0x1
    155f:	e8 e2 2a 00 00       	call   4046 <printf>
    1564:	83 c4 10             	add    $0x10,%esp
    exit();
    1567:	e8 66 29 00 00       	call   3ed2 <exit>
  }
  write(fd, "hello", 5);
    156c:	83 ec 04             	sub    $0x4,%esp
    156f:	6a 05                	push   $0x5
    1571:	68 1f 4b 00 00       	push   $0x4b1f
    1576:	ff 75 f4             	push   -0xc(%ebp)
    1579:	e8 74 29 00 00       	call   3ef2 <write>
    157e:	83 c4 10             	add    $0x10,%esp
  close(fd);
    1581:	83 ec 0c             	sub    $0xc,%esp
    1584:	ff 75 f4             	push   -0xc(%ebp)
    1587:	e8 6e 29 00 00       	call   3efa <close>
    158c:	83 c4 10             	add    $0x10,%esp

  fd = open("unlinkread", O_RDWR);
    158f:	83 ec 08             	sub    $0x8,%esp
    1592:	6a 02                	push   $0x2
    1594:	68 fa 4a 00 00       	push   $0x4afa
    1599:	e8 74 29 00 00       	call   3f12 <open>
    159e:	83 c4 10             	add    $0x10,%esp
    15a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    15a4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15a8:	79 17                	jns    15c1 <unlinkread+0xa2>
    printf(1, "open unlinkread failed\n");
    15aa:	83 ec 08             	sub    $0x8,%esp
    15ad:	68 25 4b 00 00       	push   $0x4b25
    15b2:	6a 01                	push   $0x1
    15b4:	e8 8d 2a 00 00       	call   4046 <printf>
    15b9:	83 c4 10             	add    $0x10,%esp
    exit();
    15bc:	e8 11 29 00 00       	call   3ed2 <exit>
  }
  if(unlink("unlinkread") != 0){
    15c1:	83 ec 0c             	sub    $0xc,%esp
    15c4:	68 fa 4a 00 00       	push   $0x4afa
    15c9:	e8 54 29 00 00       	call   3f22 <unlink>
    15ce:	83 c4 10             	add    $0x10,%esp
    15d1:	85 c0                	test   %eax,%eax
    15d3:	74 17                	je     15ec <unlinkread+0xcd>
    printf(1, "unlink unlinkread failed\n");
    15d5:	83 ec 08             	sub    $0x8,%esp
    15d8:	68 3d 4b 00 00       	push   $0x4b3d
    15dd:	6a 01                	push   $0x1
    15df:	e8 62 2a 00 00       	call   4046 <printf>
    15e4:	83 c4 10             	add    $0x10,%esp
    exit();
    15e7:	e8 e6 28 00 00       	call   3ed2 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    15ec:	83 ec 08             	sub    $0x8,%esp
    15ef:	68 02 02 00 00       	push   $0x202
    15f4:	68 fa 4a 00 00       	push   $0x4afa
    15f9:	e8 14 29 00 00       	call   3f12 <open>
    15fe:	83 c4 10             	add    $0x10,%esp
    1601:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    1604:	83 ec 04             	sub    $0x4,%esp
    1607:	6a 03                	push   $0x3
    1609:	68 57 4b 00 00       	push   $0x4b57
    160e:	ff 75 f0             	push   -0x10(%ebp)
    1611:	e8 dc 28 00 00       	call   3ef2 <write>
    1616:	83 c4 10             	add    $0x10,%esp
  close(fd1);
    1619:	83 ec 0c             	sub    $0xc,%esp
    161c:	ff 75 f0             	push   -0x10(%ebp)
    161f:	e8 d6 28 00 00       	call   3efa <close>
    1624:	83 c4 10             	add    $0x10,%esp

  if(read(fd, buf, sizeof(buf)) != 5){
    1627:	83 ec 04             	sub    $0x4,%esp
    162a:	68 00 20 00 00       	push   $0x2000
    162f:	68 e0 62 00 00       	push   $0x62e0
    1634:	ff 75 f4             	push   -0xc(%ebp)
    1637:	e8 ae 28 00 00       	call   3eea <read>
    163c:	83 c4 10             	add    $0x10,%esp
    163f:	83 f8 05             	cmp    $0x5,%eax
    1642:	74 17                	je     165b <unlinkread+0x13c>
    printf(1, "unlinkread read failed");
    1644:	83 ec 08             	sub    $0x8,%esp
    1647:	68 5b 4b 00 00       	push   $0x4b5b
    164c:	6a 01                	push   $0x1
    164e:	e8 f3 29 00 00       	call   4046 <printf>
    1653:	83 c4 10             	add    $0x10,%esp
    exit();
    1656:	e8 77 28 00 00       	call   3ed2 <exit>
  }
  if(buf[0] != 'h'){
    165b:	0f b6 05 e0 62 00 00 	movzbl 0x62e0,%eax
    1662:	3c 68                	cmp    $0x68,%al
    1664:	74 17                	je     167d <unlinkread+0x15e>
    printf(1, "unlinkread wrong data\n");
    1666:	83 ec 08             	sub    $0x8,%esp
    1669:	68 72 4b 00 00       	push   $0x4b72
    166e:	6a 01                	push   $0x1
    1670:	e8 d1 29 00 00       	call   4046 <printf>
    1675:	83 c4 10             	add    $0x10,%esp
    exit();
    1678:	e8 55 28 00 00       	call   3ed2 <exit>
  }
  if(write(fd, buf, 10) != 10){
    167d:	83 ec 04             	sub    $0x4,%esp
    1680:	6a 0a                	push   $0xa
    1682:	68 e0 62 00 00       	push   $0x62e0
    1687:	ff 75 f4             	push   -0xc(%ebp)
    168a:	e8 63 28 00 00       	call   3ef2 <write>
    168f:	83 c4 10             	add    $0x10,%esp
    1692:	83 f8 0a             	cmp    $0xa,%eax
    1695:	74 17                	je     16ae <unlinkread+0x18f>
    printf(1, "unlinkread write failed\n");
    1697:	83 ec 08             	sub    $0x8,%esp
    169a:	68 89 4b 00 00       	push   $0x4b89
    169f:	6a 01                	push   $0x1
    16a1:	e8 a0 29 00 00       	call   4046 <printf>
    16a6:	83 c4 10             	add    $0x10,%esp
    exit();
    16a9:	e8 24 28 00 00       	call   3ed2 <exit>
  }
  close(fd);
    16ae:	83 ec 0c             	sub    $0xc,%esp
    16b1:	ff 75 f4             	push   -0xc(%ebp)
    16b4:	e8 41 28 00 00       	call   3efa <close>
    16b9:	83 c4 10             	add    $0x10,%esp
  unlink("unlinkread");
    16bc:	83 ec 0c             	sub    $0xc,%esp
    16bf:	68 fa 4a 00 00       	push   $0x4afa
    16c4:	e8 59 28 00 00       	call   3f22 <unlink>
    16c9:	83 c4 10             	add    $0x10,%esp
  printf(1, "unlinkread ok\n");
    16cc:	83 ec 08             	sub    $0x8,%esp
    16cf:	68 a2 4b 00 00       	push   $0x4ba2
    16d4:	6a 01                	push   $0x1
    16d6:	e8 6b 29 00 00       	call   4046 <printf>
    16db:	83 c4 10             	add    $0x10,%esp
}
    16de:	90                   	nop
    16df:	c9                   	leave
    16e0:	c3                   	ret

000016e1 <linktest>:

void
linktest(void)
{
    16e1:	55                   	push   %ebp
    16e2:	89 e5                	mov    %esp,%ebp
    16e4:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "linktest\n");
    16e7:	83 ec 08             	sub    $0x8,%esp
    16ea:	68 b1 4b 00 00       	push   $0x4bb1
    16ef:	6a 01                	push   $0x1
    16f1:	e8 50 29 00 00       	call   4046 <printf>
    16f6:	83 c4 10             	add    $0x10,%esp

  unlink("lf1");
    16f9:	83 ec 0c             	sub    $0xc,%esp
    16fc:	68 bb 4b 00 00       	push   $0x4bbb
    1701:	e8 1c 28 00 00       	call   3f22 <unlink>
    1706:	83 c4 10             	add    $0x10,%esp
  unlink("lf2");
    1709:	83 ec 0c             	sub    $0xc,%esp
    170c:	68 bf 4b 00 00       	push   $0x4bbf
    1711:	e8 0c 28 00 00       	call   3f22 <unlink>
    1716:	83 c4 10             	add    $0x10,%esp

  fd = open("lf1", O_CREATE|O_RDWR);
    1719:	83 ec 08             	sub    $0x8,%esp
    171c:	68 02 02 00 00       	push   $0x202
    1721:	68 bb 4b 00 00       	push   $0x4bbb
    1726:	e8 e7 27 00 00       	call   3f12 <open>
    172b:	83 c4 10             	add    $0x10,%esp
    172e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1731:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1735:	79 17                	jns    174e <linktest+0x6d>
    printf(1, "create lf1 failed\n");
    1737:	83 ec 08             	sub    $0x8,%esp
    173a:	68 c3 4b 00 00       	push   $0x4bc3
    173f:	6a 01                	push   $0x1
    1741:	e8 00 29 00 00       	call   4046 <printf>
    1746:	83 c4 10             	add    $0x10,%esp
    exit();
    1749:	e8 84 27 00 00       	call   3ed2 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    174e:	83 ec 04             	sub    $0x4,%esp
    1751:	6a 05                	push   $0x5
    1753:	68 1f 4b 00 00       	push   $0x4b1f
    1758:	ff 75 f4             	push   -0xc(%ebp)
    175b:	e8 92 27 00 00       	call   3ef2 <write>
    1760:	83 c4 10             	add    $0x10,%esp
    1763:	83 f8 05             	cmp    $0x5,%eax
    1766:	74 17                	je     177f <linktest+0x9e>
    printf(1, "write lf1 failed\n");
    1768:	83 ec 08             	sub    $0x8,%esp
    176b:	68 d6 4b 00 00       	push   $0x4bd6
    1770:	6a 01                	push   $0x1
    1772:	e8 cf 28 00 00       	call   4046 <printf>
    1777:	83 c4 10             	add    $0x10,%esp
    exit();
    177a:	e8 53 27 00 00       	call   3ed2 <exit>
  }
  close(fd);
    177f:	83 ec 0c             	sub    $0xc,%esp
    1782:	ff 75 f4             	push   -0xc(%ebp)
    1785:	e8 70 27 00 00       	call   3efa <close>
    178a:	83 c4 10             	add    $0x10,%esp

  if(link("lf1", "lf2") < 0){
    178d:	83 ec 08             	sub    $0x8,%esp
    1790:	68 bf 4b 00 00       	push   $0x4bbf
    1795:	68 bb 4b 00 00       	push   $0x4bbb
    179a:	e8 93 27 00 00       	call   3f32 <link>
    179f:	83 c4 10             	add    $0x10,%esp
    17a2:	85 c0                	test   %eax,%eax
    17a4:	79 17                	jns    17bd <linktest+0xdc>
    printf(1, "link lf1 lf2 failed\n");
    17a6:	83 ec 08             	sub    $0x8,%esp
    17a9:	68 e8 4b 00 00       	push   $0x4be8
    17ae:	6a 01                	push   $0x1
    17b0:	e8 91 28 00 00       	call   4046 <printf>
    17b5:	83 c4 10             	add    $0x10,%esp
    exit();
    17b8:	e8 15 27 00 00       	call   3ed2 <exit>
  }
  unlink("lf1");
    17bd:	83 ec 0c             	sub    $0xc,%esp
    17c0:	68 bb 4b 00 00       	push   $0x4bbb
    17c5:	e8 58 27 00 00       	call   3f22 <unlink>
    17ca:	83 c4 10             	add    $0x10,%esp

  if(open("lf1", 0) >= 0){
    17cd:	83 ec 08             	sub    $0x8,%esp
    17d0:	6a 00                	push   $0x0
    17d2:	68 bb 4b 00 00       	push   $0x4bbb
    17d7:	e8 36 27 00 00       	call   3f12 <open>
    17dc:	83 c4 10             	add    $0x10,%esp
    17df:	85 c0                	test   %eax,%eax
    17e1:	78 17                	js     17fa <linktest+0x119>
    printf(1, "unlinked lf1 but it is still there!\n");
    17e3:	83 ec 08             	sub    $0x8,%esp
    17e6:	68 00 4c 00 00       	push   $0x4c00
    17eb:	6a 01                	push   $0x1
    17ed:	e8 54 28 00 00       	call   4046 <printf>
    17f2:	83 c4 10             	add    $0x10,%esp
    exit();
    17f5:	e8 d8 26 00 00       	call   3ed2 <exit>
  }

  fd = open("lf2", 0);
    17fa:	83 ec 08             	sub    $0x8,%esp
    17fd:	6a 00                	push   $0x0
    17ff:	68 bf 4b 00 00       	push   $0x4bbf
    1804:	e8 09 27 00 00       	call   3f12 <open>
    1809:	83 c4 10             	add    $0x10,%esp
    180c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    180f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1813:	79 17                	jns    182c <linktest+0x14b>
    printf(1, "open lf2 failed\n");
    1815:	83 ec 08             	sub    $0x8,%esp
    1818:	68 25 4c 00 00       	push   $0x4c25
    181d:	6a 01                	push   $0x1
    181f:	e8 22 28 00 00       	call   4046 <printf>
    1824:	83 c4 10             	add    $0x10,%esp
    exit();
    1827:	e8 a6 26 00 00       	call   3ed2 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    182c:	83 ec 04             	sub    $0x4,%esp
    182f:	68 00 20 00 00       	push   $0x2000
    1834:	68 e0 62 00 00       	push   $0x62e0
    1839:	ff 75 f4             	push   -0xc(%ebp)
    183c:	e8 a9 26 00 00       	call   3eea <read>
    1841:	83 c4 10             	add    $0x10,%esp
    1844:	83 f8 05             	cmp    $0x5,%eax
    1847:	74 17                	je     1860 <linktest+0x17f>
    printf(1, "read lf2 failed\n");
    1849:	83 ec 08             	sub    $0x8,%esp
    184c:	68 36 4c 00 00       	push   $0x4c36
    1851:	6a 01                	push   $0x1
    1853:	e8 ee 27 00 00       	call   4046 <printf>
    1858:	83 c4 10             	add    $0x10,%esp
    exit();
    185b:	e8 72 26 00 00       	call   3ed2 <exit>
  }
  close(fd);
    1860:	83 ec 0c             	sub    $0xc,%esp
    1863:	ff 75 f4             	push   -0xc(%ebp)
    1866:	e8 8f 26 00 00       	call   3efa <close>
    186b:	83 c4 10             	add    $0x10,%esp

  if(link("lf2", "lf2") >= 0){
    186e:	83 ec 08             	sub    $0x8,%esp
    1871:	68 bf 4b 00 00       	push   $0x4bbf
    1876:	68 bf 4b 00 00       	push   $0x4bbf
    187b:	e8 b2 26 00 00       	call   3f32 <link>
    1880:	83 c4 10             	add    $0x10,%esp
    1883:	85 c0                	test   %eax,%eax
    1885:	78 17                	js     189e <linktest+0x1bd>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    1887:	83 ec 08             	sub    $0x8,%esp
    188a:	68 47 4c 00 00       	push   $0x4c47
    188f:	6a 01                	push   $0x1
    1891:	e8 b0 27 00 00       	call   4046 <printf>
    1896:	83 c4 10             	add    $0x10,%esp
    exit();
    1899:	e8 34 26 00 00       	call   3ed2 <exit>
  }

  unlink("lf2");
    189e:	83 ec 0c             	sub    $0xc,%esp
    18a1:	68 bf 4b 00 00       	push   $0x4bbf
    18a6:	e8 77 26 00 00       	call   3f22 <unlink>
    18ab:	83 c4 10             	add    $0x10,%esp
  if(link("lf2", "lf1") >= 0){
    18ae:	83 ec 08             	sub    $0x8,%esp
    18b1:	68 bb 4b 00 00       	push   $0x4bbb
    18b6:	68 bf 4b 00 00       	push   $0x4bbf
    18bb:	e8 72 26 00 00       	call   3f32 <link>
    18c0:	83 c4 10             	add    $0x10,%esp
    18c3:	85 c0                	test   %eax,%eax
    18c5:	78 17                	js     18de <linktest+0x1fd>
    printf(1, "link non-existant succeeded! oops\n");
    18c7:	83 ec 08             	sub    $0x8,%esp
    18ca:	68 68 4c 00 00       	push   $0x4c68
    18cf:	6a 01                	push   $0x1
    18d1:	e8 70 27 00 00       	call   4046 <printf>
    18d6:	83 c4 10             	add    $0x10,%esp
    exit();
    18d9:	e8 f4 25 00 00       	call   3ed2 <exit>
  }

  if(link(".", "lf1") >= 0){
    18de:	83 ec 08             	sub    $0x8,%esp
    18e1:	68 bb 4b 00 00       	push   $0x4bbb
    18e6:	68 8b 4c 00 00       	push   $0x4c8b
    18eb:	e8 42 26 00 00       	call   3f32 <link>
    18f0:	83 c4 10             	add    $0x10,%esp
    18f3:	85 c0                	test   %eax,%eax
    18f5:	78 17                	js     190e <linktest+0x22d>
    printf(1, "link . lf1 succeeded! oops\n");
    18f7:	83 ec 08             	sub    $0x8,%esp
    18fa:	68 8d 4c 00 00       	push   $0x4c8d
    18ff:	6a 01                	push   $0x1
    1901:	e8 40 27 00 00       	call   4046 <printf>
    1906:	83 c4 10             	add    $0x10,%esp
    exit();
    1909:	e8 c4 25 00 00       	call   3ed2 <exit>
  }

  printf(1, "linktest ok\n");
    190e:	83 ec 08             	sub    $0x8,%esp
    1911:	68 a9 4c 00 00       	push   $0x4ca9
    1916:	6a 01                	push   $0x1
    1918:	e8 29 27 00 00       	call   4046 <printf>
    191d:	83 c4 10             	add    $0x10,%esp
}
    1920:	90                   	nop
    1921:	c9                   	leave
    1922:	c3                   	ret

00001923 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1923:	55                   	push   %ebp
    1924:	89 e5                	mov    %esp,%ebp
    1926:	83 ec 58             	sub    $0x58,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1929:	83 ec 08             	sub    $0x8,%esp
    192c:	68 b6 4c 00 00       	push   $0x4cb6
    1931:	6a 01                	push   $0x1
    1933:	e8 0e 27 00 00       	call   4046 <printf>
    1938:	83 c4 10             	add    $0x10,%esp
  file[0] = 'C';
    193b:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    193f:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    1943:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    194a:	e9 fc 00 00 00       	jmp    1a4b <concreate+0x128>
    file[1] = '0' + i;
    194f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1952:	83 c0 30             	add    $0x30,%eax
    1955:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    1958:	83 ec 0c             	sub    $0xc,%esp
    195b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    195e:	50                   	push   %eax
    195f:	e8 be 25 00 00       	call   3f22 <unlink>
    1964:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    1967:	e8 5e 25 00 00       	call   3eca <fork>
    196c:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pid && (i % 3) == 1){
    196f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1973:	74 3b                	je     19b0 <concreate+0x8d>
    1975:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1978:	ba 56 55 55 55       	mov    $0x55555556,%edx
    197d:	89 c8                	mov    %ecx,%eax
    197f:	f7 ea                	imul   %edx
    1981:	89 c8                	mov    %ecx,%eax
    1983:	c1 f8 1f             	sar    $0x1f,%eax
    1986:	29 c2                	sub    %eax,%edx
    1988:	89 d0                	mov    %edx,%eax
    198a:	01 c0                	add    %eax,%eax
    198c:	01 d0                	add    %edx,%eax
    198e:	29 c1                	sub    %eax,%ecx
    1990:	89 ca                	mov    %ecx,%edx
    1992:	83 fa 01             	cmp    $0x1,%edx
    1995:	75 19                	jne    19b0 <concreate+0x8d>
      link("C0", file);
    1997:	83 ec 08             	sub    $0x8,%esp
    199a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    199d:	50                   	push   %eax
    199e:	68 c6 4c 00 00       	push   $0x4cc6
    19a3:	e8 8a 25 00 00       	call   3f32 <link>
    19a8:	83 c4 10             	add    $0x10,%esp
    19ab:	e9 87 00 00 00       	jmp    1a37 <concreate+0x114>
    } else if(pid == 0 && (i % 5) == 1){
    19b0:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    19b4:	75 3b                	jne    19f1 <concreate+0xce>
    19b6:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    19b9:	ba 67 66 66 66       	mov    $0x66666667,%edx
    19be:	89 c8                	mov    %ecx,%eax
    19c0:	f7 ea                	imul   %edx
    19c2:	d1 fa                	sar    $1,%edx
    19c4:	89 c8                	mov    %ecx,%eax
    19c6:	c1 f8 1f             	sar    $0x1f,%eax
    19c9:	29 c2                	sub    %eax,%edx
    19cb:	89 d0                	mov    %edx,%eax
    19cd:	c1 e0 02             	shl    $0x2,%eax
    19d0:	01 d0                	add    %edx,%eax
    19d2:	29 c1                	sub    %eax,%ecx
    19d4:	89 ca                	mov    %ecx,%edx
    19d6:	83 fa 01             	cmp    $0x1,%edx
    19d9:	75 16                	jne    19f1 <concreate+0xce>
      link("C0", file);
    19db:	83 ec 08             	sub    $0x8,%esp
    19de:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19e1:	50                   	push   %eax
    19e2:	68 c6 4c 00 00       	push   $0x4cc6
    19e7:	e8 46 25 00 00       	call   3f32 <link>
    19ec:	83 c4 10             	add    $0x10,%esp
    19ef:	eb 46                	jmp    1a37 <concreate+0x114>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    19f1:	83 ec 08             	sub    $0x8,%esp
    19f4:	68 02 02 00 00       	push   $0x202
    19f9:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19fc:	50                   	push   %eax
    19fd:	e8 10 25 00 00       	call   3f12 <open>
    1a02:	83 c4 10             	add    $0x10,%esp
    1a05:	89 45 ec             	mov    %eax,-0x14(%ebp)
      if(fd < 0){
    1a08:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a0c:	79 1b                	jns    1a29 <concreate+0x106>
        printf(1, "concreate create %s failed\n", file);
    1a0e:	83 ec 04             	sub    $0x4,%esp
    1a11:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a14:	50                   	push   %eax
    1a15:	68 c9 4c 00 00       	push   $0x4cc9
    1a1a:	6a 01                	push   $0x1
    1a1c:	e8 25 26 00 00       	call   4046 <printf>
    1a21:	83 c4 10             	add    $0x10,%esp
        exit();
    1a24:	e8 a9 24 00 00       	call   3ed2 <exit>
      }
      close(fd);
    1a29:	83 ec 0c             	sub    $0xc,%esp
    1a2c:	ff 75 ec             	push   -0x14(%ebp)
    1a2f:	e8 c6 24 00 00       	call   3efa <close>
    1a34:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1a37:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a3b:	75 05                	jne    1a42 <concreate+0x11f>
      exit();
    1a3d:	e8 90 24 00 00       	call   3ed2 <exit>
    else
      wait();
    1a42:	e8 93 24 00 00       	call   3eda <wait>
  for(i = 0; i < 40; i++){
    1a47:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1a4b:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1a4f:	0f 8e fa fe ff ff    	jle    194f <concreate+0x2c>
  }

  memset(fa, 0, sizeof(fa));
    1a55:	83 ec 04             	sub    $0x4,%esp
    1a58:	6a 28                	push   $0x28
    1a5a:	6a 00                	push   $0x0
    1a5c:	8d 45 bd             	lea    -0x43(%ebp),%eax
    1a5f:	50                   	push   %eax
    1a60:	e8 d2 22 00 00       	call   3d37 <memset>
    1a65:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1a68:	83 ec 08             	sub    $0x8,%esp
    1a6b:	6a 00                	push   $0x0
    1a6d:	68 8b 4c 00 00       	push   $0x4c8b
    1a72:	e8 9b 24 00 00       	call   3f12 <open>
    1a77:	83 c4 10             	add    $0x10,%esp
    1a7a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  n = 0;
    1a7d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    1a84:	e9 99 00 00 00       	jmp    1b22 <concreate+0x1ff>
    if(de.inum == 0)
    1a89:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    1a8d:	66 85 c0             	test   %ax,%ax
    1a90:	0f 84 8b 00 00 00    	je     1b21 <concreate+0x1fe>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1a96:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    1a9a:	3c 43                	cmp    $0x43,%al
    1a9c:	0f 85 80 00 00 00    	jne    1b22 <concreate+0x1ff>
    1aa2:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1aa6:	84 c0                	test   %al,%al
    1aa8:	75 78                	jne    1b22 <concreate+0x1ff>
      i = de.name[1] - '0';
    1aaa:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    1aae:	0f be c0             	movsbl %al,%eax
    1ab1:	83 e8 30             	sub    $0x30,%eax
    1ab4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1ab7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1abb:	78 08                	js     1ac5 <concreate+0x1a2>
    1abd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ac0:	83 f8 27             	cmp    $0x27,%eax
    1ac3:	76 1e                	jbe    1ae3 <concreate+0x1c0>
        printf(1, "concreate weird file %s\n", de.name);
    1ac5:	83 ec 04             	sub    $0x4,%esp
    1ac8:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1acb:	83 c0 02             	add    $0x2,%eax
    1ace:	50                   	push   %eax
    1acf:	68 e5 4c 00 00       	push   $0x4ce5
    1ad4:	6a 01                	push   $0x1
    1ad6:	e8 6b 25 00 00       	call   4046 <printf>
    1adb:	83 c4 10             	add    $0x10,%esp
        exit();
    1ade:	e8 ef 23 00 00       	call   3ed2 <exit>
      }
      if(fa[i]){
    1ae3:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1ae9:	01 d0                	add    %edx,%eax
    1aeb:	0f b6 00             	movzbl (%eax),%eax
    1aee:	84 c0                	test   %al,%al
    1af0:	74 1e                	je     1b10 <concreate+0x1ed>
        printf(1, "concreate duplicate file %s\n", de.name);
    1af2:	83 ec 04             	sub    $0x4,%esp
    1af5:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1af8:	83 c0 02             	add    $0x2,%eax
    1afb:	50                   	push   %eax
    1afc:	68 fe 4c 00 00       	push   $0x4cfe
    1b01:	6a 01                	push   $0x1
    1b03:	e8 3e 25 00 00       	call   4046 <printf>
    1b08:	83 c4 10             	add    $0x10,%esp
        exit();
    1b0b:	e8 c2 23 00 00       	call   3ed2 <exit>
      }
      fa[i] = 1;
    1b10:	8d 55 bd             	lea    -0x43(%ebp),%edx
    1b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b16:	01 d0                	add    %edx,%eax
    1b18:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1b1b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1b1f:	eb 01                	jmp    1b22 <concreate+0x1ff>
      continue;
    1b21:	90                   	nop
  while(read(fd, &de, sizeof(de)) > 0){
    1b22:	83 ec 04             	sub    $0x4,%esp
    1b25:	6a 10                	push   $0x10
    1b27:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1b2a:	50                   	push   %eax
    1b2b:	ff 75 ec             	push   -0x14(%ebp)
    1b2e:	e8 b7 23 00 00       	call   3eea <read>
    1b33:	83 c4 10             	add    $0x10,%esp
    1b36:	85 c0                	test   %eax,%eax
    1b38:	0f 8f 4b ff ff ff    	jg     1a89 <concreate+0x166>
    }
  }
  close(fd);
    1b3e:	83 ec 0c             	sub    $0xc,%esp
    1b41:	ff 75 ec             	push   -0x14(%ebp)
    1b44:	e8 b1 23 00 00       	call   3efa <close>
    1b49:	83 c4 10             	add    $0x10,%esp

  if(n != 40){
    1b4c:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1b50:	74 17                	je     1b69 <concreate+0x246>
    printf(1, "concreate not enough files in directory listing\n");
    1b52:	83 ec 08             	sub    $0x8,%esp
    1b55:	68 1c 4d 00 00       	push   $0x4d1c
    1b5a:	6a 01                	push   $0x1
    1b5c:	e8 e5 24 00 00       	call   4046 <printf>
    1b61:	83 c4 10             	add    $0x10,%esp
    exit();
    1b64:	e8 69 23 00 00       	call   3ed2 <exit>
  }

  for(i = 0; i < 40; i++){
    1b69:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1b70:	e9 43 01 00 00       	jmp    1cb8 <concreate+0x395>
    file[1] = '0' + i;
    1b75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1b78:	83 c0 30             	add    $0x30,%eax
    1b7b:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    1b7e:	e8 47 23 00 00       	call   3eca <fork>
    1b83:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pid < 0){
    1b86:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1b8a:	79 17                	jns    1ba3 <concreate+0x280>
      printf(1, "fork failed\n");
    1b8c:	83 ec 08             	sub    $0x8,%esp
    1b8f:	68 a1 44 00 00       	push   $0x44a1
    1b94:	6a 01                	push   $0x1
    1b96:	e8 ab 24 00 00       	call   4046 <printf>
    1b9b:	83 c4 10             	add    $0x10,%esp
      exit();
    1b9e:	e8 2f 23 00 00       	call   3ed2 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1ba3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1ba6:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1bab:	89 c8                	mov    %ecx,%eax
    1bad:	f7 ea                	imul   %edx
    1baf:	89 c8                	mov    %ecx,%eax
    1bb1:	c1 f8 1f             	sar    $0x1f,%eax
    1bb4:	29 c2                	sub    %eax,%edx
    1bb6:	89 d0                	mov    %edx,%eax
    1bb8:	01 c0                	add    %eax,%eax
    1bba:	01 d0                	add    %edx,%eax
    1bbc:	29 c1                	sub    %eax,%ecx
    1bbe:	89 ca                	mov    %ecx,%edx
    1bc0:	85 d2                	test   %edx,%edx
    1bc2:	75 06                	jne    1bca <concreate+0x2a7>
    1bc4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1bc8:	74 28                	je     1bf2 <concreate+0x2cf>
       ((i % 3) == 1 && pid != 0)){
    1bca:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1bcd:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1bd2:	89 c8                	mov    %ecx,%eax
    1bd4:	f7 ea                	imul   %edx
    1bd6:	89 c8                	mov    %ecx,%eax
    1bd8:	c1 f8 1f             	sar    $0x1f,%eax
    1bdb:	29 c2                	sub    %eax,%edx
    1bdd:	89 d0                	mov    %edx,%eax
    1bdf:	01 c0                	add    %eax,%eax
    1be1:	01 d0                	add    %edx,%eax
    1be3:	29 c1                	sub    %eax,%ecx
    1be5:	89 ca                	mov    %ecx,%edx
    if(((i % 3) == 0 && pid == 0) ||
    1be7:	83 fa 01             	cmp    $0x1,%edx
    1bea:	75 7c                	jne    1c68 <concreate+0x345>
       ((i % 3) == 1 && pid != 0)){
    1bec:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1bf0:	74 76                	je     1c68 <concreate+0x345>
      close(open(file, 0));
    1bf2:	83 ec 08             	sub    $0x8,%esp
    1bf5:	6a 00                	push   $0x0
    1bf7:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bfa:	50                   	push   %eax
    1bfb:	e8 12 23 00 00       	call   3f12 <open>
    1c00:	83 c4 10             	add    $0x10,%esp
    1c03:	83 ec 0c             	sub    $0xc,%esp
    1c06:	50                   	push   %eax
    1c07:	e8 ee 22 00 00       	call   3efa <close>
    1c0c:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c0f:	83 ec 08             	sub    $0x8,%esp
    1c12:	6a 00                	push   $0x0
    1c14:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c17:	50                   	push   %eax
    1c18:	e8 f5 22 00 00       	call   3f12 <open>
    1c1d:	83 c4 10             	add    $0x10,%esp
    1c20:	83 ec 0c             	sub    $0xc,%esp
    1c23:	50                   	push   %eax
    1c24:	e8 d1 22 00 00       	call   3efa <close>
    1c29:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c2c:	83 ec 08             	sub    $0x8,%esp
    1c2f:	6a 00                	push   $0x0
    1c31:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c34:	50                   	push   %eax
    1c35:	e8 d8 22 00 00       	call   3f12 <open>
    1c3a:	83 c4 10             	add    $0x10,%esp
    1c3d:	83 ec 0c             	sub    $0xc,%esp
    1c40:	50                   	push   %eax
    1c41:	e8 b4 22 00 00       	call   3efa <close>
    1c46:	83 c4 10             	add    $0x10,%esp
      close(open(file, 0));
    1c49:	83 ec 08             	sub    $0x8,%esp
    1c4c:	6a 00                	push   $0x0
    1c4e:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c51:	50                   	push   %eax
    1c52:	e8 bb 22 00 00       	call   3f12 <open>
    1c57:	83 c4 10             	add    $0x10,%esp
    1c5a:	83 ec 0c             	sub    $0xc,%esp
    1c5d:	50                   	push   %eax
    1c5e:	e8 97 22 00 00       	call   3efa <close>
    1c63:	83 c4 10             	add    $0x10,%esp
    1c66:	eb 3c                	jmp    1ca4 <concreate+0x381>
    } else {
      unlink(file);
    1c68:	83 ec 0c             	sub    $0xc,%esp
    1c6b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c6e:	50                   	push   %eax
    1c6f:	e8 ae 22 00 00       	call   3f22 <unlink>
    1c74:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1c77:	83 ec 0c             	sub    $0xc,%esp
    1c7a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c7d:	50                   	push   %eax
    1c7e:	e8 9f 22 00 00       	call   3f22 <unlink>
    1c83:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1c86:	83 ec 0c             	sub    $0xc,%esp
    1c89:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c8c:	50                   	push   %eax
    1c8d:	e8 90 22 00 00       	call   3f22 <unlink>
    1c92:	83 c4 10             	add    $0x10,%esp
      unlink(file);
    1c95:	83 ec 0c             	sub    $0xc,%esp
    1c98:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c9b:	50                   	push   %eax
    1c9c:	e8 81 22 00 00       	call   3f22 <unlink>
    1ca1:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
    1ca4:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1ca8:	75 05                	jne    1caf <concreate+0x38c>
      exit();
    1caa:	e8 23 22 00 00       	call   3ed2 <exit>
    else
      wait();
    1caf:	e8 26 22 00 00       	call   3eda <wait>
  for(i = 0; i < 40; i++){
    1cb4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1cb8:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1cbc:	0f 8e b3 fe ff ff    	jle    1b75 <concreate+0x252>
  }

  printf(1, "concreate ok\n");
    1cc2:	83 ec 08             	sub    $0x8,%esp
    1cc5:	68 4d 4d 00 00       	push   $0x4d4d
    1cca:	6a 01                	push   $0x1
    1ccc:	e8 75 23 00 00       	call   4046 <printf>
    1cd1:	83 c4 10             	add    $0x10,%esp
}
    1cd4:	90                   	nop
    1cd5:	c9                   	leave
    1cd6:	c3                   	ret

00001cd7 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1cd7:	55                   	push   %ebp
    1cd8:	89 e5                	mov    %esp,%ebp
    1cda:	83 ec 18             	sub    $0x18,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1cdd:	83 ec 08             	sub    $0x8,%esp
    1ce0:	68 5b 4d 00 00       	push   $0x4d5b
    1ce5:	6a 01                	push   $0x1
    1ce7:	e8 5a 23 00 00       	call   4046 <printf>
    1cec:	83 c4 10             	add    $0x10,%esp

  unlink("x");
    1cef:	83 ec 0c             	sub    $0xc,%esp
    1cf2:	68 d7 48 00 00       	push   $0x48d7
    1cf7:	e8 26 22 00 00       	call   3f22 <unlink>
    1cfc:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    1cff:	e8 c6 21 00 00       	call   3eca <fork>
    1d04:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1d07:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d0b:	79 17                	jns    1d24 <linkunlink+0x4d>
    printf(1, "fork failed\n");
    1d0d:	83 ec 08             	sub    $0x8,%esp
    1d10:	68 a1 44 00 00       	push   $0x44a1
    1d15:	6a 01                	push   $0x1
    1d17:	e8 2a 23 00 00       	call   4046 <printf>
    1d1c:	83 c4 10             	add    $0x10,%esp
    exit();
    1d1f:	e8 ae 21 00 00       	call   3ed2 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1d24:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d28:	74 07                	je     1d31 <linkunlink+0x5a>
    1d2a:	b8 01 00 00 00       	mov    $0x1,%eax
    1d2f:	eb 05                	jmp    1d36 <linkunlink+0x5f>
    1d31:	b8 61 00 00 00       	mov    $0x61,%eax
    1d36:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1d39:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1d40:	e9 98 00 00 00       	jmp    1ddd <linkunlink+0x106>
    x = x * 1103515245 + 12345;
    1d45:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1d48:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1d4e:	05 39 30 00 00       	add    $0x3039,%eax
    1d53:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1d56:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1d59:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1d5e:	89 c8                	mov    %ecx,%eax
    1d60:	f7 e2                	mul    %edx
    1d62:	d1 ea                	shr    $1,%edx
    1d64:	89 d0                	mov    %edx,%eax
    1d66:	01 c0                	add    %eax,%eax
    1d68:	01 d0                	add    %edx,%eax
    1d6a:	29 c1                	sub    %eax,%ecx
    1d6c:	89 ca                	mov    %ecx,%edx
    1d6e:	85 d2                	test   %edx,%edx
    1d70:	75 23                	jne    1d95 <linkunlink+0xbe>
      close(open("x", O_RDWR | O_CREATE));
    1d72:	83 ec 08             	sub    $0x8,%esp
    1d75:	68 02 02 00 00       	push   $0x202
    1d7a:	68 d7 48 00 00       	push   $0x48d7
    1d7f:	e8 8e 21 00 00       	call   3f12 <open>
    1d84:	83 c4 10             	add    $0x10,%esp
    1d87:	83 ec 0c             	sub    $0xc,%esp
    1d8a:	50                   	push   %eax
    1d8b:	e8 6a 21 00 00       	call   3efa <close>
    1d90:	83 c4 10             	add    $0x10,%esp
    1d93:	eb 44                	jmp    1dd9 <linkunlink+0x102>
    } else if((x % 3) == 1){
    1d95:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1d98:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1d9d:	89 c8                	mov    %ecx,%eax
    1d9f:	f7 e2                	mul    %edx
    1da1:	d1 ea                	shr    $1,%edx
    1da3:	89 d0                	mov    %edx,%eax
    1da5:	01 c0                	add    %eax,%eax
    1da7:	01 d0                	add    %edx,%eax
    1da9:	29 c1                	sub    %eax,%ecx
    1dab:	89 ca                	mov    %ecx,%edx
    1dad:	83 fa 01             	cmp    $0x1,%edx
    1db0:	75 17                	jne    1dc9 <linkunlink+0xf2>
      link("cat", "x");
    1db2:	83 ec 08             	sub    $0x8,%esp
    1db5:	68 d7 48 00 00       	push   $0x48d7
    1dba:	68 6c 4d 00 00       	push   $0x4d6c
    1dbf:	e8 6e 21 00 00       	call   3f32 <link>
    1dc4:	83 c4 10             	add    $0x10,%esp
    1dc7:	eb 10                	jmp    1dd9 <linkunlink+0x102>
    } else {
      unlink("x");
    1dc9:	83 ec 0c             	sub    $0xc,%esp
    1dcc:	68 d7 48 00 00       	push   $0x48d7
    1dd1:	e8 4c 21 00 00       	call   3f22 <unlink>
    1dd6:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1dd9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1ddd:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1de1:	0f 8e 5e ff ff ff    	jle    1d45 <linkunlink+0x6e>
    }
  }

  if(pid)
    1de7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1deb:	74 07                	je     1df4 <linkunlink+0x11d>
    wait();
    1ded:	e8 e8 20 00 00       	call   3eda <wait>
    1df2:	eb 05                	jmp    1df9 <linkunlink+0x122>
  else 
    exit();
    1df4:	e8 d9 20 00 00       	call   3ed2 <exit>

  printf(1, "linkunlink ok\n");
    1df9:	83 ec 08             	sub    $0x8,%esp
    1dfc:	68 70 4d 00 00       	push   $0x4d70
    1e01:	6a 01                	push   $0x1
    1e03:	e8 3e 22 00 00       	call   4046 <printf>
    1e08:	83 c4 10             	add    $0x10,%esp
}
    1e0b:	90                   	nop
    1e0c:	c9                   	leave
    1e0d:	c3                   	ret

00001e0e <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1e0e:	55                   	push   %ebp
    1e0f:	89 e5                	mov    %esp,%ebp
    1e11:	83 ec 28             	sub    $0x28,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1e14:	83 ec 08             	sub    $0x8,%esp
    1e17:	68 7f 4d 00 00       	push   $0x4d7f
    1e1c:	6a 01                	push   $0x1
    1e1e:	e8 23 22 00 00       	call   4046 <printf>
    1e23:	83 c4 10             	add    $0x10,%esp
  unlink("bd");
    1e26:	83 ec 0c             	sub    $0xc,%esp
    1e29:	68 8c 4d 00 00       	push   $0x4d8c
    1e2e:	e8 ef 20 00 00       	call   3f22 <unlink>
    1e33:	83 c4 10             	add    $0x10,%esp

  fd = open("bd", O_CREATE);
    1e36:	83 ec 08             	sub    $0x8,%esp
    1e39:	68 00 02 00 00       	push   $0x200
    1e3e:	68 8c 4d 00 00       	push   $0x4d8c
    1e43:	e8 ca 20 00 00       	call   3f12 <open>
    1e48:	83 c4 10             	add    $0x10,%esp
    1e4b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1e4e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1e52:	79 17                	jns    1e6b <bigdir+0x5d>
    printf(1, "bigdir create failed\n");
    1e54:	83 ec 08             	sub    $0x8,%esp
    1e57:	68 8f 4d 00 00       	push   $0x4d8f
    1e5c:	6a 01                	push   $0x1
    1e5e:	e8 e3 21 00 00       	call   4046 <printf>
    1e63:	83 c4 10             	add    $0x10,%esp
    exit();
    1e66:	e8 67 20 00 00       	call   3ed2 <exit>
  }
  close(fd);
    1e6b:	83 ec 0c             	sub    $0xc,%esp
    1e6e:	ff 75 f0             	push   -0x10(%ebp)
    1e71:	e8 84 20 00 00       	call   3efa <close>
    1e76:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 500; i++){
    1e79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1e80:	eb 69                	jmp    1eeb <bigdir+0xdd>
    name[0] = 'x';
    1e82:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1e86:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e89:	8d 50 3f             	lea    0x3f(%eax),%edx
    1e8c:	85 c0                	test   %eax,%eax
    1e8e:	0f 48 c2             	cmovs  %edx,%eax
    1e91:	c1 f8 06             	sar    $0x6,%eax
    1e94:	83 c0 30             	add    $0x30,%eax
    1e97:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1e9a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1e9d:	89 d0                	mov    %edx,%eax
    1e9f:	c1 f8 1f             	sar    $0x1f,%eax
    1ea2:	c1 e8 1a             	shr    $0x1a,%eax
    1ea5:	01 c2                	add    %eax,%edx
    1ea7:	83 e2 3f             	and    $0x3f,%edx
    1eaa:	29 c2                	sub    %eax,%edx
    1eac:	89 d0                	mov    %edx,%eax
    1eae:	83 c0 30             	add    $0x30,%eax
    1eb1:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1eb4:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1eb8:	83 ec 08             	sub    $0x8,%esp
    1ebb:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1ebe:	50                   	push   %eax
    1ebf:	68 8c 4d 00 00       	push   $0x4d8c
    1ec4:	e8 69 20 00 00       	call   3f32 <link>
    1ec9:	83 c4 10             	add    $0x10,%esp
    1ecc:	85 c0                	test   %eax,%eax
    1ece:	74 17                	je     1ee7 <bigdir+0xd9>
      printf(1, "bigdir link failed\n");
    1ed0:	83 ec 08             	sub    $0x8,%esp
    1ed3:	68 a5 4d 00 00       	push   $0x4da5
    1ed8:	6a 01                	push   $0x1
    1eda:	e8 67 21 00 00       	call   4046 <printf>
    1edf:	83 c4 10             	add    $0x10,%esp
      exit();
    1ee2:	e8 eb 1f 00 00       	call   3ed2 <exit>
  for(i = 0; i < 500; i++){
    1ee7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1eeb:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1ef2:	7e 8e                	jle    1e82 <bigdir+0x74>
    }
  }

  unlink("bd");
    1ef4:	83 ec 0c             	sub    $0xc,%esp
    1ef7:	68 8c 4d 00 00       	push   $0x4d8c
    1efc:	e8 21 20 00 00       	call   3f22 <unlink>
    1f01:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    1f04:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1f0b:	eb 64                	jmp    1f71 <bigdir+0x163>
    name[0] = 'x';
    1f0d:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1f11:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1f14:	8d 50 3f             	lea    0x3f(%eax),%edx
    1f17:	85 c0                	test   %eax,%eax
    1f19:	0f 48 c2             	cmovs  %edx,%eax
    1f1c:	c1 f8 06             	sar    $0x6,%eax
    1f1f:	83 c0 30             	add    $0x30,%eax
    1f22:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1f25:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1f28:	89 d0                	mov    %edx,%eax
    1f2a:	c1 f8 1f             	sar    $0x1f,%eax
    1f2d:	c1 e8 1a             	shr    $0x1a,%eax
    1f30:	01 c2                	add    %eax,%edx
    1f32:	83 e2 3f             	and    $0x3f,%edx
    1f35:	29 c2                	sub    %eax,%edx
    1f37:	89 d0                	mov    %edx,%eax
    1f39:	83 c0 30             	add    $0x30,%eax
    1f3c:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1f3f:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1f43:	83 ec 0c             	sub    $0xc,%esp
    1f46:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1f49:	50                   	push   %eax
    1f4a:	e8 d3 1f 00 00       	call   3f22 <unlink>
    1f4f:	83 c4 10             	add    $0x10,%esp
    1f52:	85 c0                	test   %eax,%eax
    1f54:	74 17                	je     1f6d <bigdir+0x15f>
      printf(1, "bigdir unlink failed");
    1f56:	83 ec 08             	sub    $0x8,%esp
    1f59:	68 b9 4d 00 00       	push   $0x4db9
    1f5e:	6a 01                	push   $0x1
    1f60:	e8 e1 20 00 00       	call   4046 <printf>
    1f65:	83 c4 10             	add    $0x10,%esp
      exit();
    1f68:	e8 65 1f 00 00       	call   3ed2 <exit>
  for(i = 0; i < 500; i++){
    1f6d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1f71:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1f78:	7e 93                	jle    1f0d <bigdir+0xff>
    }
  }

  printf(1, "bigdir ok\n");
    1f7a:	83 ec 08             	sub    $0x8,%esp
    1f7d:	68 ce 4d 00 00       	push   $0x4dce
    1f82:	6a 01                	push   $0x1
    1f84:	e8 bd 20 00 00       	call   4046 <printf>
    1f89:	83 c4 10             	add    $0x10,%esp
}
    1f8c:	90                   	nop
    1f8d:	c9                   	leave
    1f8e:	c3                   	ret

00001f8f <subdir>:

void
subdir(void)
{
    1f8f:	55                   	push   %ebp
    1f90:	89 e5                	mov    %esp,%ebp
    1f92:	83 ec 18             	sub    $0x18,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1f95:	83 ec 08             	sub    $0x8,%esp
    1f98:	68 d9 4d 00 00       	push   $0x4dd9
    1f9d:	6a 01                	push   $0x1
    1f9f:	e8 a2 20 00 00       	call   4046 <printf>
    1fa4:	83 c4 10             	add    $0x10,%esp

  unlink("ff");
    1fa7:	83 ec 0c             	sub    $0xc,%esp
    1faa:	68 e6 4d 00 00       	push   $0x4de6
    1faf:	e8 6e 1f 00 00       	call   3f22 <unlink>
    1fb4:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dd") != 0){
    1fb7:	83 ec 0c             	sub    $0xc,%esp
    1fba:	68 e9 4d 00 00       	push   $0x4de9
    1fbf:	e8 76 1f 00 00       	call   3f3a <mkdir>
    1fc4:	83 c4 10             	add    $0x10,%esp
    1fc7:	85 c0                	test   %eax,%eax
    1fc9:	74 17                	je     1fe2 <subdir+0x53>
    printf(1, "subdir mkdir dd failed\n");
    1fcb:	83 ec 08             	sub    $0x8,%esp
    1fce:	68 ec 4d 00 00       	push   $0x4dec
    1fd3:	6a 01                	push   $0x1
    1fd5:	e8 6c 20 00 00       	call   4046 <printf>
    1fda:	83 c4 10             	add    $0x10,%esp
    exit();
    1fdd:	e8 f0 1e 00 00       	call   3ed2 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1fe2:	83 ec 08             	sub    $0x8,%esp
    1fe5:	68 02 02 00 00       	push   $0x202
    1fea:	68 04 4e 00 00       	push   $0x4e04
    1fef:	e8 1e 1f 00 00       	call   3f12 <open>
    1ff4:	83 c4 10             	add    $0x10,%esp
    1ff7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1ffa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1ffe:	79 17                	jns    2017 <subdir+0x88>
    printf(1, "create dd/ff failed\n");
    2000:	83 ec 08             	sub    $0x8,%esp
    2003:	68 0a 4e 00 00       	push   $0x4e0a
    2008:	6a 01                	push   $0x1
    200a:	e8 37 20 00 00       	call   4046 <printf>
    200f:	83 c4 10             	add    $0x10,%esp
    exit();
    2012:	e8 bb 1e 00 00       	call   3ed2 <exit>
  }
  write(fd, "ff", 2);
    2017:	83 ec 04             	sub    $0x4,%esp
    201a:	6a 02                	push   $0x2
    201c:	68 e6 4d 00 00       	push   $0x4de6
    2021:	ff 75 f4             	push   -0xc(%ebp)
    2024:	e8 c9 1e 00 00       	call   3ef2 <write>
    2029:	83 c4 10             	add    $0x10,%esp
  close(fd);
    202c:	83 ec 0c             	sub    $0xc,%esp
    202f:	ff 75 f4             	push   -0xc(%ebp)
    2032:	e8 c3 1e 00 00       	call   3efa <close>
    2037:	83 c4 10             	add    $0x10,%esp
  
  if(unlink("dd") >= 0){
    203a:	83 ec 0c             	sub    $0xc,%esp
    203d:	68 e9 4d 00 00       	push   $0x4de9
    2042:	e8 db 1e 00 00       	call   3f22 <unlink>
    2047:	83 c4 10             	add    $0x10,%esp
    204a:	85 c0                	test   %eax,%eax
    204c:	78 17                	js     2065 <subdir+0xd6>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    204e:	83 ec 08             	sub    $0x8,%esp
    2051:	68 20 4e 00 00       	push   $0x4e20
    2056:	6a 01                	push   $0x1
    2058:	e8 e9 1f 00 00       	call   4046 <printf>
    205d:	83 c4 10             	add    $0x10,%esp
    exit();
    2060:	e8 6d 1e 00 00       	call   3ed2 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    2065:	83 ec 0c             	sub    $0xc,%esp
    2068:	68 46 4e 00 00       	push   $0x4e46
    206d:	e8 c8 1e 00 00       	call   3f3a <mkdir>
    2072:	83 c4 10             	add    $0x10,%esp
    2075:	85 c0                	test   %eax,%eax
    2077:	74 17                	je     2090 <subdir+0x101>
    printf(1, "subdir mkdir dd/dd failed\n");
    2079:	83 ec 08             	sub    $0x8,%esp
    207c:	68 4d 4e 00 00       	push   $0x4e4d
    2081:	6a 01                	push   $0x1
    2083:	e8 be 1f 00 00       	call   4046 <printf>
    2088:	83 c4 10             	add    $0x10,%esp
    exit();
    208b:	e8 42 1e 00 00       	call   3ed2 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    2090:	83 ec 08             	sub    $0x8,%esp
    2093:	68 02 02 00 00       	push   $0x202
    2098:	68 68 4e 00 00       	push   $0x4e68
    209d:	e8 70 1e 00 00       	call   3f12 <open>
    20a2:	83 c4 10             	add    $0x10,%esp
    20a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    20a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    20ac:	79 17                	jns    20c5 <subdir+0x136>
    printf(1, "create dd/dd/ff failed\n");
    20ae:	83 ec 08             	sub    $0x8,%esp
    20b1:	68 71 4e 00 00       	push   $0x4e71
    20b6:	6a 01                	push   $0x1
    20b8:	e8 89 1f 00 00       	call   4046 <printf>
    20bd:	83 c4 10             	add    $0x10,%esp
    exit();
    20c0:	e8 0d 1e 00 00       	call   3ed2 <exit>
  }
  write(fd, "FF", 2);
    20c5:	83 ec 04             	sub    $0x4,%esp
    20c8:	6a 02                	push   $0x2
    20ca:	68 89 4e 00 00       	push   $0x4e89
    20cf:	ff 75 f4             	push   -0xc(%ebp)
    20d2:	e8 1b 1e 00 00       	call   3ef2 <write>
    20d7:	83 c4 10             	add    $0x10,%esp
  close(fd);
    20da:	83 ec 0c             	sub    $0xc,%esp
    20dd:	ff 75 f4             	push   -0xc(%ebp)
    20e0:	e8 15 1e 00 00       	call   3efa <close>
    20e5:	83 c4 10             	add    $0x10,%esp

  fd = open("dd/dd/../ff", 0);
    20e8:	83 ec 08             	sub    $0x8,%esp
    20eb:	6a 00                	push   $0x0
    20ed:	68 8c 4e 00 00       	push   $0x4e8c
    20f2:	e8 1b 1e 00 00       	call   3f12 <open>
    20f7:	83 c4 10             	add    $0x10,%esp
    20fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    20fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2101:	79 17                	jns    211a <subdir+0x18b>
    printf(1, "open dd/dd/../ff failed\n");
    2103:	83 ec 08             	sub    $0x8,%esp
    2106:	68 98 4e 00 00       	push   $0x4e98
    210b:	6a 01                	push   $0x1
    210d:	e8 34 1f 00 00       	call   4046 <printf>
    2112:	83 c4 10             	add    $0x10,%esp
    exit();
    2115:	e8 b8 1d 00 00       	call   3ed2 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    211a:	83 ec 04             	sub    $0x4,%esp
    211d:	68 00 20 00 00       	push   $0x2000
    2122:	68 e0 62 00 00       	push   $0x62e0
    2127:	ff 75 f4             	push   -0xc(%ebp)
    212a:	e8 bb 1d 00 00       	call   3eea <read>
    212f:	83 c4 10             	add    $0x10,%esp
    2132:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    2135:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    2139:	75 0b                	jne    2146 <subdir+0x1b7>
    213b:	0f b6 05 e0 62 00 00 	movzbl 0x62e0,%eax
    2142:	3c 66                	cmp    $0x66,%al
    2144:	74 17                	je     215d <subdir+0x1ce>
    printf(1, "dd/dd/../ff wrong content\n");
    2146:	83 ec 08             	sub    $0x8,%esp
    2149:	68 b1 4e 00 00       	push   $0x4eb1
    214e:	6a 01                	push   $0x1
    2150:	e8 f1 1e 00 00       	call   4046 <printf>
    2155:	83 c4 10             	add    $0x10,%esp
    exit();
    2158:	e8 75 1d 00 00       	call   3ed2 <exit>
  }
  close(fd);
    215d:	83 ec 0c             	sub    $0xc,%esp
    2160:	ff 75 f4             	push   -0xc(%ebp)
    2163:	e8 92 1d 00 00       	call   3efa <close>
    2168:	83 c4 10             	add    $0x10,%esp

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    216b:	83 ec 08             	sub    $0x8,%esp
    216e:	68 cc 4e 00 00       	push   $0x4ecc
    2173:	68 68 4e 00 00       	push   $0x4e68
    2178:	e8 b5 1d 00 00       	call   3f32 <link>
    217d:	83 c4 10             	add    $0x10,%esp
    2180:	85 c0                	test   %eax,%eax
    2182:	74 17                	je     219b <subdir+0x20c>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2184:	83 ec 08             	sub    $0x8,%esp
    2187:	68 d8 4e 00 00       	push   $0x4ed8
    218c:	6a 01                	push   $0x1
    218e:	e8 b3 1e 00 00       	call   4046 <printf>
    2193:	83 c4 10             	add    $0x10,%esp
    exit();
    2196:	e8 37 1d 00 00       	call   3ed2 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    219b:	83 ec 0c             	sub    $0xc,%esp
    219e:	68 68 4e 00 00       	push   $0x4e68
    21a3:	e8 7a 1d 00 00       	call   3f22 <unlink>
    21a8:	83 c4 10             	add    $0x10,%esp
    21ab:	85 c0                	test   %eax,%eax
    21ad:	74 17                	je     21c6 <subdir+0x237>
    printf(1, "unlink dd/dd/ff failed\n");
    21af:	83 ec 08             	sub    $0x8,%esp
    21b2:	68 f9 4e 00 00       	push   $0x4ef9
    21b7:	6a 01                	push   $0x1
    21b9:	e8 88 1e 00 00       	call   4046 <printf>
    21be:	83 c4 10             	add    $0x10,%esp
    exit();
    21c1:	e8 0c 1d 00 00       	call   3ed2 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    21c6:	83 ec 08             	sub    $0x8,%esp
    21c9:	6a 00                	push   $0x0
    21cb:	68 68 4e 00 00       	push   $0x4e68
    21d0:	e8 3d 1d 00 00       	call   3f12 <open>
    21d5:	83 c4 10             	add    $0x10,%esp
    21d8:	85 c0                	test   %eax,%eax
    21da:	78 17                	js     21f3 <subdir+0x264>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    21dc:	83 ec 08             	sub    $0x8,%esp
    21df:	68 14 4f 00 00       	push   $0x4f14
    21e4:	6a 01                	push   $0x1
    21e6:	e8 5b 1e 00 00       	call   4046 <printf>
    21eb:	83 c4 10             	add    $0x10,%esp
    exit();
    21ee:	e8 df 1c 00 00       	call   3ed2 <exit>
  }

  if(chdir("dd") != 0){
    21f3:	83 ec 0c             	sub    $0xc,%esp
    21f6:	68 e9 4d 00 00       	push   $0x4de9
    21fb:	e8 42 1d 00 00       	call   3f42 <chdir>
    2200:	83 c4 10             	add    $0x10,%esp
    2203:	85 c0                	test   %eax,%eax
    2205:	74 17                	je     221e <subdir+0x28f>
    printf(1, "chdir dd failed\n");
    2207:	83 ec 08             	sub    $0x8,%esp
    220a:	68 38 4f 00 00       	push   $0x4f38
    220f:	6a 01                	push   $0x1
    2211:	e8 30 1e 00 00       	call   4046 <printf>
    2216:	83 c4 10             	add    $0x10,%esp
    exit();
    2219:	e8 b4 1c 00 00       	call   3ed2 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    221e:	83 ec 0c             	sub    $0xc,%esp
    2221:	68 49 4f 00 00       	push   $0x4f49
    2226:	e8 17 1d 00 00       	call   3f42 <chdir>
    222b:	83 c4 10             	add    $0x10,%esp
    222e:	85 c0                	test   %eax,%eax
    2230:	74 17                	je     2249 <subdir+0x2ba>
    printf(1, "chdir dd/../../dd failed\n");
    2232:	83 ec 08             	sub    $0x8,%esp
    2235:	68 55 4f 00 00       	push   $0x4f55
    223a:	6a 01                	push   $0x1
    223c:	e8 05 1e 00 00       	call   4046 <printf>
    2241:	83 c4 10             	add    $0x10,%esp
    exit();
    2244:	e8 89 1c 00 00       	call   3ed2 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    2249:	83 ec 0c             	sub    $0xc,%esp
    224c:	68 6f 4f 00 00       	push   $0x4f6f
    2251:	e8 ec 1c 00 00       	call   3f42 <chdir>
    2256:	83 c4 10             	add    $0x10,%esp
    2259:	85 c0                	test   %eax,%eax
    225b:	74 17                	je     2274 <subdir+0x2e5>
    printf(1, "chdir dd/../../dd failed\n");
    225d:	83 ec 08             	sub    $0x8,%esp
    2260:	68 55 4f 00 00       	push   $0x4f55
    2265:	6a 01                	push   $0x1
    2267:	e8 da 1d 00 00       	call   4046 <printf>
    226c:	83 c4 10             	add    $0x10,%esp
    exit();
    226f:	e8 5e 1c 00 00       	call   3ed2 <exit>
  }
  if(chdir("./..") != 0){
    2274:	83 ec 0c             	sub    $0xc,%esp
    2277:	68 7e 4f 00 00       	push   $0x4f7e
    227c:	e8 c1 1c 00 00       	call   3f42 <chdir>
    2281:	83 c4 10             	add    $0x10,%esp
    2284:	85 c0                	test   %eax,%eax
    2286:	74 17                	je     229f <subdir+0x310>
    printf(1, "chdir ./.. failed\n");
    2288:	83 ec 08             	sub    $0x8,%esp
    228b:	68 83 4f 00 00       	push   $0x4f83
    2290:	6a 01                	push   $0x1
    2292:	e8 af 1d 00 00       	call   4046 <printf>
    2297:	83 c4 10             	add    $0x10,%esp
    exit();
    229a:	e8 33 1c 00 00       	call   3ed2 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    229f:	83 ec 08             	sub    $0x8,%esp
    22a2:	6a 00                	push   $0x0
    22a4:	68 cc 4e 00 00       	push   $0x4ecc
    22a9:	e8 64 1c 00 00       	call   3f12 <open>
    22ae:	83 c4 10             	add    $0x10,%esp
    22b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    22b4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    22b8:	79 17                	jns    22d1 <subdir+0x342>
    printf(1, "open dd/dd/ffff failed\n");
    22ba:	83 ec 08             	sub    $0x8,%esp
    22bd:	68 96 4f 00 00       	push   $0x4f96
    22c2:	6a 01                	push   $0x1
    22c4:	e8 7d 1d 00 00       	call   4046 <printf>
    22c9:	83 c4 10             	add    $0x10,%esp
    exit();
    22cc:	e8 01 1c 00 00       	call   3ed2 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    22d1:	83 ec 04             	sub    $0x4,%esp
    22d4:	68 00 20 00 00       	push   $0x2000
    22d9:	68 e0 62 00 00       	push   $0x62e0
    22de:	ff 75 f4             	push   -0xc(%ebp)
    22e1:	e8 04 1c 00 00       	call   3eea <read>
    22e6:	83 c4 10             	add    $0x10,%esp
    22e9:	83 f8 02             	cmp    $0x2,%eax
    22ec:	74 17                	je     2305 <subdir+0x376>
    printf(1, "read dd/dd/ffff wrong len\n");
    22ee:	83 ec 08             	sub    $0x8,%esp
    22f1:	68 ae 4f 00 00       	push   $0x4fae
    22f6:	6a 01                	push   $0x1
    22f8:	e8 49 1d 00 00       	call   4046 <printf>
    22fd:	83 c4 10             	add    $0x10,%esp
    exit();
    2300:	e8 cd 1b 00 00       	call   3ed2 <exit>
  }
  close(fd);
    2305:	83 ec 0c             	sub    $0xc,%esp
    2308:	ff 75 f4             	push   -0xc(%ebp)
    230b:	e8 ea 1b 00 00       	call   3efa <close>
    2310:	83 c4 10             	add    $0x10,%esp

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2313:	83 ec 08             	sub    $0x8,%esp
    2316:	6a 00                	push   $0x0
    2318:	68 68 4e 00 00       	push   $0x4e68
    231d:	e8 f0 1b 00 00       	call   3f12 <open>
    2322:	83 c4 10             	add    $0x10,%esp
    2325:	85 c0                	test   %eax,%eax
    2327:	78 17                	js     2340 <subdir+0x3b1>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2329:	83 ec 08             	sub    $0x8,%esp
    232c:	68 cc 4f 00 00       	push   $0x4fcc
    2331:	6a 01                	push   $0x1
    2333:	e8 0e 1d 00 00       	call   4046 <printf>
    2338:	83 c4 10             	add    $0x10,%esp
    exit();
    233b:	e8 92 1b 00 00       	call   3ed2 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2340:	83 ec 08             	sub    $0x8,%esp
    2343:	68 02 02 00 00       	push   $0x202
    2348:	68 f1 4f 00 00       	push   $0x4ff1
    234d:	e8 c0 1b 00 00       	call   3f12 <open>
    2352:	83 c4 10             	add    $0x10,%esp
    2355:	85 c0                	test   %eax,%eax
    2357:	78 17                	js     2370 <subdir+0x3e1>
    printf(1, "create dd/ff/ff succeeded!\n");
    2359:	83 ec 08             	sub    $0x8,%esp
    235c:	68 fa 4f 00 00       	push   $0x4ffa
    2361:	6a 01                	push   $0x1
    2363:	e8 de 1c 00 00       	call   4046 <printf>
    2368:	83 c4 10             	add    $0x10,%esp
    exit();
    236b:	e8 62 1b 00 00       	call   3ed2 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    2370:	83 ec 08             	sub    $0x8,%esp
    2373:	68 02 02 00 00       	push   $0x202
    2378:	68 16 50 00 00       	push   $0x5016
    237d:	e8 90 1b 00 00       	call   3f12 <open>
    2382:	83 c4 10             	add    $0x10,%esp
    2385:	85 c0                	test   %eax,%eax
    2387:	78 17                	js     23a0 <subdir+0x411>
    printf(1, "create dd/xx/ff succeeded!\n");
    2389:	83 ec 08             	sub    $0x8,%esp
    238c:	68 1f 50 00 00       	push   $0x501f
    2391:	6a 01                	push   $0x1
    2393:	e8 ae 1c 00 00       	call   4046 <printf>
    2398:	83 c4 10             	add    $0x10,%esp
    exit();
    239b:	e8 32 1b 00 00       	call   3ed2 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    23a0:	83 ec 08             	sub    $0x8,%esp
    23a3:	68 00 02 00 00       	push   $0x200
    23a8:	68 e9 4d 00 00       	push   $0x4de9
    23ad:	e8 60 1b 00 00       	call   3f12 <open>
    23b2:	83 c4 10             	add    $0x10,%esp
    23b5:	85 c0                	test   %eax,%eax
    23b7:	78 17                	js     23d0 <subdir+0x441>
    printf(1, "create dd succeeded!\n");
    23b9:	83 ec 08             	sub    $0x8,%esp
    23bc:	68 3b 50 00 00       	push   $0x503b
    23c1:	6a 01                	push   $0x1
    23c3:	e8 7e 1c 00 00       	call   4046 <printf>
    23c8:	83 c4 10             	add    $0x10,%esp
    exit();
    23cb:	e8 02 1b 00 00       	call   3ed2 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    23d0:	83 ec 08             	sub    $0x8,%esp
    23d3:	6a 02                	push   $0x2
    23d5:	68 e9 4d 00 00       	push   $0x4de9
    23da:	e8 33 1b 00 00       	call   3f12 <open>
    23df:	83 c4 10             	add    $0x10,%esp
    23e2:	85 c0                	test   %eax,%eax
    23e4:	78 17                	js     23fd <subdir+0x46e>
    printf(1, "open dd rdwr succeeded!\n");
    23e6:	83 ec 08             	sub    $0x8,%esp
    23e9:	68 51 50 00 00       	push   $0x5051
    23ee:	6a 01                	push   $0x1
    23f0:	e8 51 1c 00 00       	call   4046 <printf>
    23f5:	83 c4 10             	add    $0x10,%esp
    exit();
    23f8:	e8 d5 1a 00 00       	call   3ed2 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    23fd:	83 ec 08             	sub    $0x8,%esp
    2400:	6a 01                	push   $0x1
    2402:	68 e9 4d 00 00       	push   $0x4de9
    2407:	e8 06 1b 00 00       	call   3f12 <open>
    240c:	83 c4 10             	add    $0x10,%esp
    240f:	85 c0                	test   %eax,%eax
    2411:	78 17                	js     242a <subdir+0x49b>
    printf(1, "open dd wronly succeeded!\n");
    2413:	83 ec 08             	sub    $0x8,%esp
    2416:	68 6a 50 00 00       	push   $0x506a
    241b:	6a 01                	push   $0x1
    241d:	e8 24 1c 00 00       	call   4046 <printf>
    2422:	83 c4 10             	add    $0x10,%esp
    exit();
    2425:	e8 a8 1a 00 00       	call   3ed2 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    242a:	83 ec 08             	sub    $0x8,%esp
    242d:	68 85 50 00 00       	push   $0x5085
    2432:	68 f1 4f 00 00       	push   $0x4ff1
    2437:	e8 f6 1a 00 00       	call   3f32 <link>
    243c:	83 c4 10             	add    $0x10,%esp
    243f:	85 c0                	test   %eax,%eax
    2441:	75 17                	jne    245a <subdir+0x4cb>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2443:	83 ec 08             	sub    $0x8,%esp
    2446:	68 90 50 00 00       	push   $0x5090
    244b:	6a 01                	push   $0x1
    244d:	e8 f4 1b 00 00       	call   4046 <printf>
    2452:	83 c4 10             	add    $0x10,%esp
    exit();
    2455:	e8 78 1a 00 00       	call   3ed2 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    245a:	83 ec 08             	sub    $0x8,%esp
    245d:	68 85 50 00 00       	push   $0x5085
    2462:	68 16 50 00 00       	push   $0x5016
    2467:	e8 c6 1a 00 00       	call   3f32 <link>
    246c:	83 c4 10             	add    $0x10,%esp
    246f:	85 c0                	test   %eax,%eax
    2471:	75 17                	jne    248a <subdir+0x4fb>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2473:	83 ec 08             	sub    $0x8,%esp
    2476:	68 b4 50 00 00       	push   $0x50b4
    247b:	6a 01                	push   $0x1
    247d:	e8 c4 1b 00 00       	call   4046 <printf>
    2482:	83 c4 10             	add    $0x10,%esp
    exit();
    2485:	e8 48 1a 00 00       	call   3ed2 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    248a:	83 ec 08             	sub    $0x8,%esp
    248d:	68 cc 4e 00 00       	push   $0x4ecc
    2492:	68 04 4e 00 00       	push   $0x4e04
    2497:	e8 96 1a 00 00       	call   3f32 <link>
    249c:	83 c4 10             	add    $0x10,%esp
    249f:	85 c0                	test   %eax,%eax
    24a1:	75 17                	jne    24ba <subdir+0x52b>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    24a3:	83 ec 08             	sub    $0x8,%esp
    24a6:	68 d8 50 00 00       	push   $0x50d8
    24ab:	6a 01                	push   $0x1
    24ad:	e8 94 1b 00 00       	call   4046 <printf>
    24b2:	83 c4 10             	add    $0x10,%esp
    exit();
    24b5:	e8 18 1a 00 00       	call   3ed2 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    24ba:	83 ec 0c             	sub    $0xc,%esp
    24bd:	68 f1 4f 00 00       	push   $0x4ff1
    24c2:	e8 73 1a 00 00       	call   3f3a <mkdir>
    24c7:	83 c4 10             	add    $0x10,%esp
    24ca:	85 c0                	test   %eax,%eax
    24cc:	75 17                	jne    24e5 <subdir+0x556>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    24ce:	83 ec 08             	sub    $0x8,%esp
    24d1:	68 fa 50 00 00       	push   $0x50fa
    24d6:	6a 01                	push   $0x1
    24d8:	e8 69 1b 00 00       	call   4046 <printf>
    24dd:	83 c4 10             	add    $0x10,%esp
    exit();
    24e0:	e8 ed 19 00 00       	call   3ed2 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    24e5:	83 ec 0c             	sub    $0xc,%esp
    24e8:	68 16 50 00 00       	push   $0x5016
    24ed:	e8 48 1a 00 00       	call   3f3a <mkdir>
    24f2:	83 c4 10             	add    $0x10,%esp
    24f5:	85 c0                	test   %eax,%eax
    24f7:	75 17                	jne    2510 <subdir+0x581>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    24f9:	83 ec 08             	sub    $0x8,%esp
    24fc:	68 15 51 00 00       	push   $0x5115
    2501:	6a 01                	push   $0x1
    2503:	e8 3e 1b 00 00       	call   4046 <printf>
    2508:	83 c4 10             	add    $0x10,%esp
    exit();
    250b:	e8 c2 19 00 00       	call   3ed2 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    2510:	83 ec 0c             	sub    $0xc,%esp
    2513:	68 cc 4e 00 00       	push   $0x4ecc
    2518:	e8 1d 1a 00 00       	call   3f3a <mkdir>
    251d:	83 c4 10             	add    $0x10,%esp
    2520:	85 c0                	test   %eax,%eax
    2522:	75 17                	jne    253b <subdir+0x5ac>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2524:	83 ec 08             	sub    $0x8,%esp
    2527:	68 30 51 00 00       	push   $0x5130
    252c:	6a 01                	push   $0x1
    252e:	e8 13 1b 00 00       	call   4046 <printf>
    2533:	83 c4 10             	add    $0x10,%esp
    exit();
    2536:	e8 97 19 00 00       	call   3ed2 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    253b:	83 ec 0c             	sub    $0xc,%esp
    253e:	68 16 50 00 00       	push   $0x5016
    2543:	e8 da 19 00 00       	call   3f22 <unlink>
    2548:	83 c4 10             	add    $0x10,%esp
    254b:	85 c0                	test   %eax,%eax
    254d:	75 17                	jne    2566 <subdir+0x5d7>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    254f:	83 ec 08             	sub    $0x8,%esp
    2552:	68 4d 51 00 00       	push   $0x514d
    2557:	6a 01                	push   $0x1
    2559:	e8 e8 1a 00 00       	call   4046 <printf>
    255e:	83 c4 10             	add    $0x10,%esp
    exit();
    2561:	e8 6c 19 00 00       	call   3ed2 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    2566:	83 ec 0c             	sub    $0xc,%esp
    2569:	68 f1 4f 00 00       	push   $0x4ff1
    256e:	e8 af 19 00 00       	call   3f22 <unlink>
    2573:	83 c4 10             	add    $0x10,%esp
    2576:	85 c0                	test   %eax,%eax
    2578:	75 17                	jne    2591 <subdir+0x602>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    257a:	83 ec 08             	sub    $0x8,%esp
    257d:	68 69 51 00 00       	push   $0x5169
    2582:	6a 01                	push   $0x1
    2584:	e8 bd 1a 00 00       	call   4046 <printf>
    2589:	83 c4 10             	add    $0x10,%esp
    exit();
    258c:	e8 41 19 00 00       	call   3ed2 <exit>
  }
  if(chdir("dd/ff") == 0){
    2591:	83 ec 0c             	sub    $0xc,%esp
    2594:	68 04 4e 00 00       	push   $0x4e04
    2599:	e8 a4 19 00 00       	call   3f42 <chdir>
    259e:	83 c4 10             	add    $0x10,%esp
    25a1:	85 c0                	test   %eax,%eax
    25a3:	75 17                	jne    25bc <subdir+0x62d>
    printf(1, "chdir dd/ff succeeded!\n");
    25a5:	83 ec 08             	sub    $0x8,%esp
    25a8:	68 85 51 00 00       	push   $0x5185
    25ad:	6a 01                	push   $0x1
    25af:	e8 92 1a 00 00       	call   4046 <printf>
    25b4:	83 c4 10             	add    $0x10,%esp
    exit();
    25b7:	e8 16 19 00 00       	call   3ed2 <exit>
  }
  if(chdir("dd/xx") == 0){
    25bc:	83 ec 0c             	sub    $0xc,%esp
    25bf:	68 9d 51 00 00       	push   $0x519d
    25c4:	e8 79 19 00 00       	call   3f42 <chdir>
    25c9:	83 c4 10             	add    $0x10,%esp
    25cc:	85 c0                	test   %eax,%eax
    25ce:	75 17                	jne    25e7 <subdir+0x658>
    printf(1, "chdir dd/xx succeeded!\n");
    25d0:	83 ec 08             	sub    $0x8,%esp
    25d3:	68 a3 51 00 00       	push   $0x51a3
    25d8:	6a 01                	push   $0x1
    25da:	e8 67 1a 00 00       	call   4046 <printf>
    25df:	83 c4 10             	add    $0x10,%esp
    exit();
    25e2:	e8 eb 18 00 00       	call   3ed2 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    25e7:	83 ec 0c             	sub    $0xc,%esp
    25ea:	68 cc 4e 00 00       	push   $0x4ecc
    25ef:	e8 2e 19 00 00       	call   3f22 <unlink>
    25f4:	83 c4 10             	add    $0x10,%esp
    25f7:	85 c0                	test   %eax,%eax
    25f9:	74 17                	je     2612 <subdir+0x683>
    printf(1, "unlink dd/dd/ff failed\n");
    25fb:	83 ec 08             	sub    $0x8,%esp
    25fe:	68 f9 4e 00 00       	push   $0x4ef9
    2603:	6a 01                	push   $0x1
    2605:	e8 3c 1a 00 00       	call   4046 <printf>
    260a:	83 c4 10             	add    $0x10,%esp
    exit();
    260d:	e8 c0 18 00 00       	call   3ed2 <exit>
  }
  if(unlink("dd/ff") != 0){
    2612:	83 ec 0c             	sub    $0xc,%esp
    2615:	68 04 4e 00 00       	push   $0x4e04
    261a:	e8 03 19 00 00       	call   3f22 <unlink>
    261f:	83 c4 10             	add    $0x10,%esp
    2622:	85 c0                	test   %eax,%eax
    2624:	74 17                	je     263d <subdir+0x6ae>
    printf(1, "unlink dd/ff failed\n");
    2626:	83 ec 08             	sub    $0x8,%esp
    2629:	68 bb 51 00 00       	push   $0x51bb
    262e:	6a 01                	push   $0x1
    2630:	e8 11 1a 00 00       	call   4046 <printf>
    2635:	83 c4 10             	add    $0x10,%esp
    exit();
    2638:	e8 95 18 00 00       	call   3ed2 <exit>
  }
  if(unlink("dd") == 0){
    263d:	83 ec 0c             	sub    $0xc,%esp
    2640:	68 e9 4d 00 00       	push   $0x4de9
    2645:	e8 d8 18 00 00       	call   3f22 <unlink>
    264a:	83 c4 10             	add    $0x10,%esp
    264d:	85 c0                	test   %eax,%eax
    264f:	75 17                	jne    2668 <subdir+0x6d9>
    printf(1, "unlink non-empty dd succeeded!\n");
    2651:	83 ec 08             	sub    $0x8,%esp
    2654:	68 d0 51 00 00       	push   $0x51d0
    2659:	6a 01                	push   $0x1
    265b:	e8 e6 19 00 00       	call   4046 <printf>
    2660:	83 c4 10             	add    $0x10,%esp
    exit();
    2663:	e8 6a 18 00 00       	call   3ed2 <exit>
  }
  if(unlink("dd/dd") < 0){
    2668:	83 ec 0c             	sub    $0xc,%esp
    266b:	68 f0 51 00 00       	push   $0x51f0
    2670:	e8 ad 18 00 00       	call   3f22 <unlink>
    2675:	83 c4 10             	add    $0x10,%esp
    2678:	85 c0                	test   %eax,%eax
    267a:	79 17                	jns    2693 <subdir+0x704>
    printf(1, "unlink dd/dd failed\n");
    267c:	83 ec 08             	sub    $0x8,%esp
    267f:	68 f6 51 00 00       	push   $0x51f6
    2684:	6a 01                	push   $0x1
    2686:	e8 bb 19 00 00       	call   4046 <printf>
    268b:	83 c4 10             	add    $0x10,%esp
    exit();
    268e:	e8 3f 18 00 00       	call   3ed2 <exit>
  }
  if(unlink("dd") < 0){
    2693:	83 ec 0c             	sub    $0xc,%esp
    2696:	68 e9 4d 00 00       	push   $0x4de9
    269b:	e8 82 18 00 00       	call   3f22 <unlink>
    26a0:	83 c4 10             	add    $0x10,%esp
    26a3:	85 c0                	test   %eax,%eax
    26a5:	79 17                	jns    26be <subdir+0x72f>
    printf(1, "unlink dd failed\n");
    26a7:	83 ec 08             	sub    $0x8,%esp
    26aa:	68 0b 52 00 00       	push   $0x520b
    26af:	6a 01                	push   $0x1
    26b1:	e8 90 19 00 00       	call   4046 <printf>
    26b6:	83 c4 10             	add    $0x10,%esp
    exit();
    26b9:	e8 14 18 00 00       	call   3ed2 <exit>
  }

  printf(1, "subdir ok\n");
    26be:	83 ec 08             	sub    $0x8,%esp
    26c1:	68 1d 52 00 00       	push   $0x521d
    26c6:	6a 01                	push   $0x1
    26c8:	e8 79 19 00 00       	call   4046 <printf>
    26cd:	83 c4 10             	add    $0x10,%esp
}
    26d0:	90                   	nop
    26d1:	c9                   	leave
    26d2:	c3                   	ret

000026d3 <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    26d3:	55                   	push   %ebp
    26d4:	89 e5                	mov    %esp,%ebp
    26d6:	83 ec 18             	sub    $0x18,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    26d9:	83 ec 08             	sub    $0x8,%esp
    26dc:	68 28 52 00 00       	push   $0x5228
    26e1:	6a 01                	push   $0x1
    26e3:	e8 5e 19 00 00       	call   4046 <printf>
    26e8:	83 c4 10             	add    $0x10,%esp

  unlink("bigwrite");
    26eb:	83 ec 0c             	sub    $0xc,%esp
    26ee:	68 37 52 00 00       	push   $0x5237
    26f3:	e8 2a 18 00 00       	call   3f22 <unlink>
    26f8:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    26fb:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    2702:	e9 a8 00 00 00       	jmp    27af <bigwrite+0xdc>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2707:	83 ec 08             	sub    $0x8,%esp
    270a:	68 02 02 00 00       	push   $0x202
    270f:	68 37 52 00 00       	push   $0x5237
    2714:	e8 f9 17 00 00       	call   3f12 <open>
    2719:	83 c4 10             	add    $0x10,%esp
    271c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    271f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2723:	79 17                	jns    273c <bigwrite+0x69>
      printf(1, "cannot create bigwrite\n");
    2725:	83 ec 08             	sub    $0x8,%esp
    2728:	68 40 52 00 00       	push   $0x5240
    272d:	6a 01                	push   $0x1
    272f:	e8 12 19 00 00       	call   4046 <printf>
    2734:	83 c4 10             	add    $0x10,%esp
      exit();
    2737:	e8 96 17 00 00       	call   3ed2 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    273c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2743:	eb 3f                	jmp    2784 <bigwrite+0xb1>
      int cc = write(fd, buf, sz);
    2745:	83 ec 04             	sub    $0x4,%esp
    2748:	ff 75 f4             	push   -0xc(%ebp)
    274b:	68 e0 62 00 00       	push   $0x62e0
    2750:	ff 75 ec             	push   -0x14(%ebp)
    2753:	e8 9a 17 00 00       	call   3ef2 <write>
    2758:	83 c4 10             	add    $0x10,%esp
    275b:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    275e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2761:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2764:	74 1a                	je     2780 <bigwrite+0xad>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2766:	ff 75 e8             	push   -0x18(%ebp)
    2769:	ff 75 f4             	push   -0xc(%ebp)
    276c:	68 58 52 00 00       	push   $0x5258
    2771:	6a 01                	push   $0x1
    2773:	e8 ce 18 00 00       	call   4046 <printf>
    2778:	83 c4 10             	add    $0x10,%esp
        exit();
    277b:	e8 52 17 00 00       	call   3ed2 <exit>
    for(i = 0; i < 2; i++){
    2780:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2784:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    2788:	7e bb                	jle    2745 <bigwrite+0x72>
      }
    }
    close(fd);
    278a:	83 ec 0c             	sub    $0xc,%esp
    278d:	ff 75 ec             	push   -0x14(%ebp)
    2790:	e8 65 17 00 00       	call   3efa <close>
    2795:	83 c4 10             	add    $0x10,%esp
    unlink("bigwrite");
    2798:	83 ec 0c             	sub    $0xc,%esp
    279b:	68 37 52 00 00       	push   $0x5237
    27a0:	e8 7d 17 00 00       	call   3f22 <unlink>
    27a5:	83 c4 10             	add    $0x10,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    27a8:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    27af:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    27b6:	0f 8e 4b ff ff ff    	jle    2707 <bigwrite+0x34>
  }

  printf(1, "bigwrite ok\n");
    27bc:	83 ec 08             	sub    $0x8,%esp
    27bf:	68 6a 52 00 00       	push   $0x526a
    27c4:	6a 01                	push   $0x1
    27c6:	e8 7b 18 00 00       	call   4046 <printf>
    27cb:	83 c4 10             	add    $0x10,%esp
}
    27ce:	90                   	nop
    27cf:	c9                   	leave
    27d0:	c3                   	ret

000027d1 <bigfile>:

void
bigfile(void)
{
    27d1:	55                   	push   %ebp
    27d2:	89 e5                	mov    %esp,%ebp
    27d4:	83 ec 18             	sub    $0x18,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    27d7:	83 ec 08             	sub    $0x8,%esp
    27da:	68 77 52 00 00       	push   $0x5277
    27df:	6a 01                	push   $0x1
    27e1:	e8 60 18 00 00       	call   4046 <printf>
    27e6:	83 c4 10             	add    $0x10,%esp

  unlink("bigfile");
    27e9:	83 ec 0c             	sub    $0xc,%esp
    27ec:	68 85 52 00 00       	push   $0x5285
    27f1:	e8 2c 17 00 00       	call   3f22 <unlink>
    27f6:	83 c4 10             	add    $0x10,%esp
  fd = open("bigfile", O_CREATE | O_RDWR);
    27f9:	83 ec 08             	sub    $0x8,%esp
    27fc:	68 02 02 00 00       	push   $0x202
    2801:	68 85 52 00 00       	push   $0x5285
    2806:	e8 07 17 00 00       	call   3f12 <open>
    280b:	83 c4 10             	add    $0x10,%esp
    280e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2811:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2815:	79 17                	jns    282e <bigfile+0x5d>
    printf(1, "cannot create bigfile");
    2817:	83 ec 08             	sub    $0x8,%esp
    281a:	68 8d 52 00 00       	push   $0x528d
    281f:	6a 01                	push   $0x1
    2821:	e8 20 18 00 00       	call   4046 <printf>
    2826:	83 c4 10             	add    $0x10,%esp
    exit();
    2829:	e8 a4 16 00 00       	call   3ed2 <exit>
  }
  for(i = 0; i < 20; i++){
    282e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2835:	eb 52                	jmp    2889 <bigfile+0xb8>
    memset(buf, i, 600);
    2837:	83 ec 04             	sub    $0x4,%esp
    283a:	68 58 02 00 00       	push   $0x258
    283f:	ff 75 f4             	push   -0xc(%ebp)
    2842:	68 e0 62 00 00       	push   $0x62e0
    2847:	e8 eb 14 00 00       	call   3d37 <memset>
    284c:	83 c4 10             	add    $0x10,%esp
    if(write(fd, buf, 600) != 600){
    284f:	83 ec 04             	sub    $0x4,%esp
    2852:	68 58 02 00 00       	push   $0x258
    2857:	68 e0 62 00 00       	push   $0x62e0
    285c:	ff 75 ec             	push   -0x14(%ebp)
    285f:	e8 8e 16 00 00       	call   3ef2 <write>
    2864:	83 c4 10             	add    $0x10,%esp
    2867:	3d 58 02 00 00       	cmp    $0x258,%eax
    286c:	74 17                	je     2885 <bigfile+0xb4>
      printf(1, "write bigfile failed\n");
    286e:	83 ec 08             	sub    $0x8,%esp
    2871:	68 a3 52 00 00       	push   $0x52a3
    2876:	6a 01                	push   $0x1
    2878:	e8 c9 17 00 00       	call   4046 <printf>
    287d:	83 c4 10             	add    $0x10,%esp
      exit();
    2880:	e8 4d 16 00 00       	call   3ed2 <exit>
  for(i = 0; i < 20; i++){
    2885:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2889:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    288d:	7e a8                	jle    2837 <bigfile+0x66>
    }
  }
  close(fd);
    288f:	83 ec 0c             	sub    $0xc,%esp
    2892:	ff 75 ec             	push   -0x14(%ebp)
    2895:	e8 60 16 00 00       	call   3efa <close>
    289a:	83 c4 10             	add    $0x10,%esp

  fd = open("bigfile", 0);
    289d:	83 ec 08             	sub    $0x8,%esp
    28a0:	6a 00                	push   $0x0
    28a2:	68 85 52 00 00       	push   $0x5285
    28a7:	e8 66 16 00 00       	call   3f12 <open>
    28ac:	83 c4 10             	add    $0x10,%esp
    28af:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    28b2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    28b6:	79 17                	jns    28cf <bigfile+0xfe>
    printf(1, "cannot open bigfile\n");
    28b8:	83 ec 08             	sub    $0x8,%esp
    28bb:	68 b9 52 00 00       	push   $0x52b9
    28c0:	6a 01                	push   $0x1
    28c2:	e8 7f 17 00 00       	call   4046 <printf>
    28c7:	83 c4 10             	add    $0x10,%esp
    exit();
    28ca:	e8 03 16 00 00       	call   3ed2 <exit>
  }
  total = 0;
    28cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    28d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    28dd:	83 ec 04             	sub    $0x4,%esp
    28e0:	68 2c 01 00 00       	push   $0x12c
    28e5:	68 e0 62 00 00       	push   $0x62e0
    28ea:	ff 75 ec             	push   -0x14(%ebp)
    28ed:	e8 f8 15 00 00       	call   3eea <read>
    28f2:	83 c4 10             	add    $0x10,%esp
    28f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    28f8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28fc:	79 17                	jns    2915 <bigfile+0x144>
      printf(1, "read bigfile failed\n");
    28fe:	83 ec 08             	sub    $0x8,%esp
    2901:	68 ce 52 00 00       	push   $0x52ce
    2906:	6a 01                	push   $0x1
    2908:	e8 39 17 00 00       	call   4046 <printf>
    290d:	83 c4 10             	add    $0x10,%esp
      exit();
    2910:	e8 bd 15 00 00       	call   3ed2 <exit>
    }
    if(cc == 0)
    2915:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2919:	74 7a                	je     2995 <bigfile+0x1c4>
      break;
    if(cc != 300){
    291b:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    2922:	74 17                	je     293b <bigfile+0x16a>
      printf(1, "short read bigfile\n");
    2924:	83 ec 08             	sub    $0x8,%esp
    2927:	68 e3 52 00 00       	push   $0x52e3
    292c:	6a 01                	push   $0x1
    292e:	e8 13 17 00 00       	call   4046 <printf>
    2933:	83 c4 10             	add    $0x10,%esp
      exit();
    2936:	e8 97 15 00 00       	call   3ed2 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    293b:	0f b6 05 e0 62 00 00 	movzbl 0x62e0,%eax
    2942:	0f be d0             	movsbl %al,%edx
    2945:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2948:	89 c1                	mov    %eax,%ecx
    294a:	c1 e9 1f             	shr    $0x1f,%ecx
    294d:	01 c8                	add    %ecx,%eax
    294f:	d1 f8                	sar    $1,%eax
    2951:	39 c2                	cmp    %eax,%edx
    2953:	75 1a                	jne    296f <bigfile+0x19e>
    2955:	0f b6 05 0b 64 00 00 	movzbl 0x640b,%eax
    295c:	0f be d0             	movsbl %al,%edx
    295f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2962:	89 c1                	mov    %eax,%ecx
    2964:	c1 e9 1f             	shr    $0x1f,%ecx
    2967:	01 c8                	add    %ecx,%eax
    2969:	d1 f8                	sar    $1,%eax
    296b:	39 c2                	cmp    %eax,%edx
    296d:	74 17                	je     2986 <bigfile+0x1b5>
      printf(1, "read bigfile wrong data\n");
    296f:	83 ec 08             	sub    $0x8,%esp
    2972:	68 f7 52 00 00       	push   $0x52f7
    2977:	6a 01                	push   $0x1
    2979:	e8 c8 16 00 00       	call   4046 <printf>
    297e:	83 c4 10             	add    $0x10,%esp
      exit();
    2981:	e8 4c 15 00 00       	call   3ed2 <exit>
    }
    total += cc;
    2986:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2989:	01 45 f0             	add    %eax,-0x10(%ebp)
  for(i = 0; ; i++){
    298c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    cc = read(fd, buf, 300);
    2990:	e9 48 ff ff ff       	jmp    28dd <bigfile+0x10c>
      break;
    2995:	90                   	nop
  }
  close(fd);
    2996:	83 ec 0c             	sub    $0xc,%esp
    2999:	ff 75 ec             	push   -0x14(%ebp)
    299c:	e8 59 15 00 00       	call   3efa <close>
    29a1:	83 c4 10             	add    $0x10,%esp
  if(total != 20*600){
    29a4:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    29ab:	74 17                	je     29c4 <bigfile+0x1f3>
    printf(1, "read bigfile wrong total\n");
    29ad:	83 ec 08             	sub    $0x8,%esp
    29b0:	68 10 53 00 00       	push   $0x5310
    29b5:	6a 01                	push   $0x1
    29b7:	e8 8a 16 00 00       	call   4046 <printf>
    29bc:	83 c4 10             	add    $0x10,%esp
    exit();
    29bf:	e8 0e 15 00 00       	call   3ed2 <exit>
  }
  unlink("bigfile");
    29c4:	83 ec 0c             	sub    $0xc,%esp
    29c7:	68 85 52 00 00       	push   $0x5285
    29cc:	e8 51 15 00 00       	call   3f22 <unlink>
    29d1:	83 c4 10             	add    $0x10,%esp

  printf(1, "bigfile test ok\n");
    29d4:	83 ec 08             	sub    $0x8,%esp
    29d7:	68 2a 53 00 00       	push   $0x532a
    29dc:	6a 01                	push   $0x1
    29de:	e8 63 16 00 00       	call   4046 <printf>
    29e3:	83 c4 10             	add    $0x10,%esp
}
    29e6:	90                   	nop
    29e7:	c9                   	leave
    29e8:	c3                   	ret

000029e9 <fourteen>:

void
fourteen(void)
{
    29e9:	55                   	push   %ebp
    29ea:	89 e5                	mov    %esp,%ebp
    29ec:	83 ec 18             	sub    $0x18,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    29ef:	83 ec 08             	sub    $0x8,%esp
    29f2:	68 3b 53 00 00       	push   $0x533b
    29f7:	6a 01                	push   $0x1
    29f9:	e8 48 16 00 00       	call   4046 <printf>
    29fe:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234") != 0){
    2a01:	83 ec 0c             	sub    $0xc,%esp
    2a04:	68 4a 53 00 00       	push   $0x534a
    2a09:	e8 2c 15 00 00       	call   3f3a <mkdir>
    2a0e:	83 c4 10             	add    $0x10,%esp
    2a11:	85 c0                	test   %eax,%eax
    2a13:	74 17                	je     2a2c <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    2a15:	83 ec 08             	sub    $0x8,%esp
    2a18:	68 59 53 00 00       	push   $0x5359
    2a1d:	6a 01                	push   $0x1
    2a1f:	e8 22 16 00 00       	call   4046 <printf>
    2a24:	83 c4 10             	add    $0x10,%esp
    exit();
    2a27:	e8 a6 14 00 00       	call   3ed2 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2a2c:	83 ec 0c             	sub    $0xc,%esp
    2a2f:	68 78 53 00 00       	push   $0x5378
    2a34:	e8 01 15 00 00       	call   3f3a <mkdir>
    2a39:	83 c4 10             	add    $0x10,%esp
    2a3c:	85 c0                	test   %eax,%eax
    2a3e:	74 17                	je     2a57 <fourteen+0x6e>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2a40:	83 ec 08             	sub    $0x8,%esp
    2a43:	68 98 53 00 00       	push   $0x5398
    2a48:	6a 01                	push   $0x1
    2a4a:	e8 f7 15 00 00       	call   4046 <printf>
    2a4f:	83 c4 10             	add    $0x10,%esp
    exit();
    2a52:	e8 7b 14 00 00       	call   3ed2 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2a57:	83 ec 08             	sub    $0x8,%esp
    2a5a:	68 00 02 00 00       	push   $0x200
    2a5f:	68 c8 53 00 00       	push   $0x53c8
    2a64:	e8 a9 14 00 00       	call   3f12 <open>
    2a69:	83 c4 10             	add    $0x10,%esp
    2a6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2a6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a73:	79 17                	jns    2a8c <fourteen+0xa3>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2a75:	83 ec 08             	sub    $0x8,%esp
    2a78:	68 f8 53 00 00       	push   $0x53f8
    2a7d:	6a 01                	push   $0x1
    2a7f:	e8 c2 15 00 00       	call   4046 <printf>
    2a84:	83 c4 10             	add    $0x10,%esp
    exit();
    2a87:	e8 46 14 00 00       	call   3ed2 <exit>
  }
  close(fd);
    2a8c:	83 ec 0c             	sub    $0xc,%esp
    2a8f:	ff 75 f4             	push   -0xc(%ebp)
    2a92:	e8 63 14 00 00       	call   3efa <close>
    2a97:	83 c4 10             	add    $0x10,%esp
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2a9a:	83 ec 08             	sub    $0x8,%esp
    2a9d:	6a 00                	push   $0x0
    2a9f:	68 38 54 00 00       	push   $0x5438
    2aa4:	e8 69 14 00 00       	call   3f12 <open>
    2aa9:	83 c4 10             	add    $0x10,%esp
    2aac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2aaf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ab3:	79 17                	jns    2acc <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2ab5:	83 ec 08             	sub    $0x8,%esp
    2ab8:	68 68 54 00 00       	push   $0x5468
    2abd:	6a 01                	push   $0x1
    2abf:	e8 82 15 00 00       	call   4046 <printf>
    2ac4:	83 c4 10             	add    $0x10,%esp
    exit();
    2ac7:	e8 06 14 00 00       	call   3ed2 <exit>
  }
  close(fd);
    2acc:	83 ec 0c             	sub    $0xc,%esp
    2acf:	ff 75 f4             	push   -0xc(%ebp)
    2ad2:	e8 23 14 00 00       	call   3efa <close>
    2ad7:	83 c4 10             	add    $0x10,%esp

  if(mkdir("12345678901234/12345678901234") == 0){
    2ada:	83 ec 0c             	sub    $0xc,%esp
    2add:	68 a2 54 00 00       	push   $0x54a2
    2ae2:	e8 53 14 00 00       	call   3f3a <mkdir>
    2ae7:	83 c4 10             	add    $0x10,%esp
    2aea:	85 c0                	test   %eax,%eax
    2aec:	75 17                	jne    2b05 <fourteen+0x11c>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2aee:	83 ec 08             	sub    $0x8,%esp
    2af1:	68 c0 54 00 00       	push   $0x54c0
    2af6:	6a 01                	push   $0x1
    2af8:	e8 49 15 00 00       	call   4046 <printf>
    2afd:	83 c4 10             	add    $0x10,%esp
    exit();
    2b00:	e8 cd 13 00 00       	call   3ed2 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2b05:	83 ec 0c             	sub    $0xc,%esp
    2b08:	68 f0 54 00 00       	push   $0x54f0
    2b0d:	e8 28 14 00 00       	call   3f3a <mkdir>
    2b12:	83 c4 10             	add    $0x10,%esp
    2b15:	85 c0                	test   %eax,%eax
    2b17:	75 17                	jne    2b30 <fourteen+0x147>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2b19:	83 ec 08             	sub    $0x8,%esp
    2b1c:	68 10 55 00 00       	push   $0x5510
    2b21:	6a 01                	push   $0x1
    2b23:	e8 1e 15 00 00       	call   4046 <printf>
    2b28:	83 c4 10             	add    $0x10,%esp
    exit();
    2b2b:	e8 a2 13 00 00       	call   3ed2 <exit>
  }

  printf(1, "fourteen ok\n");
    2b30:	83 ec 08             	sub    $0x8,%esp
    2b33:	68 41 55 00 00       	push   $0x5541
    2b38:	6a 01                	push   $0x1
    2b3a:	e8 07 15 00 00       	call   4046 <printf>
    2b3f:	83 c4 10             	add    $0x10,%esp
}
    2b42:	90                   	nop
    2b43:	c9                   	leave
    2b44:	c3                   	ret

00002b45 <rmdot>:

void
rmdot(void)
{
    2b45:	55                   	push   %ebp
    2b46:	89 e5                	mov    %esp,%ebp
    2b48:	83 ec 08             	sub    $0x8,%esp
  printf(1, "rmdot test\n");
    2b4b:	83 ec 08             	sub    $0x8,%esp
    2b4e:	68 4e 55 00 00       	push   $0x554e
    2b53:	6a 01                	push   $0x1
    2b55:	e8 ec 14 00 00       	call   4046 <printf>
    2b5a:	83 c4 10             	add    $0x10,%esp
  if(mkdir("dots") != 0){
    2b5d:	83 ec 0c             	sub    $0xc,%esp
    2b60:	68 5a 55 00 00       	push   $0x555a
    2b65:	e8 d0 13 00 00       	call   3f3a <mkdir>
    2b6a:	83 c4 10             	add    $0x10,%esp
    2b6d:	85 c0                	test   %eax,%eax
    2b6f:	74 17                	je     2b88 <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    2b71:	83 ec 08             	sub    $0x8,%esp
    2b74:	68 5f 55 00 00       	push   $0x555f
    2b79:	6a 01                	push   $0x1
    2b7b:	e8 c6 14 00 00       	call   4046 <printf>
    2b80:	83 c4 10             	add    $0x10,%esp
    exit();
    2b83:	e8 4a 13 00 00       	call   3ed2 <exit>
  }
  if(chdir("dots") != 0){
    2b88:	83 ec 0c             	sub    $0xc,%esp
    2b8b:	68 5a 55 00 00       	push   $0x555a
    2b90:	e8 ad 13 00 00       	call   3f42 <chdir>
    2b95:	83 c4 10             	add    $0x10,%esp
    2b98:	85 c0                	test   %eax,%eax
    2b9a:	74 17                	je     2bb3 <rmdot+0x6e>
    printf(1, "chdir dots failed\n");
    2b9c:	83 ec 08             	sub    $0x8,%esp
    2b9f:	68 72 55 00 00       	push   $0x5572
    2ba4:	6a 01                	push   $0x1
    2ba6:	e8 9b 14 00 00       	call   4046 <printf>
    2bab:	83 c4 10             	add    $0x10,%esp
    exit();
    2bae:	e8 1f 13 00 00       	call   3ed2 <exit>
  }
  if(unlink(".") == 0){
    2bb3:	83 ec 0c             	sub    $0xc,%esp
    2bb6:	68 8b 4c 00 00       	push   $0x4c8b
    2bbb:	e8 62 13 00 00       	call   3f22 <unlink>
    2bc0:	83 c4 10             	add    $0x10,%esp
    2bc3:	85 c0                	test   %eax,%eax
    2bc5:	75 17                	jne    2bde <rmdot+0x99>
    printf(1, "rm . worked!\n");
    2bc7:	83 ec 08             	sub    $0x8,%esp
    2bca:	68 85 55 00 00       	push   $0x5585
    2bcf:	6a 01                	push   $0x1
    2bd1:	e8 70 14 00 00       	call   4046 <printf>
    2bd6:	83 c4 10             	add    $0x10,%esp
    exit();
    2bd9:	e8 f4 12 00 00       	call   3ed2 <exit>
  }
  if(unlink("..") == 0){
    2bde:	83 ec 0c             	sub    $0xc,%esp
    2be1:	68 1e 48 00 00       	push   $0x481e
    2be6:	e8 37 13 00 00       	call   3f22 <unlink>
    2beb:	83 c4 10             	add    $0x10,%esp
    2bee:	85 c0                	test   %eax,%eax
    2bf0:	75 17                	jne    2c09 <rmdot+0xc4>
    printf(1, "rm .. worked!\n");
    2bf2:	83 ec 08             	sub    $0x8,%esp
    2bf5:	68 93 55 00 00       	push   $0x5593
    2bfa:	6a 01                	push   $0x1
    2bfc:	e8 45 14 00 00       	call   4046 <printf>
    2c01:	83 c4 10             	add    $0x10,%esp
    exit();
    2c04:	e8 c9 12 00 00       	call   3ed2 <exit>
  }
  if(chdir("/") != 0){
    2c09:	83 ec 0c             	sub    $0xc,%esp
    2c0c:	68 72 44 00 00       	push   $0x4472
    2c11:	e8 2c 13 00 00       	call   3f42 <chdir>
    2c16:	83 c4 10             	add    $0x10,%esp
    2c19:	85 c0                	test   %eax,%eax
    2c1b:	74 17                	je     2c34 <rmdot+0xef>
    printf(1, "chdir / failed\n");
    2c1d:	83 ec 08             	sub    $0x8,%esp
    2c20:	68 74 44 00 00       	push   $0x4474
    2c25:	6a 01                	push   $0x1
    2c27:	e8 1a 14 00 00       	call   4046 <printf>
    2c2c:	83 c4 10             	add    $0x10,%esp
    exit();
    2c2f:	e8 9e 12 00 00       	call   3ed2 <exit>
  }
  if(unlink("dots/.") == 0){
    2c34:	83 ec 0c             	sub    $0xc,%esp
    2c37:	68 a2 55 00 00       	push   $0x55a2
    2c3c:	e8 e1 12 00 00       	call   3f22 <unlink>
    2c41:	83 c4 10             	add    $0x10,%esp
    2c44:	85 c0                	test   %eax,%eax
    2c46:	75 17                	jne    2c5f <rmdot+0x11a>
    printf(1, "unlink dots/. worked!\n");
    2c48:	83 ec 08             	sub    $0x8,%esp
    2c4b:	68 a9 55 00 00       	push   $0x55a9
    2c50:	6a 01                	push   $0x1
    2c52:	e8 ef 13 00 00       	call   4046 <printf>
    2c57:	83 c4 10             	add    $0x10,%esp
    exit();
    2c5a:	e8 73 12 00 00       	call   3ed2 <exit>
  }
  if(unlink("dots/..") == 0){
    2c5f:	83 ec 0c             	sub    $0xc,%esp
    2c62:	68 c0 55 00 00       	push   $0x55c0
    2c67:	e8 b6 12 00 00       	call   3f22 <unlink>
    2c6c:	83 c4 10             	add    $0x10,%esp
    2c6f:	85 c0                	test   %eax,%eax
    2c71:	75 17                	jne    2c8a <rmdot+0x145>
    printf(1, "unlink dots/.. worked!\n");
    2c73:	83 ec 08             	sub    $0x8,%esp
    2c76:	68 c8 55 00 00       	push   $0x55c8
    2c7b:	6a 01                	push   $0x1
    2c7d:	e8 c4 13 00 00       	call   4046 <printf>
    2c82:	83 c4 10             	add    $0x10,%esp
    exit();
    2c85:	e8 48 12 00 00       	call   3ed2 <exit>
  }
  if(unlink("dots") != 0){
    2c8a:	83 ec 0c             	sub    $0xc,%esp
    2c8d:	68 5a 55 00 00       	push   $0x555a
    2c92:	e8 8b 12 00 00       	call   3f22 <unlink>
    2c97:	83 c4 10             	add    $0x10,%esp
    2c9a:	85 c0                	test   %eax,%eax
    2c9c:	74 17                	je     2cb5 <rmdot+0x170>
    printf(1, "unlink dots failed!\n");
    2c9e:	83 ec 08             	sub    $0x8,%esp
    2ca1:	68 e0 55 00 00       	push   $0x55e0
    2ca6:	6a 01                	push   $0x1
    2ca8:	e8 99 13 00 00       	call   4046 <printf>
    2cad:	83 c4 10             	add    $0x10,%esp
    exit();
    2cb0:	e8 1d 12 00 00       	call   3ed2 <exit>
  }
  printf(1, "rmdot ok\n");
    2cb5:	83 ec 08             	sub    $0x8,%esp
    2cb8:	68 f5 55 00 00       	push   $0x55f5
    2cbd:	6a 01                	push   $0x1
    2cbf:	e8 82 13 00 00       	call   4046 <printf>
    2cc4:	83 c4 10             	add    $0x10,%esp
}
    2cc7:	90                   	nop
    2cc8:	c9                   	leave
    2cc9:	c3                   	ret

00002cca <dirfile>:

void
dirfile(void)
{
    2cca:	55                   	push   %ebp
    2ccb:	89 e5                	mov    %esp,%ebp
    2ccd:	83 ec 18             	sub    $0x18,%esp
  int fd;

  printf(1, "dir vs file\n");
    2cd0:	83 ec 08             	sub    $0x8,%esp
    2cd3:	68 ff 55 00 00       	push   $0x55ff
    2cd8:	6a 01                	push   $0x1
    2cda:	e8 67 13 00 00       	call   4046 <printf>
    2cdf:	83 c4 10             	add    $0x10,%esp

  fd = open("dirfile", O_CREATE);
    2ce2:	83 ec 08             	sub    $0x8,%esp
    2ce5:	68 00 02 00 00       	push   $0x200
    2cea:	68 0c 56 00 00       	push   $0x560c
    2cef:	e8 1e 12 00 00       	call   3f12 <open>
    2cf4:	83 c4 10             	add    $0x10,%esp
    2cf7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2cfa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2cfe:	79 17                	jns    2d17 <dirfile+0x4d>
    printf(1, "create dirfile failed\n");
    2d00:	83 ec 08             	sub    $0x8,%esp
    2d03:	68 14 56 00 00       	push   $0x5614
    2d08:	6a 01                	push   $0x1
    2d0a:	e8 37 13 00 00       	call   4046 <printf>
    2d0f:	83 c4 10             	add    $0x10,%esp
    exit();
    2d12:	e8 bb 11 00 00       	call   3ed2 <exit>
  }
  close(fd);
    2d17:	83 ec 0c             	sub    $0xc,%esp
    2d1a:	ff 75 f4             	push   -0xc(%ebp)
    2d1d:	e8 d8 11 00 00       	call   3efa <close>
    2d22:	83 c4 10             	add    $0x10,%esp
  if(chdir("dirfile") == 0){
    2d25:	83 ec 0c             	sub    $0xc,%esp
    2d28:	68 0c 56 00 00       	push   $0x560c
    2d2d:	e8 10 12 00 00       	call   3f42 <chdir>
    2d32:	83 c4 10             	add    $0x10,%esp
    2d35:	85 c0                	test   %eax,%eax
    2d37:	75 17                	jne    2d50 <dirfile+0x86>
    printf(1, "chdir dirfile succeeded!\n");
    2d39:	83 ec 08             	sub    $0x8,%esp
    2d3c:	68 2b 56 00 00       	push   $0x562b
    2d41:	6a 01                	push   $0x1
    2d43:	e8 fe 12 00 00       	call   4046 <printf>
    2d48:	83 c4 10             	add    $0x10,%esp
    exit();
    2d4b:	e8 82 11 00 00       	call   3ed2 <exit>
  }
  fd = open("dirfile/xx", 0);
    2d50:	83 ec 08             	sub    $0x8,%esp
    2d53:	6a 00                	push   $0x0
    2d55:	68 45 56 00 00       	push   $0x5645
    2d5a:	e8 b3 11 00 00       	call   3f12 <open>
    2d5f:	83 c4 10             	add    $0x10,%esp
    2d62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2d65:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d69:	78 17                	js     2d82 <dirfile+0xb8>
    printf(1, "create dirfile/xx succeeded!\n");
    2d6b:	83 ec 08             	sub    $0x8,%esp
    2d6e:	68 50 56 00 00       	push   $0x5650
    2d73:	6a 01                	push   $0x1
    2d75:	e8 cc 12 00 00       	call   4046 <printf>
    2d7a:	83 c4 10             	add    $0x10,%esp
    exit();
    2d7d:	e8 50 11 00 00       	call   3ed2 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2d82:	83 ec 08             	sub    $0x8,%esp
    2d85:	68 00 02 00 00       	push   $0x200
    2d8a:	68 45 56 00 00       	push   $0x5645
    2d8f:	e8 7e 11 00 00       	call   3f12 <open>
    2d94:	83 c4 10             	add    $0x10,%esp
    2d97:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2d9a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2d9e:	78 17                	js     2db7 <dirfile+0xed>
    printf(1, "create dirfile/xx succeeded!\n");
    2da0:	83 ec 08             	sub    $0x8,%esp
    2da3:	68 50 56 00 00       	push   $0x5650
    2da8:	6a 01                	push   $0x1
    2daa:	e8 97 12 00 00       	call   4046 <printf>
    2daf:	83 c4 10             	add    $0x10,%esp
    exit();
    2db2:	e8 1b 11 00 00       	call   3ed2 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2db7:	83 ec 0c             	sub    $0xc,%esp
    2dba:	68 45 56 00 00       	push   $0x5645
    2dbf:	e8 76 11 00 00       	call   3f3a <mkdir>
    2dc4:	83 c4 10             	add    $0x10,%esp
    2dc7:	85 c0                	test   %eax,%eax
    2dc9:	75 17                	jne    2de2 <dirfile+0x118>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2dcb:	83 ec 08             	sub    $0x8,%esp
    2dce:	68 6e 56 00 00       	push   $0x566e
    2dd3:	6a 01                	push   $0x1
    2dd5:	e8 6c 12 00 00       	call   4046 <printf>
    2dda:	83 c4 10             	add    $0x10,%esp
    exit();
    2ddd:	e8 f0 10 00 00       	call   3ed2 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2de2:	83 ec 0c             	sub    $0xc,%esp
    2de5:	68 45 56 00 00       	push   $0x5645
    2dea:	e8 33 11 00 00       	call   3f22 <unlink>
    2def:	83 c4 10             	add    $0x10,%esp
    2df2:	85 c0                	test   %eax,%eax
    2df4:	75 17                	jne    2e0d <dirfile+0x143>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2df6:	83 ec 08             	sub    $0x8,%esp
    2df9:	68 8b 56 00 00       	push   $0x568b
    2dfe:	6a 01                	push   $0x1
    2e00:	e8 41 12 00 00       	call   4046 <printf>
    2e05:	83 c4 10             	add    $0x10,%esp
    exit();
    2e08:	e8 c5 10 00 00       	call   3ed2 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2e0d:	83 ec 08             	sub    $0x8,%esp
    2e10:	68 45 56 00 00       	push   $0x5645
    2e15:	68 a9 56 00 00       	push   $0x56a9
    2e1a:	e8 13 11 00 00       	call   3f32 <link>
    2e1f:	83 c4 10             	add    $0x10,%esp
    2e22:	85 c0                	test   %eax,%eax
    2e24:	75 17                	jne    2e3d <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2e26:	83 ec 08             	sub    $0x8,%esp
    2e29:	68 b0 56 00 00       	push   $0x56b0
    2e2e:	6a 01                	push   $0x1
    2e30:	e8 11 12 00 00       	call   4046 <printf>
    2e35:	83 c4 10             	add    $0x10,%esp
    exit();
    2e38:	e8 95 10 00 00       	call   3ed2 <exit>
  }
  if(unlink("dirfile") != 0){
    2e3d:	83 ec 0c             	sub    $0xc,%esp
    2e40:	68 0c 56 00 00       	push   $0x560c
    2e45:	e8 d8 10 00 00       	call   3f22 <unlink>
    2e4a:	83 c4 10             	add    $0x10,%esp
    2e4d:	85 c0                	test   %eax,%eax
    2e4f:	74 17                	je     2e68 <dirfile+0x19e>
    printf(1, "unlink dirfile failed!\n");
    2e51:	83 ec 08             	sub    $0x8,%esp
    2e54:	68 cf 56 00 00       	push   $0x56cf
    2e59:	6a 01                	push   $0x1
    2e5b:	e8 e6 11 00 00       	call   4046 <printf>
    2e60:	83 c4 10             	add    $0x10,%esp
    exit();
    2e63:	e8 6a 10 00 00       	call   3ed2 <exit>
  }

  fd = open(".", O_RDWR);
    2e68:	83 ec 08             	sub    $0x8,%esp
    2e6b:	6a 02                	push   $0x2
    2e6d:	68 8b 4c 00 00       	push   $0x4c8b
    2e72:	e8 9b 10 00 00       	call   3f12 <open>
    2e77:	83 c4 10             	add    $0x10,%esp
    2e7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2e7d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e81:	78 17                	js     2e9a <dirfile+0x1d0>
    printf(1, "open . for writing succeeded!\n");
    2e83:	83 ec 08             	sub    $0x8,%esp
    2e86:	68 e8 56 00 00       	push   $0x56e8
    2e8b:	6a 01                	push   $0x1
    2e8d:	e8 b4 11 00 00       	call   4046 <printf>
    2e92:	83 c4 10             	add    $0x10,%esp
    exit();
    2e95:	e8 38 10 00 00       	call   3ed2 <exit>
  }
  fd = open(".", 0);
    2e9a:	83 ec 08             	sub    $0x8,%esp
    2e9d:	6a 00                	push   $0x0
    2e9f:	68 8b 4c 00 00       	push   $0x4c8b
    2ea4:	e8 69 10 00 00       	call   3f12 <open>
    2ea9:	83 c4 10             	add    $0x10,%esp
    2eac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2eaf:	83 ec 04             	sub    $0x4,%esp
    2eb2:	6a 01                	push   $0x1
    2eb4:	68 d7 48 00 00       	push   $0x48d7
    2eb9:	ff 75 f4             	push   -0xc(%ebp)
    2ebc:	e8 31 10 00 00       	call   3ef2 <write>
    2ec1:	83 c4 10             	add    $0x10,%esp
    2ec4:	85 c0                	test   %eax,%eax
    2ec6:	7e 17                	jle    2edf <dirfile+0x215>
    printf(1, "write . succeeded!\n");
    2ec8:	83 ec 08             	sub    $0x8,%esp
    2ecb:	68 07 57 00 00       	push   $0x5707
    2ed0:	6a 01                	push   $0x1
    2ed2:	e8 6f 11 00 00       	call   4046 <printf>
    2ed7:	83 c4 10             	add    $0x10,%esp
    exit();
    2eda:	e8 f3 0f 00 00       	call   3ed2 <exit>
  }
  close(fd);
    2edf:	83 ec 0c             	sub    $0xc,%esp
    2ee2:	ff 75 f4             	push   -0xc(%ebp)
    2ee5:	e8 10 10 00 00       	call   3efa <close>
    2eea:	83 c4 10             	add    $0x10,%esp

  printf(1, "dir vs file OK\n");
    2eed:	83 ec 08             	sub    $0x8,%esp
    2ef0:	68 1b 57 00 00       	push   $0x571b
    2ef5:	6a 01                	push   $0x1
    2ef7:	e8 4a 11 00 00       	call   4046 <printf>
    2efc:	83 c4 10             	add    $0x10,%esp
}
    2eff:	90                   	nop
    2f00:	c9                   	leave
    2f01:	c3                   	ret

00002f02 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2f02:	55                   	push   %ebp
    2f03:	89 e5                	mov    %esp,%ebp
    2f05:	83 ec 18             	sub    $0x18,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2f08:	83 ec 08             	sub    $0x8,%esp
    2f0b:	68 2b 57 00 00       	push   $0x572b
    2f10:	6a 01                	push   $0x1
    2f12:	e8 2f 11 00 00       	call   4046 <printf>
    2f17:	83 c4 10             	add    $0x10,%esp

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2f1a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2f21:	e9 e7 00 00 00       	jmp    300d <iref+0x10b>
    if(mkdir("irefd") != 0){
    2f26:	83 ec 0c             	sub    $0xc,%esp
    2f29:	68 3c 57 00 00       	push   $0x573c
    2f2e:	e8 07 10 00 00       	call   3f3a <mkdir>
    2f33:	83 c4 10             	add    $0x10,%esp
    2f36:	85 c0                	test   %eax,%eax
    2f38:	74 17                	je     2f51 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2f3a:	83 ec 08             	sub    $0x8,%esp
    2f3d:	68 42 57 00 00       	push   $0x5742
    2f42:	6a 01                	push   $0x1
    2f44:	e8 fd 10 00 00       	call   4046 <printf>
    2f49:	83 c4 10             	add    $0x10,%esp
      exit();
    2f4c:	e8 81 0f 00 00       	call   3ed2 <exit>
    }
    if(chdir("irefd") != 0){
    2f51:	83 ec 0c             	sub    $0xc,%esp
    2f54:	68 3c 57 00 00       	push   $0x573c
    2f59:	e8 e4 0f 00 00       	call   3f42 <chdir>
    2f5e:	83 c4 10             	add    $0x10,%esp
    2f61:	85 c0                	test   %eax,%eax
    2f63:	74 17                	je     2f7c <iref+0x7a>
      printf(1, "chdir irefd failed\n");
    2f65:	83 ec 08             	sub    $0x8,%esp
    2f68:	68 56 57 00 00       	push   $0x5756
    2f6d:	6a 01                	push   $0x1
    2f6f:	e8 d2 10 00 00       	call   4046 <printf>
    2f74:	83 c4 10             	add    $0x10,%esp
      exit();
    2f77:	e8 56 0f 00 00       	call   3ed2 <exit>
    }

    mkdir("");
    2f7c:	83 ec 0c             	sub    $0xc,%esp
    2f7f:	68 6a 57 00 00       	push   $0x576a
    2f84:	e8 b1 0f 00 00       	call   3f3a <mkdir>
    2f89:	83 c4 10             	add    $0x10,%esp
    link("README", "");
    2f8c:	83 ec 08             	sub    $0x8,%esp
    2f8f:	68 6a 57 00 00       	push   $0x576a
    2f94:	68 a9 56 00 00       	push   $0x56a9
    2f99:	e8 94 0f 00 00       	call   3f32 <link>
    2f9e:	83 c4 10             	add    $0x10,%esp
    fd = open("", O_CREATE);
    2fa1:	83 ec 08             	sub    $0x8,%esp
    2fa4:	68 00 02 00 00       	push   $0x200
    2fa9:	68 6a 57 00 00       	push   $0x576a
    2fae:	e8 5f 0f 00 00       	call   3f12 <open>
    2fb3:	83 c4 10             	add    $0x10,%esp
    2fb6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2fb9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2fbd:	78 0e                	js     2fcd <iref+0xcb>
      close(fd);
    2fbf:	83 ec 0c             	sub    $0xc,%esp
    2fc2:	ff 75 f0             	push   -0x10(%ebp)
    2fc5:	e8 30 0f 00 00       	call   3efa <close>
    2fca:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2fcd:	83 ec 08             	sub    $0x8,%esp
    2fd0:	68 00 02 00 00       	push   $0x200
    2fd5:	68 6b 57 00 00       	push   $0x576b
    2fda:	e8 33 0f 00 00       	call   3f12 <open>
    2fdf:	83 c4 10             	add    $0x10,%esp
    2fe2:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2fe5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2fe9:	78 0e                	js     2ff9 <iref+0xf7>
      close(fd);
    2feb:	83 ec 0c             	sub    $0xc,%esp
    2fee:	ff 75 f0             	push   -0x10(%ebp)
    2ff1:	e8 04 0f 00 00       	call   3efa <close>
    2ff6:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2ff9:	83 ec 0c             	sub    $0xc,%esp
    2ffc:	68 6b 57 00 00       	push   $0x576b
    3001:	e8 1c 0f 00 00       	call   3f22 <unlink>
    3006:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 50 + 1; i++){
    3009:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    300d:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    3011:	0f 8e 0f ff ff ff    	jle    2f26 <iref+0x24>
  }

  chdir("/");
    3017:	83 ec 0c             	sub    $0xc,%esp
    301a:	68 72 44 00 00       	push   $0x4472
    301f:	e8 1e 0f 00 00       	call   3f42 <chdir>
    3024:	83 c4 10             	add    $0x10,%esp
  printf(1, "empty file name OK\n");
    3027:	83 ec 08             	sub    $0x8,%esp
    302a:	68 6e 57 00 00       	push   $0x576e
    302f:	6a 01                	push   $0x1
    3031:	e8 10 10 00 00       	call   4046 <printf>
    3036:	83 c4 10             	add    $0x10,%esp
}
    3039:	90                   	nop
    303a:	c9                   	leave
    303b:	c3                   	ret

0000303c <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    303c:	55                   	push   %ebp
    303d:	89 e5                	mov    %esp,%ebp
    303f:	83 ec 18             	sub    $0x18,%esp
  int n, pid;

  printf(1, "fork test\n");
    3042:	83 ec 08             	sub    $0x8,%esp
    3045:	68 82 57 00 00       	push   $0x5782
    304a:	6a 01                	push   $0x1
    304c:	e8 f5 0f 00 00       	call   4046 <printf>
    3051:	83 c4 10             	add    $0x10,%esp

  for(n=0; n<1000; n++){
    3054:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    305b:	eb 1d                	jmp    307a <forktest+0x3e>
    pid = fork();
    305d:	e8 68 0e 00 00       	call   3eca <fork>
    3062:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    3065:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3069:	78 1a                	js     3085 <forktest+0x49>
      break;
    if(pid == 0)
    306b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    306f:	75 05                	jne    3076 <forktest+0x3a>
      exit();
    3071:	e8 5c 0e 00 00       	call   3ed2 <exit>
  for(n=0; n<1000; n++){
    3076:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    307a:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    3081:	7e da                	jle    305d <forktest+0x21>
    3083:	eb 01                	jmp    3086 <forktest+0x4a>
      break;
    3085:	90                   	nop
  }
  
  if(n == 1000){
    3086:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    308d:	75 3b                	jne    30ca <forktest+0x8e>
    printf(1, "fork claimed to work 1000 times!\n");
    308f:	83 ec 08             	sub    $0x8,%esp
    3092:	68 90 57 00 00       	push   $0x5790
    3097:	6a 01                	push   $0x1
    3099:	e8 a8 0f 00 00       	call   4046 <printf>
    309e:	83 c4 10             	add    $0x10,%esp
    exit();
    30a1:	e8 2c 0e 00 00       	call   3ed2 <exit>
  }
  
  for(; n > 0; n--){
    if(wait() < 0){
    30a6:	e8 2f 0e 00 00       	call   3eda <wait>
    30ab:	85 c0                	test   %eax,%eax
    30ad:	79 17                	jns    30c6 <forktest+0x8a>
      printf(1, "wait stopped early\n");
    30af:	83 ec 08             	sub    $0x8,%esp
    30b2:	68 b2 57 00 00       	push   $0x57b2
    30b7:	6a 01                	push   $0x1
    30b9:	e8 88 0f 00 00       	call   4046 <printf>
    30be:	83 c4 10             	add    $0x10,%esp
      exit();
    30c1:	e8 0c 0e 00 00       	call   3ed2 <exit>
  for(; n > 0; n--){
    30c6:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    30ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    30ce:	7f d6                	jg     30a6 <forktest+0x6a>
    }
  }
  
  if(wait() != -1){
    30d0:	e8 05 0e 00 00       	call   3eda <wait>
    30d5:	83 f8 ff             	cmp    $0xffffffff,%eax
    30d8:	74 17                	je     30f1 <forktest+0xb5>
    printf(1, "wait got too many\n");
    30da:	83 ec 08             	sub    $0x8,%esp
    30dd:	68 c6 57 00 00       	push   $0x57c6
    30e2:	6a 01                	push   $0x1
    30e4:	e8 5d 0f 00 00       	call   4046 <printf>
    30e9:	83 c4 10             	add    $0x10,%esp
    exit();
    30ec:	e8 e1 0d 00 00       	call   3ed2 <exit>
  }
  
  printf(1, "fork test OK\n");
    30f1:	83 ec 08             	sub    $0x8,%esp
    30f4:	68 d9 57 00 00       	push   $0x57d9
    30f9:	6a 01                	push   $0x1
    30fb:	e8 46 0f 00 00       	call   4046 <printf>
    3100:	83 c4 10             	add    $0x10,%esp
}
    3103:	90                   	nop
    3104:	c9                   	leave
    3105:	c3                   	ret

00003106 <sbrktest>:

void
sbrktest(void)
{
    3106:	55                   	push   %ebp
    3107:	89 e5                	mov    %esp,%ebp
    3109:	83 ec 68             	sub    $0x68,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    310c:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3111:	83 ec 08             	sub    $0x8,%esp
    3114:	68 e7 57 00 00       	push   $0x57e7
    3119:	50                   	push   %eax
    311a:	e8 27 0f 00 00       	call   4046 <printf>
    311f:	83 c4 10             	add    $0x10,%esp
  oldbrk = sbrk(0);
    3122:	83 ec 0c             	sub    $0xc,%esp
    3125:	6a 00                	push   $0x0
    3127:	e8 2e 0e 00 00       	call   3f5a <sbrk>
    312c:	83 c4 10             	add    $0x10,%esp
    312f:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    3132:	83 ec 0c             	sub    $0xc,%esp
    3135:	6a 00                	push   $0x0
    3137:	e8 1e 0e 00 00       	call   3f5a <sbrk>
    313c:	83 c4 10             	add    $0x10,%esp
    313f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    3142:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3149:	eb 4f                	jmp    319a <sbrktest+0x94>
    b = sbrk(1);
    314b:	83 ec 0c             	sub    $0xc,%esp
    314e:	6a 01                	push   $0x1
    3150:	e8 05 0e 00 00       	call   3f5a <sbrk>
    3155:	83 c4 10             	add    $0x10,%esp
    3158:	89 45 d0             	mov    %eax,-0x30(%ebp)
    if(b != a){
    315b:	8b 45 d0             	mov    -0x30(%ebp),%eax
    315e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3161:	74 24                	je     3187 <sbrktest+0x81>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3163:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3168:	83 ec 0c             	sub    $0xc,%esp
    316b:	ff 75 d0             	push   -0x30(%ebp)
    316e:	ff 75 f4             	push   -0xc(%ebp)
    3171:	ff 75 f0             	push   -0x10(%ebp)
    3174:	68 f2 57 00 00       	push   $0x57f2
    3179:	50                   	push   %eax
    317a:	e8 c7 0e 00 00       	call   4046 <printf>
    317f:	83 c4 20             	add    $0x20,%esp
      exit();
    3182:	e8 4b 0d 00 00       	call   3ed2 <exit>
    }
    *b = 1;
    3187:	8b 45 d0             	mov    -0x30(%ebp),%eax
    318a:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    318d:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3190:	83 c0 01             	add    $0x1,%eax
    3193:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; i < 5000; i++){ 
    3196:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    319a:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    31a1:	7e a8                	jle    314b <sbrktest+0x45>
  }
  pid = fork();
    31a3:	e8 22 0d 00 00       	call   3eca <fork>
    31a8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(pid < 0){
    31ab:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    31af:	79 1b                	jns    31cc <sbrktest+0xc6>
    printf(stdout, "sbrk test fork failed\n");
    31b1:	a1 b4 62 00 00       	mov    0x62b4,%eax
    31b6:	83 ec 08             	sub    $0x8,%esp
    31b9:	68 0d 58 00 00       	push   $0x580d
    31be:	50                   	push   %eax
    31bf:	e8 82 0e 00 00       	call   4046 <printf>
    31c4:	83 c4 10             	add    $0x10,%esp
    exit();
    31c7:	e8 06 0d 00 00       	call   3ed2 <exit>
  }
  c = sbrk(1);
    31cc:	83 ec 0c             	sub    $0xc,%esp
    31cf:	6a 01                	push   $0x1
    31d1:	e8 84 0d 00 00       	call   3f5a <sbrk>
    31d6:	83 c4 10             	add    $0x10,%esp
    31d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  c = sbrk(1);
    31dc:	83 ec 0c             	sub    $0xc,%esp
    31df:	6a 01                	push   $0x1
    31e1:	e8 74 0d 00 00       	call   3f5a <sbrk>
    31e6:	83 c4 10             	add    $0x10,%esp
    31e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(c != a + 1){
    31ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
    31ef:	83 c0 01             	add    $0x1,%eax
    31f2:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    31f5:	74 1b                	je     3212 <sbrktest+0x10c>
    printf(stdout, "sbrk test failed post-fork\n");
    31f7:	a1 b4 62 00 00       	mov    0x62b4,%eax
    31fc:	83 ec 08             	sub    $0x8,%esp
    31ff:	68 24 58 00 00       	push   $0x5824
    3204:	50                   	push   %eax
    3205:	e8 3c 0e 00 00       	call   4046 <printf>
    320a:	83 c4 10             	add    $0x10,%esp
    exit();
    320d:	e8 c0 0c 00 00       	call   3ed2 <exit>
  }
  if(pid == 0)
    3212:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    3216:	75 05                	jne    321d <sbrktest+0x117>
    exit();
    3218:	e8 b5 0c 00 00       	call   3ed2 <exit>
  wait();
    321d:	e8 b8 0c 00 00       	call   3eda <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3222:	83 ec 0c             	sub    $0xc,%esp
    3225:	6a 00                	push   $0x0
    3227:	e8 2e 0d 00 00       	call   3f5a <sbrk>
    322c:	83 c4 10             	add    $0x10,%esp
    322f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    3232:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3235:	ba 00 00 40 06       	mov    $0x6400000,%edx
    323a:	29 c2                	sub    %eax,%edx
    323c:	89 55 e0             	mov    %edx,-0x20(%ebp)
  p = sbrk(amt);
    323f:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3242:	83 ec 0c             	sub    $0xc,%esp
    3245:	50                   	push   %eax
    3246:	e8 0f 0d 00 00       	call   3f5a <sbrk>
    324b:	83 c4 10             	add    $0x10,%esp
    324e:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if (p != a) { 
    3251:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3254:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3257:	74 1b                	je     3274 <sbrktest+0x16e>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3259:	a1 b4 62 00 00       	mov    0x62b4,%eax
    325e:	83 ec 08             	sub    $0x8,%esp
    3261:	68 40 58 00 00       	push   $0x5840
    3266:	50                   	push   %eax
    3267:	e8 da 0d 00 00       	call   4046 <printf>
    326c:	83 c4 10             	add    $0x10,%esp
    exit();
    326f:	e8 5e 0c 00 00       	call   3ed2 <exit>
  }
  lastaddr = (char*) (BIG-1);
    3274:	c7 45 d8 ff ff 3f 06 	movl   $0x63fffff,-0x28(%ebp)
  *lastaddr = 99;
    327b:	8b 45 d8             	mov    -0x28(%ebp),%eax
    327e:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    3281:	83 ec 0c             	sub    $0xc,%esp
    3284:	6a 00                	push   $0x0
    3286:	e8 cf 0c 00 00       	call   3f5a <sbrk>
    328b:	83 c4 10             	add    $0x10,%esp
    328e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    3291:	83 ec 0c             	sub    $0xc,%esp
    3294:	68 00 f0 ff ff       	push   $0xfffff000
    3299:	e8 bc 0c 00 00       	call   3f5a <sbrk>
    329e:	83 c4 10             	add    $0x10,%esp
    32a1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(c == (char*)0xffffffff){
    32a4:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
    32a8:	75 1b                	jne    32c5 <sbrktest+0x1bf>
    printf(stdout, "sbrk could not deallocate\n");
    32aa:	a1 b4 62 00 00       	mov    0x62b4,%eax
    32af:	83 ec 08             	sub    $0x8,%esp
    32b2:	68 7e 58 00 00       	push   $0x587e
    32b7:	50                   	push   %eax
    32b8:	e8 89 0d 00 00       	call   4046 <printf>
    32bd:	83 c4 10             	add    $0x10,%esp
    exit();
    32c0:	e8 0d 0c 00 00       	call   3ed2 <exit>
  }
  c = sbrk(0);
    32c5:	83 ec 0c             	sub    $0xc,%esp
    32c8:	6a 00                	push   $0x0
    32ca:	e8 8b 0c 00 00       	call   3f5a <sbrk>
    32cf:	83 c4 10             	add    $0x10,%esp
    32d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(c != a - 4096){
    32d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    32d8:	2d 00 10 00 00       	sub    $0x1000,%eax
    32dd:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
    32e0:	74 1e                	je     3300 <sbrktest+0x1fa>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    32e2:	a1 b4 62 00 00       	mov    0x62b4,%eax
    32e7:	ff 75 e4             	push   -0x1c(%ebp)
    32ea:	ff 75 f4             	push   -0xc(%ebp)
    32ed:	68 9c 58 00 00       	push   $0x589c
    32f2:	50                   	push   %eax
    32f3:	e8 4e 0d 00 00       	call   4046 <printf>
    32f8:	83 c4 10             	add    $0x10,%esp
    exit();
    32fb:	e8 d2 0b 00 00       	call   3ed2 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3300:	83 ec 0c             	sub    $0xc,%esp
    3303:	6a 00                	push   $0x0
    3305:	e8 50 0c 00 00       	call   3f5a <sbrk>
    330a:	83 c4 10             	add    $0x10,%esp
    330d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    3310:	83 ec 0c             	sub    $0xc,%esp
    3313:	68 00 10 00 00       	push   $0x1000
    3318:	e8 3d 0c 00 00       	call   3f5a <sbrk>
    331d:	83 c4 10             	add    $0x10,%esp
    3320:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    3323:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3326:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3329:	75 1a                	jne    3345 <sbrktest+0x23f>
    332b:	83 ec 0c             	sub    $0xc,%esp
    332e:	6a 00                	push   $0x0
    3330:	e8 25 0c 00 00       	call   3f5a <sbrk>
    3335:	83 c4 10             	add    $0x10,%esp
    3338:	8b 55 f4             	mov    -0xc(%ebp),%edx
    333b:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3341:	39 d0                	cmp    %edx,%eax
    3343:	74 1e                	je     3363 <sbrktest+0x25d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3345:	a1 b4 62 00 00       	mov    0x62b4,%eax
    334a:	ff 75 e4             	push   -0x1c(%ebp)
    334d:	ff 75 f4             	push   -0xc(%ebp)
    3350:	68 d4 58 00 00       	push   $0x58d4
    3355:	50                   	push   %eax
    3356:	e8 eb 0c 00 00       	call   4046 <printf>
    335b:	83 c4 10             	add    $0x10,%esp
    exit();
    335e:	e8 6f 0b 00 00       	call   3ed2 <exit>
  }
  if(*lastaddr == 99){
    3363:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3366:	0f b6 00             	movzbl (%eax),%eax
    3369:	3c 63                	cmp    $0x63,%al
    336b:	75 1b                	jne    3388 <sbrktest+0x282>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    336d:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3372:	83 ec 08             	sub    $0x8,%esp
    3375:	68 fc 58 00 00       	push   $0x58fc
    337a:	50                   	push   %eax
    337b:	e8 c6 0c 00 00       	call   4046 <printf>
    3380:	83 c4 10             	add    $0x10,%esp
    exit();
    3383:	e8 4a 0b 00 00       	call   3ed2 <exit>
  }

  a = sbrk(0);
    3388:	83 ec 0c             	sub    $0xc,%esp
    338b:	6a 00                	push   $0x0
    338d:	e8 c8 0b 00 00       	call   3f5a <sbrk>
    3392:	83 c4 10             	add    $0x10,%esp
    3395:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    3398:	83 ec 0c             	sub    $0xc,%esp
    339b:	6a 00                	push   $0x0
    339d:	e8 b8 0b 00 00       	call   3f5a <sbrk>
    33a2:	83 c4 10             	add    $0x10,%esp
    33a5:	8b 55 ec             	mov    -0x14(%ebp),%edx
    33a8:	29 c2                	sub    %eax,%edx
    33aa:	83 ec 0c             	sub    $0xc,%esp
    33ad:	52                   	push   %edx
    33ae:	e8 a7 0b 00 00       	call   3f5a <sbrk>
    33b3:	83 c4 10             	add    $0x10,%esp
    33b6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(c != a){
    33b9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    33bc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    33bf:	74 1e                	je     33df <sbrktest+0x2d9>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    33c1:	a1 b4 62 00 00       	mov    0x62b4,%eax
    33c6:	ff 75 e4             	push   -0x1c(%ebp)
    33c9:	ff 75 f4             	push   -0xc(%ebp)
    33cc:	68 2c 59 00 00       	push   $0x592c
    33d1:	50                   	push   %eax
    33d2:	e8 6f 0c 00 00       	call   4046 <printf>
    33d7:	83 c4 10             	add    $0x10,%esp
    exit();
    33da:	e8 f3 0a 00 00       	call   3ed2 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    33df:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    33e6:	eb 76                	jmp    345e <sbrktest+0x358>
    ppid = getpid();
    33e8:	e8 65 0b 00 00       	call   3f52 <getpid>
    33ed:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    pid = fork();
    33f0:	e8 d5 0a 00 00       	call   3eca <fork>
    33f5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(pid < 0){
    33f8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    33fc:	79 1b                	jns    3419 <sbrktest+0x313>
      printf(stdout, "fork failed\n");
    33fe:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3403:	83 ec 08             	sub    $0x8,%esp
    3406:	68 a1 44 00 00       	push   $0x44a1
    340b:	50                   	push   %eax
    340c:	e8 35 0c 00 00       	call   4046 <printf>
    3411:	83 c4 10             	add    $0x10,%esp
      exit();
    3414:	e8 b9 0a 00 00       	call   3ed2 <exit>
    }
    if(pid == 0){
    3419:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    341d:	75 33                	jne    3452 <sbrktest+0x34c>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    341f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3422:	0f b6 00             	movzbl (%eax),%eax
    3425:	0f be d0             	movsbl %al,%edx
    3428:	a1 b4 62 00 00       	mov    0x62b4,%eax
    342d:	52                   	push   %edx
    342e:	ff 75 f4             	push   -0xc(%ebp)
    3431:	68 4d 59 00 00       	push   $0x594d
    3436:	50                   	push   %eax
    3437:	e8 0a 0c 00 00       	call   4046 <printf>
    343c:	83 c4 10             	add    $0x10,%esp
      kill(ppid);
    343f:	83 ec 0c             	sub    $0xc,%esp
    3442:	ff 75 d4             	push   -0x2c(%ebp)
    3445:	e8 b8 0a 00 00       	call   3f02 <kill>
    344a:	83 c4 10             	add    $0x10,%esp
      exit();
    344d:	e8 80 0a 00 00       	call   3ed2 <exit>
    }
    wait();
    3452:	e8 83 0a 00 00       	call   3eda <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3457:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    345e:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    3465:	76 81                	jbe    33e8 <sbrktest+0x2e2>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    3467:	83 ec 0c             	sub    $0xc,%esp
    346a:	8d 45 c8             	lea    -0x38(%ebp),%eax
    346d:	50                   	push   %eax
    346e:	e8 6f 0a 00 00       	call   3ee2 <pipe>
    3473:	83 c4 10             	add    $0x10,%esp
    3476:	85 c0                	test   %eax,%eax
    3478:	74 17                	je     3491 <sbrktest+0x38b>
    printf(1, "pipe() failed\n");
    347a:	83 ec 08             	sub    $0x8,%esp
    347d:	68 72 48 00 00       	push   $0x4872
    3482:	6a 01                	push   $0x1
    3484:	e8 bd 0b 00 00       	call   4046 <printf>
    3489:	83 c4 10             	add    $0x10,%esp
    exit();
    348c:	e8 41 0a 00 00       	call   3ed2 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3491:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3498:	e9 86 00 00 00       	jmp    3523 <sbrktest+0x41d>
    if((pids[i] = fork()) == 0){
    349d:	e8 28 0a 00 00       	call   3eca <fork>
    34a2:	8b 55 f0             	mov    -0x10(%ebp),%edx
    34a5:	89 44 95 a0          	mov    %eax,-0x60(%ebp,%edx,4)
    34a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    34ac:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    34b0:	85 c0                	test   %eax,%eax
    34b2:	75 4a                	jne    34fe <sbrktest+0x3f8>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    34b4:	83 ec 0c             	sub    $0xc,%esp
    34b7:	6a 00                	push   $0x0
    34b9:	e8 9c 0a 00 00       	call   3f5a <sbrk>
    34be:	83 c4 10             	add    $0x10,%esp
    34c1:	89 c2                	mov    %eax,%edx
    34c3:	b8 00 00 40 06       	mov    $0x6400000,%eax
    34c8:	29 d0                	sub    %edx,%eax
    34ca:	83 ec 0c             	sub    $0xc,%esp
    34cd:	50                   	push   %eax
    34ce:	e8 87 0a 00 00       	call   3f5a <sbrk>
    34d3:	83 c4 10             	add    $0x10,%esp
      write(fds[1], "x", 1);
    34d6:	8b 45 cc             	mov    -0x34(%ebp),%eax
    34d9:	83 ec 04             	sub    $0x4,%esp
    34dc:	6a 01                	push   $0x1
    34de:	68 d7 48 00 00       	push   $0x48d7
    34e3:	50                   	push   %eax
    34e4:	e8 09 0a 00 00       	call   3ef2 <write>
    34e9:	83 c4 10             	add    $0x10,%esp
      // sit around until killed
      for(;;) sleep(1000);
    34ec:	83 ec 0c             	sub    $0xc,%esp
    34ef:	68 e8 03 00 00       	push   $0x3e8
    34f4:	e8 69 0a 00 00       	call   3f62 <sleep>
    34f9:	83 c4 10             	add    $0x10,%esp
    34fc:	eb ee                	jmp    34ec <sbrktest+0x3e6>
    }
    if(pids[i] != -1)
    34fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3501:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3505:	83 f8 ff             	cmp    $0xffffffff,%eax
    3508:	74 15                	je     351f <sbrktest+0x419>
      read(fds[0], &scratch, 1);
    350a:	8b 45 c8             	mov    -0x38(%ebp),%eax
    350d:	83 ec 04             	sub    $0x4,%esp
    3510:	6a 01                	push   $0x1
    3512:	8d 55 9f             	lea    -0x61(%ebp),%edx
    3515:	52                   	push   %edx
    3516:	50                   	push   %eax
    3517:	e8 ce 09 00 00       	call   3eea <read>
    351c:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    351f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3523:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3526:	83 f8 09             	cmp    $0x9,%eax
    3529:	0f 86 6e ff ff ff    	jbe    349d <sbrktest+0x397>
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    352f:	83 ec 0c             	sub    $0xc,%esp
    3532:	68 00 10 00 00       	push   $0x1000
    3537:	e8 1e 0a 00 00       	call   3f5a <sbrk>
    353c:	83 c4 10             	add    $0x10,%esp
    353f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3542:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3549:	eb 2b                	jmp    3576 <sbrktest+0x470>
    if(pids[i] == -1)
    354b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    354e:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3552:	83 f8 ff             	cmp    $0xffffffff,%eax
    3555:	74 1a                	je     3571 <sbrktest+0x46b>
      continue;
    kill(pids[i]);
    3557:	8b 45 f0             	mov    -0x10(%ebp),%eax
    355a:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    355e:	83 ec 0c             	sub    $0xc,%esp
    3561:	50                   	push   %eax
    3562:	e8 9b 09 00 00       	call   3f02 <kill>
    3567:	83 c4 10             	add    $0x10,%esp
    wait();
    356a:	e8 6b 09 00 00       	call   3eda <wait>
    356f:	eb 01                	jmp    3572 <sbrktest+0x46c>
      continue;
    3571:	90                   	nop
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3572:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3576:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3579:	83 f8 09             	cmp    $0x9,%eax
    357c:	76 cd                	jbe    354b <sbrktest+0x445>
  }
  if(c == (char*)0xffffffff){
    357e:	83 7d e4 ff          	cmpl   $0xffffffff,-0x1c(%ebp)
    3582:	75 1b                	jne    359f <sbrktest+0x499>
    printf(stdout, "failed sbrk leaked memory\n");
    3584:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3589:	83 ec 08             	sub    $0x8,%esp
    358c:	68 66 59 00 00       	push   $0x5966
    3591:	50                   	push   %eax
    3592:	e8 af 0a 00 00       	call   4046 <printf>
    3597:	83 c4 10             	add    $0x10,%esp
    exit();
    359a:	e8 33 09 00 00       	call   3ed2 <exit>
  }

  if(sbrk(0) > oldbrk)
    359f:	83 ec 0c             	sub    $0xc,%esp
    35a2:	6a 00                	push   $0x0
    35a4:	e8 b1 09 00 00       	call   3f5a <sbrk>
    35a9:	83 c4 10             	add    $0x10,%esp
    35ac:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    35af:	73 1e                	jae    35cf <sbrktest+0x4c9>
    sbrk(-(sbrk(0) - oldbrk));
    35b1:	83 ec 0c             	sub    $0xc,%esp
    35b4:	6a 00                	push   $0x0
    35b6:	e8 9f 09 00 00       	call   3f5a <sbrk>
    35bb:	83 c4 10             	add    $0x10,%esp
    35be:	8b 55 ec             	mov    -0x14(%ebp),%edx
    35c1:	29 c2                	sub    %eax,%edx
    35c3:	83 ec 0c             	sub    $0xc,%esp
    35c6:	52                   	push   %edx
    35c7:	e8 8e 09 00 00       	call   3f5a <sbrk>
    35cc:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    35cf:	a1 b4 62 00 00       	mov    0x62b4,%eax
    35d4:	83 ec 08             	sub    $0x8,%esp
    35d7:	68 81 59 00 00       	push   $0x5981
    35dc:	50                   	push   %eax
    35dd:	e8 64 0a 00 00       	call   4046 <printf>
    35e2:	83 c4 10             	add    $0x10,%esp
}
    35e5:	90                   	nop
    35e6:	c9                   	leave
    35e7:	c3                   	ret

000035e8 <validateint>:

void
validateint(int *p)
{
    35e8:	55                   	push   %ebp
    35e9:	89 e5                	mov    %esp,%ebp
    35eb:	53                   	push   %ebx
    35ec:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    35ef:	b8 0d 00 00 00       	mov    $0xd,%eax
    35f4:	8b 55 08             	mov    0x8(%ebp),%edx
    35f7:	89 d1                	mov    %edx,%ecx
    35f9:	89 e3                	mov    %esp,%ebx
    35fb:	89 cc                	mov    %ecx,%esp
    35fd:	cd 40                	int    $0x40
    35ff:	89 dc                	mov    %ebx,%esp
    3601:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3604:	90                   	nop
    3605:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3608:	c9                   	leave
    3609:	c3                   	ret

0000360a <validatetest>:

void
validatetest(void)
{
    360a:	55                   	push   %ebp
    360b:	89 e5                	mov    %esp,%ebp
    360d:	83 ec 18             	sub    $0x18,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3610:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3615:	83 ec 08             	sub    $0x8,%esp
    3618:	68 8f 59 00 00       	push   $0x598f
    361d:	50                   	push   %eax
    361e:	e8 23 0a 00 00       	call   4046 <printf>
    3623:	83 c4 10             	add    $0x10,%esp
  hi = 1100*1024;
    3626:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    362d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3634:	e9 8a 00 00 00       	jmp    36c3 <validatetest+0xb9>
    if((pid = fork()) == 0){
    3639:	e8 8c 08 00 00       	call   3eca <fork>
    363e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3641:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3645:	75 14                	jne    365b <validatetest+0x51>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3647:	8b 45 f4             	mov    -0xc(%ebp),%eax
    364a:	83 ec 0c             	sub    $0xc,%esp
    364d:	50                   	push   %eax
    364e:	e8 95 ff ff ff       	call   35e8 <validateint>
    3653:	83 c4 10             	add    $0x10,%esp
      exit();
    3656:	e8 77 08 00 00       	call   3ed2 <exit>
    }
    sleep(0);
    365b:	83 ec 0c             	sub    $0xc,%esp
    365e:	6a 00                	push   $0x0
    3660:	e8 fd 08 00 00       	call   3f62 <sleep>
    3665:	83 c4 10             	add    $0x10,%esp
    sleep(0);
    3668:	83 ec 0c             	sub    $0xc,%esp
    366b:	6a 00                	push   $0x0
    366d:	e8 f0 08 00 00       	call   3f62 <sleep>
    3672:	83 c4 10             	add    $0x10,%esp
    kill(pid);
    3675:	83 ec 0c             	sub    $0xc,%esp
    3678:	ff 75 ec             	push   -0x14(%ebp)
    367b:	e8 82 08 00 00       	call   3f02 <kill>
    3680:	83 c4 10             	add    $0x10,%esp
    wait();
    3683:	e8 52 08 00 00       	call   3eda <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    3688:	8b 45 f4             	mov    -0xc(%ebp),%eax
    368b:	83 ec 08             	sub    $0x8,%esp
    368e:	50                   	push   %eax
    368f:	68 9e 59 00 00       	push   $0x599e
    3694:	e8 99 08 00 00       	call   3f32 <link>
    3699:	83 c4 10             	add    $0x10,%esp
    369c:	83 f8 ff             	cmp    $0xffffffff,%eax
    369f:	74 1b                	je     36bc <validatetest+0xb2>
      printf(stdout, "link should not succeed\n");
    36a1:	a1 b4 62 00 00       	mov    0x62b4,%eax
    36a6:	83 ec 08             	sub    $0x8,%esp
    36a9:	68 a9 59 00 00       	push   $0x59a9
    36ae:	50                   	push   %eax
    36af:	e8 92 09 00 00       	call   4046 <printf>
    36b4:	83 c4 10             	add    $0x10,%esp
      exit();
    36b7:	e8 16 08 00 00       	call   3ed2 <exit>
  for(p = 0; p <= (uint)hi; p += 4096){
    36bc:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    36c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    36c6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    36c9:	0f 83 6a ff ff ff    	jae    3639 <validatetest+0x2f>
    }
  }

  printf(stdout, "validate ok\n");
    36cf:	a1 b4 62 00 00       	mov    0x62b4,%eax
    36d4:	83 ec 08             	sub    $0x8,%esp
    36d7:	68 c2 59 00 00       	push   $0x59c2
    36dc:	50                   	push   %eax
    36dd:	e8 64 09 00 00       	call   4046 <printf>
    36e2:	83 c4 10             	add    $0x10,%esp
}
    36e5:	90                   	nop
    36e6:	c9                   	leave
    36e7:	c3                   	ret

000036e8 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    36e8:	55                   	push   %ebp
    36e9:	89 e5                	mov    %esp,%ebp
    36eb:	83 ec 18             	sub    $0x18,%esp
  int i;

  printf(stdout, "bss test\n");
    36ee:	a1 b4 62 00 00       	mov    0x62b4,%eax
    36f3:	83 ec 08             	sub    $0x8,%esp
    36f6:	68 cf 59 00 00       	push   $0x59cf
    36fb:	50                   	push   %eax
    36fc:	e8 45 09 00 00       	call   4046 <printf>
    3701:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(uninit); i++){
    3704:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    370b:	eb 2e                	jmp    373b <bsstest+0x53>
    if(uninit[i] != '\0'){
    370d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3710:	05 00 83 00 00       	add    $0x8300,%eax
    3715:	0f b6 00             	movzbl (%eax),%eax
    3718:	84 c0                	test   %al,%al
    371a:	74 1b                	je     3737 <bsstest+0x4f>
      printf(stdout, "bss test failed\n");
    371c:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3721:	83 ec 08             	sub    $0x8,%esp
    3724:	68 d9 59 00 00       	push   $0x59d9
    3729:	50                   	push   %eax
    372a:	e8 17 09 00 00       	call   4046 <printf>
    372f:	83 c4 10             	add    $0x10,%esp
      exit();
    3732:	e8 9b 07 00 00       	call   3ed2 <exit>
  for(i = 0; i < sizeof(uninit); i++){
    3737:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    373b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    373e:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3743:	76 c8                	jbe    370d <bsstest+0x25>
    }
  }
  printf(stdout, "bss test ok\n");
    3745:	a1 b4 62 00 00       	mov    0x62b4,%eax
    374a:	83 ec 08             	sub    $0x8,%esp
    374d:	68 ea 59 00 00       	push   $0x59ea
    3752:	50                   	push   %eax
    3753:	e8 ee 08 00 00       	call   4046 <printf>
    3758:	83 c4 10             	add    $0x10,%esp
}
    375b:	90                   	nop
    375c:	c9                   	leave
    375d:	c3                   	ret

0000375e <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    375e:	55                   	push   %ebp
    375f:	89 e5                	mov    %esp,%ebp
    3761:	83 ec 18             	sub    $0x18,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3764:	83 ec 0c             	sub    $0xc,%esp
    3767:	68 f7 59 00 00       	push   $0x59f7
    376c:	e8 b1 07 00 00       	call   3f22 <unlink>
    3771:	83 c4 10             	add    $0x10,%esp
  pid = fork();
    3774:	e8 51 07 00 00       	call   3eca <fork>
    3779:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    377c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3780:	0f 85 97 00 00 00    	jne    381d <bigargtest+0xbf>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    3786:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    378d:	eb 12                	jmp    37a1 <bigargtest+0x43>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    378f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3792:	c7 04 85 20 aa 00 00 	movl   $0x5a04,0xaa20(,%eax,4)
    3799:	04 5a 00 00 
    for(i = 0; i < MAXARG-1; i++)
    379d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37a1:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    37a5:	7e e8                	jle    378f <bigargtest+0x31>
    args[MAXARG-1] = 0;
    37a7:	c7 05 9c aa 00 00 00 	movl   $0x0,0xaa9c
    37ae:	00 00 00 
    printf(stdout, "bigarg test\n");
    37b1:	a1 b4 62 00 00       	mov    0x62b4,%eax
    37b6:	83 ec 08             	sub    $0x8,%esp
    37b9:	68 e1 5a 00 00       	push   $0x5ae1
    37be:	50                   	push   %eax
    37bf:	e8 82 08 00 00       	call   4046 <printf>
    37c4:	83 c4 10             	add    $0x10,%esp
    exec("echo", args);
    37c7:	83 ec 08             	sub    $0x8,%esp
    37ca:	68 20 aa 00 00       	push   $0xaa20
    37cf:	68 00 44 00 00       	push   $0x4400
    37d4:	e8 31 07 00 00       	call   3f0a <exec>
    37d9:	83 c4 10             	add    $0x10,%esp
    printf(stdout, "bigarg test ok\n");
    37dc:	a1 b4 62 00 00       	mov    0x62b4,%eax
    37e1:	83 ec 08             	sub    $0x8,%esp
    37e4:	68 ee 5a 00 00       	push   $0x5aee
    37e9:	50                   	push   %eax
    37ea:	e8 57 08 00 00       	call   4046 <printf>
    37ef:	83 c4 10             	add    $0x10,%esp
    fd = open("bigarg-ok", O_CREATE);
    37f2:	83 ec 08             	sub    $0x8,%esp
    37f5:	68 00 02 00 00       	push   $0x200
    37fa:	68 f7 59 00 00       	push   $0x59f7
    37ff:	e8 0e 07 00 00       	call   3f12 <open>
    3804:	83 c4 10             	add    $0x10,%esp
    3807:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    380a:	83 ec 0c             	sub    $0xc,%esp
    380d:	ff 75 ec             	push   -0x14(%ebp)
    3810:	e8 e5 06 00 00       	call   3efa <close>
    3815:	83 c4 10             	add    $0x10,%esp
    exit();
    3818:	e8 b5 06 00 00       	call   3ed2 <exit>
  } else if(pid < 0){
    381d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3821:	79 1b                	jns    383e <bigargtest+0xe0>
    printf(stdout, "bigargtest: fork failed\n");
    3823:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3828:	83 ec 08             	sub    $0x8,%esp
    382b:	68 fe 5a 00 00       	push   $0x5afe
    3830:	50                   	push   %eax
    3831:	e8 10 08 00 00       	call   4046 <printf>
    3836:	83 c4 10             	add    $0x10,%esp
    exit();
    3839:	e8 94 06 00 00       	call   3ed2 <exit>
  }
  wait();
    383e:	e8 97 06 00 00       	call   3eda <wait>
  fd = open("bigarg-ok", 0);
    3843:	83 ec 08             	sub    $0x8,%esp
    3846:	6a 00                	push   $0x0
    3848:	68 f7 59 00 00       	push   $0x59f7
    384d:	e8 c0 06 00 00       	call   3f12 <open>
    3852:	83 c4 10             	add    $0x10,%esp
    3855:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    3858:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    385c:	79 1b                	jns    3879 <bigargtest+0x11b>
    printf(stdout, "bigarg test failed!\n");
    385e:	a1 b4 62 00 00       	mov    0x62b4,%eax
    3863:	83 ec 08             	sub    $0x8,%esp
    3866:	68 17 5b 00 00       	push   $0x5b17
    386b:	50                   	push   %eax
    386c:	e8 d5 07 00 00       	call   4046 <printf>
    3871:	83 c4 10             	add    $0x10,%esp
    exit();
    3874:	e8 59 06 00 00       	call   3ed2 <exit>
  }
  close(fd);
    3879:	83 ec 0c             	sub    $0xc,%esp
    387c:	ff 75 ec             	push   -0x14(%ebp)
    387f:	e8 76 06 00 00       	call   3efa <close>
    3884:	83 c4 10             	add    $0x10,%esp
  unlink("bigarg-ok");
    3887:	83 ec 0c             	sub    $0xc,%esp
    388a:	68 f7 59 00 00       	push   $0x59f7
    388f:	e8 8e 06 00 00       	call   3f22 <unlink>
    3894:	83 c4 10             	add    $0x10,%esp
}
    3897:	90                   	nop
    3898:	c9                   	leave
    3899:	c3                   	ret

0000389a <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    389a:	55                   	push   %ebp
    389b:	89 e5                	mov    %esp,%ebp
    389d:	53                   	push   %ebx
    389e:	83 ec 64             	sub    $0x64,%esp
  int nfiles;
  int fsblocks = 0;
    38a1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    38a8:	83 ec 08             	sub    $0x8,%esp
    38ab:	68 2c 5b 00 00       	push   $0x5b2c
    38b0:	6a 01                	push   $0x1
    38b2:	e8 8f 07 00 00       	call   4046 <printf>
    38b7:	83 c4 10             	add    $0x10,%esp

  for(nfiles = 0; ; nfiles++){
    38ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    38c1:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    38c5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    38c8:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    38cd:	89 c8                	mov    %ecx,%eax
    38cf:	f7 ea                	imul   %edx
    38d1:	c1 fa 06             	sar    $0x6,%edx
    38d4:	89 c8                	mov    %ecx,%eax
    38d6:	c1 f8 1f             	sar    $0x1f,%eax
    38d9:	29 c2                	sub    %eax,%edx
    38db:	89 d0                	mov    %edx,%eax
    38dd:	83 c0 30             	add    $0x30,%eax
    38e0:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    38e3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    38e6:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    38eb:	89 d8                	mov    %ebx,%eax
    38ed:	f7 ea                	imul   %edx
    38ef:	c1 fa 06             	sar    $0x6,%edx
    38f2:	89 d8                	mov    %ebx,%eax
    38f4:	c1 f8 1f             	sar    $0x1f,%eax
    38f7:	89 d1                	mov    %edx,%ecx
    38f9:	29 c1                	sub    %eax,%ecx
    38fb:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3901:	29 c3                	sub    %eax,%ebx
    3903:	89 d9                	mov    %ebx,%ecx
    3905:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    390a:	89 c8                	mov    %ecx,%eax
    390c:	f7 ea                	imul   %edx
    390e:	c1 fa 05             	sar    $0x5,%edx
    3911:	89 c8                	mov    %ecx,%eax
    3913:	c1 f8 1f             	sar    $0x1f,%eax
    3916:	29 c2                	sub    %eax,%edx
    3918:	89 d0                	mov    %edx,%eax
    391a:	83 c0 30             	add    $0x30,%eax
    391d:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3920:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3923:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3928:	89 d8                	mov    %ebx,%eax
    392a:	f7 ea                	imul   %edx
    392c:	c1 fa 05             	sar    $0x5,%edx
    392f:	89 d8                	mov    %ebx,%eax
    3931:	c1 f8 1f             	sar    $0x1f,%eax
    3934:	89 d1                	mov    %edx,%ecx
    3936:	29 c1                	sub    %eax,%ecx
    3938:	6b c1 64             	imul   $0x64,%ecx,%eax
    393b:	29 c3                	sub    %eax,%ebx
    393d:	89 d9                	mov    %ebx,%ecx
    393f:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3944:	89 c8                	mov    %ecx,%eax
    3946:	f7 ea                	imul   %edx
    3948:	c1 fa 02             	sar    $0x2,%edx
    394b:	89 c8                	mov    %ecx,%eax
    394d:	c1 f8 1f             	sar    $0x1f,%eax
    3950:	29 c2                	sub    %eax,%edx
    3952:	89 d0                	mov    %edx,%eax
    3954:	83 c0 30             	add    $0x30,%eax
    3957:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    395a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    395d:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3962:	89 c8                	mov    %ecx,%eax
    3964:	f7 ea                	imul   %edx
    3966:	c1 fa 02             	sar    $0x2,%edx
    3969:	89 c8                	mov    %ecx,%eax
    396b:	c1 f8 1f             	sar    $0x1f,%eax
    396e:	29 c2                	sub    %eax,%edx
    3970:	89 d0                	mov    %edx,%eax
    3972:	c1 e0 02             	shl    $0x2,%eax
    3975:	01 d0                	add    %edx,%eax
    3977:	01 c0                	add    %eax,%eax
    3979:	29 c1                	sub    %eax,%ecx
    397b:	89 ca                	mov    %ecx,%edx
    397d:	89 d0                	mov    %edx,%eax
    397f:	83 c0 30             	add    $0x30,%eax
    3982:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3985:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3989:	83 ec 04             	sub    $0x4,%esp
    398c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    398f:	50                   	push   %eax
    3990:	68 39 5b 00 00       	push   $0x5b39
    3995:	6a 01                	push   $0x1
    3997:	e8 aa 06 00 00       	call   4046 <printf>
    399c:	83 c4 10             	add    $0x10,%esp
    int fd = open(name, O_CREATE|O_RDWR);
    399f:	83 ec 08             	sub    $0x8,%esp
    39a2:	68 02 02 00 00       	push   $0x202
    39a7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    39aa:	50                   	push   %eax
    39ab:	e8 62 05 00 00       	call   3f12 <open>
    39b0:	83 c4 10             	add    $0x10,%esp
    39b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    39b6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    39ba:	79 18                	jns    39d4 <fsfull+0x13a>
      printf(1, "open %s failed\n", name);
    39bc:	83 ec 04             	sub    $0x4,%esp
    39bf:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    39c2:	50                   	push   %eax
    39c3:	68 45 5b 00 00       	push   $0x5b45
    39c8:	6a 01                	push   $0x1
    39ca:	e8 77 06 00 00       	call   4046 <printf>
    39cf:	83 c4 10             	add    $0x10,%esp
      break;
    39d2:	eb 6b                	jmp    3a3f <fsfull+0x1a5>
    }
    int total = 0;
    39d4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    39db:	83 ec 04             	sub    $0x4,%esp
    39de:	68 00 02 00 00       	push   $0x200
    39e3:	68 e0 62 00 00       	push   $0x62e0
    39e8:	ff 75 e8             	push   -0x18(%ebp)
    39eb:	e8 02 05 00 00       	call   3ef2 <write>
    39f0:	83 c4 10             	add    $0x10,%esp
    39f3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    39f6:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    39fd:	7e 0c                	jle    3a0b <fsfull+0x171>
        break;
      total += cc;
    39ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3a02:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    3a05:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    while(1){
    3a09:	eb d0                	jmp    39db <fsfull+0x141>
        break;
    3a0b:	90                   	nop
    }
    printf(1, "wrote %d bytes\n", total);
    3a0c:	83 ec 04             	sub    $0x4,%esp
    3a0f:	ff 75 ec             	push   -0x14(%ebp)
    3a12:	68 55 5b 00 00       	push   $0x5b55
    3a17:	6a 01                	push   $0x1
    3a19:	e8 28 06 00 00       	call   4046 <printf>
    3a1e:	83 c4 10             	add    $0x10,%esp
    close(fd);
    3a21:	83 ec 0c             	sub    $0xc,%esp
    3a24:	ff 75 e8             	push   -0x18(%ebp)
    3a27:	e8 ce 04 00 00       	call   3efa <close>
    3a2c:	83 c4 10             	add    $0x10,%esp
    if(total == 0)
    3a2f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3a33:	74 09                	je     3a3e <fsfull+0x1a4>
  for(nfiles = 0; ; nfiles++){
    3a35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3a39:	e9 83 fe ff ff       	jmp    38c1 <fsfull+0x27>
      break;
    3a3e:	90                   	nop
  }

  while(nfiles >= 0){
    3a3f:	e9 db 00 00 00       	jmp    3b1f <fsfull+0x285>
    char name[64];
    name[0] = 'f';
    3a44:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3a48:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3a4b:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3a50:	89 c8                	mov    %ecx,%eax
    3a52:	f7 ea                	imul   %edx
    3a54:	c1 fa 06             	sar    $0x6,%edx
    3a57:	89 c8                	mov    %ecx,%eax
    3a59:	c1 f8 1f             	sar    $0x1f,%eax
    3a5c:	29 c2                	sub    %eax,%edx
    3a5e:	89 d0                	mov    %edx,%eax
    3a60:	83 c0 30             	add    $0x30,%eax
    3a63:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3a66:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3a69:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3a6e:	89 d8                	mov    %ebx,%eax
    3a70:	f7 ea                	imul   %edx
    3a72:	c1 fa 06             	sar    $0x6,%edx
    3a75:	89 d8                	mov    %ebx,%eax
    3a77:	c1 f8 1f             	sar    $0x1f,%eax
    3a7a:	89 d1                	mov    %edx,%ecx
    3a7c:	29 c1                	sub    %eax,%ecx
    3a7e:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3a84:	29 c3                	sub    %eax,%ebx
    3a86:	89 d9                	mov    %ebx,%ecx
    3a88:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3a8d:	89 c8                	mov    %ecx,%eax
    3a8f:	f7 ea                	imul   %edx
    3a91:	c1 fa 05             	sar    $0x5,%edx
    3a94:	89 c8                	mov    %ecx,%eax
    3a96:	c1 f8 1f             	sar    $0x1f,%eax
    3a99:	29 c2                	sub    %eax,%edx
    3a9b:	89 d0                	mov    %edx,%eax
    3a9d:	83 c0 30             	add    $0x30,%eax
    3aa0:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3aa3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3aa6:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3aab:	89 d8                	mov    %ebx,%eax
    3aad:	f7 ea                	imul   %edx
    3aaf:	c1 fa 05             	sar    $0x5,%edx
    3ab2:	89 d8                	mov    %ebx,%eax
    3ab4:	c1 f8 1f             	sar    $0x1f,%eax
    3ab7:	89 d1                	mov    %edx,%ecx
    3ab9:	29 c1                	sub    %eax,%ecx
    3abb:	6b c1 64             	imul   $0x64,%ecx,%eax
    3abe:	29 c3                	sub    %eax,%ebx
    3ac0:	89 d9                	mov    %ebx,%ecx
    3ac2:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3ac7:	89 c8                	mov    %ecx,%eax
    3ac9:	f7 ea                	imul   %edx
    3acb:	c1 fa 02             	sar    $0x2,%edx
    3ace:	89 c8                	mov    %ecx,%eax
    3ad0:	c1 f8 1f             	sar    $0x1f,%eax
    3ad3:	29 c2                	sub    %eax,%edx
    3ad5:	89 d0                	mov    %edx,%eax
    3ad7:	83 c0 30             	add    $0x30,%eax
    3ada:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3add:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3ae0:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3ae5:	89 c8                	mov    %ecx,%eax
    3ae7:	f7 ea                	imul   %edx
    3ae9:	c1 fa 02             	sar    $0x2,%edx
    3aec:	89 c8                	mov    %ecx,%eax
    3aee:	c1 f8 1f             	sar    $0x1f,%eax
    3af1:	29 c2                	sub    %eax,%edx
    3af3:	89 d0                	mov    %edx,%eax
    3af5:	c1 e0 02             	shl    $0x2,%eax
    3af8:	01 d0                	add    %edx,%eax
    3afa:	01 c0                	add    %eax,%eax
    3afc:	29 c1                	sub    %eax,%ecx
    3afe:	89 ca                	mov    %ecx,%edx
    3b00:	89 d0                	mov    %edx,%eax
    3b02:	83 c0 30             	add    $0x30,%eax
    3b05:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3b08:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3b0c:	83 ec 0c             	sub    $0xc,%esp
    3b0f:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3b12:	50                   	push   %eax
    3b13:	e8 0a 04 00 00       	call   3f22 <unlink>
    3b18:	83 c4 10             	add    $0x10,%esp
    nfiles--;
    3b1b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  while(nfiles >= 0){
    3b1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b23:	0f 89 1b ff ff ff    	jns    3a44 <fsfull+0x1aa>
  }

  printf(1, "fsfull test finished\n");
    3b29:	83 ec 08             	sub    $0x8,%esp
    3b2c:	68 65 5b 00 00       	push   $0x5b65
    3b31:	6a 01                	push   $0x1
    3b33:	e8 0e 05 00 00       	call   4046 <printf>
    3b38:	83 c4 10             	add    $0x10,%esp
}
    3b3b:	90                   	nop
    3b3c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3b3f:	c9                   	leave
    3b40:	c3                   	ret

00003b41 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3b41:	55                   	push   %ebp
    3b42:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3b44:	a1 b8 62 00 00       	mov    0x62b8,%eax
    3b49:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    3b4f:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3b54:	a3 b8 62 00 00       	mov    %eax,0x62b8
  return randstate;
    3b59:	a1 b8 62 00 00       	mov    0x62b8,%eax
}
    3b5e:	5d                   	pop    %ebp
    3b5f:	c3                   	ret

00003b60 <main>:

int
main(int argc, char *argv[])
{
    3b60:	8d 4c 24 04          	lea    0x4(%esp),%ecx
    3b64:	83 e4 f0             	and    $0xfffffff0,%esp
    3b67:	ff 71 fc             	push   -0x4(%ecx)
    3b6a:	55                   	push   %ebp
    3b6b:	89 e5                	mov    %esp,%ebp
    3b6d:	51                   	push   %ecx
    3b6e:	83 ec 04             	sub    $0x4,%esp
  printf(1, "usertests starting\n");
    3b71:	83 ec 08             	sub    $0x8,%esp
    3b74:	68 7b 5b 00 00       	push   $0x5b7b
    3b79:	6a 01                	push   $0x1
    3b7b:	e8 c6 04 00 00       	call   4046 <printf>
    3b80:	83 c4 10             	add    $0x10,%esp

  if(open("usertests.ran", 0) >= 0){
    3b83:	83 ec 08             	sub    $0x8,%esp
    3b86:	6a 00                	push   $0x0
    3b88:	68 8f 5b 00 00       	push   $0x5b8f
    3b8d:	e8 80 03 00 00       	call   3f12 <open>
    3b92:	83 c4 10             	add    $0x10,%esp
    3b95:	85 c0                	test   %eax,%eax
    3b97:	78 17                	js     3bb0 <main+0x50>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3b99:	83 ec 08             	sub    $0x8,%esp
    3b9c:	68 a0 5b 00 00       	push   $0x5ba0
    3ba1:	6a 01                	push   $0x1
    3ba3:	e8 9e 04 00 00       	call   4046 <printf>
    3ba8:	83 c4 10             	add    $0x10,%esp
    exit();
    3bab:	e8 22 03 00 00       	call   3ed2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3bb0:	83 ec 08             	sub    $0x8,%esp
    3bb3:	68 00 02 00 00       	push   $0x200
    3bb8:	68 8f 5b 00 00       	push   $0x5b8f
    3bbd:	e8 50 03 00 00       	call   3f12 <open>
    3bc2:	83 c4 10             	add    $0x10,%esp
    3bc5:	83 ec 0c             	sub    $0xc,%esp
    3bc8:	50                   	push   %eax
    3bc9:	e8 2c 03 00 00       	call   3efa <close>
    3bce:	83 c4 10             	add    $0x10,%esp

  createdelete();
    3bd1:	e8 d7 d6 ff ff       	call   12ad <createdelete>
  linkunlink();
    3bd6:	e8 fc e0 ff ff       	call   1cd7 <linkunlink>
  concreate();
    3bdb:	e8 43 dd ff ff       	call   1923 <concreate>
  fourfiles();
    3be0:	e8 77 d4 ff ff       	call   105c <fourfiles>
  sharedfd();
    3be5:	e8 8f d2 ff ff       	call   e79 <sharedfd>

  bigargtest();
    3bea:	e8 6f fb ff ff       	call   375e <bigargtest>
  bigwrite();
    3bef:	e8 df ea ff ff       	call   26d3 <bigwrite>
  bigargtest();
    3bf4:	e8 65 fb ff ff       	call   375e <bigargtest>
  bsstest();
    3bf9:	e8 ea fa ff ff       	call   36e8 <bsstest>
  sbrktest();
    3bfe:	e8 03 f5 ff ff       	call   3106 <sbrktest>
  validatetest();
    3c03:	e8 02 fa ff ff       	call   360a <validatetest>

  opentest();
    3c08:	e8 f2 c6 ff ff       	call   2ff <opentest>
  writetest();
    3c0d:	e8 9c c7 ff ff       	call   3ae <writetest>
  writetest1();
    3c12:	e8 a7 c9 ff ff       	call   5be <writetest1>
  createtest();
    3c17:	e8 9e cb ff ff       	call   7ba <createtest>

  openiputtest();
    3c1c:	e8 cf c5 ff ff       	call   1f0 <openiputtest>
  exitiputtest();
    3c21:	e8 cb c4 ff ff       	call   f1 <exitiputtest>
  iputtest();
    3c26:	e8 d5 c3 ff ff       	call   0 <iputtest>

  mem();
    3c2b:	e8 58 d1 ff ff       	call   d88 <mem>
  pipe1();
    3c30:	e8 8c cd ff ff       	call   9c1 <pipe1>
  preempt();
    3c35:	e8 70 cf ff ff       	call   baa <preempt>
  exitwait();
    3c3a:	e8 d1 d0 ff ff       	call   d10 <exitwait>

  rmdot();
    3c3f:	e8 01 ef ff ff       	call   2b45 <rmdot>
  fourteen();
    3c44:	e8 a0 ed ff ff       	call   29e9 <fourteen>
  bigfile();
    3c49:	e8 83 eb ff ff       	call   27d1 <bigfile>
  subdir();
    3c4e:	e8 3c e3 ff ff       	call   1f8f <subdir>
  linktest();
    3c53:	e8 89 da ff ff       	call   16e1 <linktest>
  unlinkread();
    3c58:	e8 c2 d8 ff ff       	call   151f <unlinkread>
  dirfile();
    3c5d:	e8 68 f0 ff ff       	call   2cca <dirfile>
  iref();
    3c62:	e8 9b f2 ff ff       	call   2f02 <iref>
  forktest();
    3c67:	e8 d0 f3 ff ff       	call   303c <forktest>
  bigdir(); // slow
    3c6c:	e8 9d e1 ff ff       	call   1e0e <bigdir>
  exectest();
    3c71:	e8 f8 cc ff ff       	call   96e <exectest>

  exit();
    3c76:	e8 57 02 00 00       	call   3ed2 <exit>

00003c7b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3c7b:	55                   	push   %ebp
    3c7c:	89 e5                	mov    %esp,%ebp
    3c7e:	57                   	push   %edi
    3c7f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3c80:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3c83:	8b 55 10             	mov    0x10(%ebp),%edx
    3c86:	8b 45 0c             	mov    0xc(%ebp),%eax
    3c89:	89 cb                	mov    %ecx,%ebx
    3c8b:	89 df                	mov    %ebx,%edi
    3c8d:	89 d1                	mov    %edx,%ecx
    3c8f:	fc                   	cld
    3c90:	f3 aa                	rep stos %al,%es:(%edi)
    3c92:	89 ca                	mov    %ecx,%edx
    3c94:	89 fb                	mov    %edi,%ebx
    3c96:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3c99:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3c9c:	90                   	nop
    3c9d:	5b                   	pop    %ebx
    3c9e:	5f                   	pop    %edi
    3c9f:	5d                   	pop    %ebp
    3ca0:	c3                   	ret

00003ca1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3ca1:	55                   	push   %ebp
    3ca2:	89 e5                	mov    %esp,%ebp
    3ca4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3ca7:	8b 45 08             	mov    0x8(%ebp),%eax
    3caa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3cad:	90                   	nop
    3cae:	8b 55 0c             	mov    0xc(%ebp),%edx
    3cb1:	8d 42 01             	lea    0x1(%edx),%eax
    3cb4:	89 45 0c             	mov    %eax,0xc(%ebp)
    3cb7:	8b 45 08             	mov    0x8(%ebp),%eax
    3cba:	8d 48 01             	lea    0x1(%eax),%ecx
    3cbd:	89 4d 08             	mov    %ecx,0x8(%ebp)
    3cc0:	0f b6 12             	movzbl (%edx),%edx
    3cc3:	88 10                	mov    %dl,(%eax)
    3cc5:	0f b6 00             	movzbl (%eax),%eax
    3cc8:	84 c0                	test   %al,%al
    3cca:	75 e2                	jne    3cae <strcpy+0xd>
    ;
  return os;
    3ccc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3ccf:	c9                   	leave
    3cd0:	c3                   	ret

00003cd1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3cd1:	55                   	push   %ebp
    3cd2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3cd4:	eb 08                	jmp    3cde <strcmp+0xd>
    p++, q++;
    3cd6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3cda:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  while(*p && *p == *q)
    3cde:	8b 45 08             	mov    0x8(%ebp),%eax
    3ce1:	0f b6 00             	movzbl (%eax),%eax
    3ce4:	84 c0                	test   %al,%al
    3ce6:	74 10                	je     3cf8 <strcmp+0x27>
    3ce8:	8b 45 08             	mov    0x8(%ebp),%eax
    3ceb:	0f b6 10             	movzbl (%eax),%edx
    3cee:	8b 45 0c             	mov    0xc(%ebp),%eax
    3cf1:	0f b6 00             	movzbl (%eax),%eax
    3cf4:	38 c2                	cmp    %al,%dl
    3cf6:	74 de                	je     3cd6 <strcmp+0x5>
  return (uchar)*p - (uchar)*q;
    3cf8:	8b 45 08             	mov    0x8(%ebp),%eax
    3cfb:	0f b6 00             	movzbl (%eax),%eax
    3cfe:	0f b6 d0             	movzbl %al,%edx
    3d01:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d04:	0f b6 00             	movzbl (%eax),%eax
    3d07:	0f b6 c0             	movzbl %al,%eax
    3d0a:	29 c2                	sub    %eax,%edx
    3d0c:	89 d0                	mov    %edx,%eax
}
    3d0e:	5d                   	pop    %ebp
    3d0f:	c3                   	ret

00003d10 <strlen>:

uint
strlen(char *s)
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3d16:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3d1d:	eb 04                	jmp    3d23 <strlen+0x13>
    3d1f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3d23:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3d26:	8b 45 08             	mov    0x8(%ebp),%eax
    3d29:	01 d0                	add    %edx,%eax
    3d2b:	0f b6 00             	movzbl (%eax),%eax
    3d2e:	84 c0                	test   %al,%al
    3d30:	75 ed                	jne    3d1f <strlen+0xf>
    ;
  return n;
    3d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3d35:	c9                   	leave
    3d36:	c3                   	ret

00003d37 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3d37:	55                   	push   %ebp
    3d38:	89 e5                	mov    %esp,%ebp
  stosb(dst, c, n);
    3d3a:	8b 45 10             	mov    0x10(%ebp),%eax
    3d3d:	50                   	push   %eax
    3d3e:	ff 75 0c             	push   0xc(%ebp)
    3d41:	ff 75 08             	push   0x8(%ebp)
    3d44:	e8 32 ff ff ff       	call   3c7b <stosb>
    3d49:	83 c4 0c             	add    $0xc,%esp
  return dst;
    3d4c:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3d4f:	c9                   	leave
    3d50:	c3                   	ret

00003d51 <strchr>:

char*
strchr(const char *s, char c)
{
    3d51:	55                   	push   %ebp
    3d52:	89 e5                	mov    %esp,%ebp
    3d54:	83 ec 04             	sub    $0x4,%esp
    3d57:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d5a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3d5d:	eb 14                	jmp    3d73 <strchr+0x22>
    if(*s == c)
    3d5f:	8b 45 08             	mov    0x8(%ebp),%eax
    3d62:	0f b6 00             	movzbl (%eax),%eax
    3d65:	38 45 fc             	cmp    %al,-0x4(%ebp)
    3d68:	75 05                	jne    3d6f <strchr+0x1e>
      return (char*)s;
    3d6a:	8b 45 08             	mov    0x8(%ebp),%eax
    3d6d:	eb 13                	jmp    3d82 <strchr+0x31>
  for(; *s; s++)
    3d6f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3d73:	8b 45 08             	mov    0x8(%ebp),%eax
    3d76:	0f b6 00             	movzbl (%eax),%eax
    3d79:	84 c0                	test   %al,%al
    3d7b:	75 e2                	jne    3d5f <strchr+0xe>
  return 0;
    3d7d:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3d82:	c9                   	leave
    3d83:	c3                   	ret

00003d84 <gets>:

char*
gets(char *buf, int max)
{
    3d84:	55                   	push   %ebp
    3d85:	89 e5                	mov    %esp,%ebp
    3d87:	83 ec 18             	sub    $0x18,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3d8a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3d91:	eb 42                	jmp    3dd5 <gets+0x51>
    cc = read(0, &c, 1);
    3d93:	83 ec 04             	sub    $0x4,%esp
    3d96:	6a 01                	push   $0x1
    3d98:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3d9b:	50                   	push   %eax
    3d9c:	6a 00                	push   $0x0
    3d9e:	e8 47 01 00 00       	call   3eea <read>
    3da3:	83 c4 10             	add    $0x10,%esp
    3da6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3da9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3dad:	7e 33                	jle    3de2 <gets+0x5e>
      break;
    buf[i++] = c;
    3daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3db2:	8d 50 01             	lea    0x1(%eax),%edx
    3db5:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3db8:	89 c2                	mov    %eax,%edx
    3dba:	8b 45 08             	mov    0x8(%ebp),%eax
    3dbd:	01 c2                	add    %eax,%edx
    3dbf:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3dc3:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3dc5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3dc9:	3c 0a                	cmp    $0xa,%al
    3dcb:	74 16                	je     3de3 <gets+0x5f>
    3dcd:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3dd1:	3c 0d                	cmp    $0xd,%al
    3dd3:	74 0e                	je     3de3 <gets+0x5f>
  for(i=0; i+1 < max; ){
    3dd5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3dd8:	83 c0 01             	add    $0x1,%eax
    3ddb:	39 45 0c             	cmp    %eax,0xc(%ebp)
    3dde:	7f b3                	jg     3d93 <gets+0xf>
    3de0:	eb 01                	jmp    3de3 <gets+0x5f>
      break;
    3de2:	90                   	nop
      break;
  }
  buf[i] = '\0';
    3de3:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3de6:	8b 45 08             	mov    0x8(%ebp),%eax
    3de9:	01 d0                	add    %edx,%eax
    3deb:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3dee:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3df1:	c9                   	leave
    3df2:	c3                   	ret

00003df3 <stat>:

int
stat(char *n, struct stat *st)
{
    3df3:	55                   	push   %ebp
    3df4:	89 e5                	mov    %esp,%ebp
    3df6:	83 ec 18             	sub    $0x18,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3df9:	83 ec 08             	sub    $0x8,%esp
    3dfc:	6a 00                	push   $0x0
    3dfe:	ff 75 08             	push   0x8(%ebp)
    3e01:	e8 0c 01 00 00       	call   3f12 <open>
    3e06:	83 c4 10             	add    $0x10,%esp
    3e09:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3e0c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3e10:	79 07                	jns    3e19 <stat+0x26>
    return -1;
    3e12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3e17:	eb 25                	jmp    3e3e <stat+0x4b>
  r = fstat(fd, st);
    3e19:	83 ec 08             	sub    $0x8,%esp
    3e1c:	ff 75 0c             	push   0xc(%ebp)
    3e1f:	ff 75 f4             	push   -0xc(%ebp)
    3e22:	e8 03 01 00 00       	call   3f2a <fstat>
    3e27:	83 c4 10             	add    $0x10,%esp
    3e2a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3e2d:	83 ec 0c             	sub    $0xc,%esp
    3e30:	ff 75 f4             	push   -0xc(%ebp)
    3e33:	e8 c2 00 00 00       	call   3efa <close>
    3e38:	83 c4 10             	add    $0x10,%esp
  return r;
    3e3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3e3e:	c9                   	leave
    3e3f:	c3                   	ret

00003e40 <atoi>:

int
atoi(const char *s)
{
    3e40:	55                   	push   %ebp
    3e41:	89 e5                	mov    %esp,%ebp
    3e43:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3e46:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3e4d:	eb 25                	jmp    3e74 <atoi+0x34>
    n = n*10 + *s++ - '0';
    3e4f:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3e52:	89 d0                	mov    %edx,%eax
    3e54:	c1 e0 02             	shl    $0x2,%eax
    3e57:	01 d0                	add    %edx,%eax
    3e59:	01 c0                	add    %eax,%eax
    3e5b:	89 c1                	mov    %eax,%ecx
    3e5d:	8b 45 08             	mov    0x8(%ebp),%eax
    3e60:	8d 50 01             	lea    0x1(%eax),%edx
    3e63:	89 55 08             	mov    %edx,0x8(%ebp)
    3e66:	0f b6 00             	movzbl (%eax),%eax
    3e69:	0f be c0             	movsbl %al,%eax
    3e6c:	01 c8                	add    %ecx,%eax
    3e6e:	83 e8 30             	sub    $0x30,%eax
    3e71:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3e74:	8b 45 08             	mov    0x8(%ebp),%eax
    3e77:	0f b6 00             	movzbl (%eax),%eax
    3e7a:	3c 2f                	cmp    $0x2f,%al
    3e7c:	7e 0a                	jle    3e88 <atoi+0x48>
    3e7e:	8b 45 08             	mov    0x8(%ebp),%eax
    3e81:	0f b6 00             	movzbl (%eax),%eax
    3e84:	3c 39                	cmp    $0x39,%al
    3e86:	7e c7                	jle    3e4f <atoi+0xf>
  return n;
    3e88:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3e8b:	c9                   	leave
    3e8c:	c3                   	ret

00003e8d <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3e8d:	55                   	push   %ebp
    3e8e:	89 e5                	mov    %esp,%ebp
    3e90:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3e93:	8b 45 08             	mov    0x8(%ebp),%eax
    3e96:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3e99:	8b 45 0c             	mov    0xc(%ebp),%eax
    3e9c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3e9f:	eb 17                	jmp    3eb8 <memmove+0x2b>
    *dst++ = *src++;
    3ea1:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3ea4:	8d 42 01             	lea    0x1(%edx),%eax
    3ea7:	89 45 f8             	mov    %eax,-0x8(%ebp)
    3eaa:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3ead:	8d 48 01             	lea    0x1(%eax),%ecx
    3eb0:	89 4d fc             	mov    %ecx,-0x4(%ebp)
    3eb3:	0f b6 12             	movzbl (%edx),%edx
    3eb6:	88 10                	mov    %dl,(%eax)
  while(n-- > 0)
    3eb8:	8b 45 10             	mov    0x10(%ebp),%eax
    3ebb:	8d 50 ff             	lea    -0x1(%eax),%edx
    3ebe:	89 55 10             	mov    %edx,0x10(%ebp)
    3ec1:	85 c0                	test   %eax,%eax
    3ec3:	7f dc                	jg     3ea1 <memmove+0x14>
  return vdst;
    3ec5:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3ec8:	c9                   	leave
    3ec9:	c3                   	ret

00003eca <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3eca:	b8 01 00 00 00       	mov    $0x1,%eax
    3ecf:	cd 40                	int    $0x40
    3ed1:	c3                   	ret

00003ed2 <exit>:
SYSCALL(exit)
    3ed2:	b8 02 00 00 00       	mov    $0x2,%eax
    3ed7:	cd 40                	int    $0x40
    3ed9:	c3                   	ret

00003eda <wait>:
SYSCALL(wait)
    3eda:	b8 03 00 00 00       	mov    $0x3,%eax
    3edf:	cd 40                	int    $0x40
    3ee1:	c3                   	ret

00003ee2 <pipe>:
SYSCALL(pipe)
    3ee2:	b8 04 00 00 00       	mov    $0x4,%eax
    3ee7:	cd 40                	int    $0x40
    3ee9:	c3                   	ret

00003eea <read>:
SYSCALL(read)
    3eea:	b8 05 00 00 00       	mov    $0x5,%eax
    3eef:	cd 40                	int    $0x40
    3ef1:	c3                   	ret

00003ef2 <write>:
SYSCALL(write)
    3ef2:	b8 10 00 00 00       	mov    $0x10,%eax
    3ef7:	cd 40                	int    $0x40
    3ef9:	c3                   	ret

00003efa <close>:
SYSCALL(close)
    3efa:	b8 15 00 00 00       	mov    $0x15,%eax
    3eff:	cd 40                	int    $0x40
    3f01:	c3                   	ret

00003f02 <kill>:
SYSCALL(kill)
    3f02:	b8 06 00 00 00       	mov    $0x6,%eax
    3f07:	cd 40                	int    $0x40
    3f09:	c3                   	ret

00003f0a <exec>:
SYSCALL(exec)
    3f0a:	b8 07 00 00 00       	mov    $0x7,%eax
    3f0f:	cd 40                	int    $0x40
    3f11:	c3                   	ret

00003f12 <open>:
SYSCALL(open)
    3f12:	b8 0f 00 00 00       	mov    $0xf,%eax
    3f17:	cd 40                	int    $0x40
    3f19:	c3                   	ret

00003f1a <mknod>:
SYSCALL(mknod)
    3f1a:	b8 11 00 00 00       	mov    $0x11,%eax
    3f1f:	cd 40                	int    $0x40
    3f21:	c3                   	ret

00003f22 <unlink>:
SYSCALL(unlink)
    3f22:	b8 12 00 00 00       	mov    $0x12,%eax
    3f27:	cd 40                	int    $0x40
    3f29:	c3                   	ret

00003f2a <fstat>:
SYSCALL(fstat)
    3f2a:	b8 08 00 00 00       	mov    $0x8,%eax
    3f2f:	cd 40                	int    $0x40
    3f31:	c3                   	ret

00003f32 <link>:
SYSCALL(link)
    3f32:	b8 13 00 00 00       	mov    $0x13,%eax
    3f37:	cd 40                	int    $0x40
    3f39:	c3                   	ret

00003f3a <mkdir>:
SYSCALL(mkdir)
    3f3a:	b8 14 00 00 00       	mov    $0x14,%eax
    3f3f:	cd 40                	int    $0x40
    3f41:	c3                   	ret

00003f42 <chdir>:
SYSCALL(chdir)
    3f42:	b8 09 00 00 00       	mov    $0x9,%eax
    3f47:	cd 40                	int    $0x40
    3f49:	c3                   	ret

00003f4a <dup>:
SYSCALL(dup)
    3f4a:	b8 0a 00 00 00       	mov    $0xa,%eax
    3f4f:	cd 40                	int    $0x40
    3f51:	c3                   	ret

00003f52 <getpid>:
SYSCALL(getpid)
    3f52:	b8 0b 00 00 00       	mov    $0xb,%eax
    3f57:	cd 40                	int    $0x40
    3f59:	c3                   	ret

00003f5a <sbrk>:
SYSCALL(sbrk)
    3f5a:	b8 0c 00 00 00       	mov    $0xc,%eax
    3f5f:	cd 40                	int    $0x40
    3f61:	c3                   	ret

00003f62 <sleep>:
SYSCALL(sleep)
    3f62:	b8 0d 00 00 00       	mov    $0xd,%eax
    3f67:	cd 40                	int    $0x40
    3f69:	c3                   	ret

00003f6a <uptime>:
SYSCALL(uptime)
    3f6a:	b8 0e 00 00 00       	mov    $0xe,%eax
    3f6f:	cd 40                	int    $0x40
    3f71:	c3                   	ret

00003f72 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3f72:	55                   	push   %ebp
    3f73:	89 e5                	mov    %esp,%ebp
    3f75:	83 ec 18             	sub    $0x18,%esp
    3f78:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f7b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3f7e:	83 ec 04             	sub    $0x4,%esp
    3f81:	6a 01                	push   $0x1
    3f83:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3f86:	50                   	push   %eax
    3f87:	ff 75 08             	push   0x8(%ebp)
    3f8a:	e8 63 ff ff ff       	call   3ef2 <write>
    3f8f:	83 c4 10             	add    $0x10,%esp
}
    3f92:	90                   	nop
    3f93:	c9                   	leave
    3f94:	c3                   	ret

00003f95 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3f95:	55                   	push   %ebp
    3f96:	89 e5                	mov    %esp,%ebp
    3f98:	83 ec 28             	sub    $0x28,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3f9b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3fa2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3fa6:	74 17                	je     3fbf <printint+0x2a>
    3fa8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3fac:	79 11                	jns    3fbf <printint+0x2a>
    neg = 1;
    3fae:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3fb5:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fb8:	f7 d8                	neg    %eax
    3fba:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3fbd:	eb 06                	jmp    3fc5 <printint+0x30>
  } else {
    x = xx;
    3fbf:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fc2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3fc5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3fcc:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3fcf:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3fd2:	ba 00 00 00 00       	mov    $0x0,%edx
    3fd7:	f7 f1                	div    %ecx
    3fd9:	89 d1                	mov    %edx,%ecx
    3fdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3fde:	8d 50 01             	lea    0x1(%eax),%edx
    3fe1:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3fe4:	0f b6 91 bc 62 00 00 	movzbl 0x62bc(%ecx),%edx
    3feb:	88 54 05 dc          	mov    %dl,-0x24(%ebp,%eax,1)
  }while((x /= base) != 0);
    3fef:	8b 4d 10             	mov    0x10(%ebp),%ecx
    3ff2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3ff5:	ba 00 00 00 00       	mov    $0x0,%edx
    3ffa:	f7 f1                	div    %ecx
    3ffc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3fff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4003:	75 c7                	jne    3fcc <printint+0x37>
  if(neg)
    4005:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4009:	74 2d                	je     4038 <printint+0xa3>
    buf[i++] = '-';
    400b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    400e:	8d 50 01             	lea    0x1(%eax),%edx
    4011:	89 55 f4             	mov    %edx,-0xc(%ebp)
    4014:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    4019:	eb 1d                	jmp    4038 <printint+0xa3>
    putc(fd, buf[i]);
    401b:	8d 55 dc             	lea    -0x24(%ebp),%edx
    401e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4021:	01 d0                	add    %edx,%eax
    4023:	0f b6 00             	movzbl (%eax),%eax
    4026:	0f be c0             	movsbl %al,%eax
    4029:	83 ec 08             	sub    $0x8,%esp
    402c:	50                   	push   %eax
    402d:	ff 75 08             	push   0x8(%ebp)
    4030:	e8 3d ff ff ff       	call   3f72 <putc>
    4035:	83 c4 10             	add    $0x10,%esp
  while(--i >= 0)
    4038:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    403c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4040:	79 d9                	jns    401b <printint+0x86>
}
    4042:	90                   	nop
    4043:	90                   	nop
    4044:	c9                   	leave
    4045:	c3                   	ret

00004046 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    4046:	55                   	push   %ebp
    4047:	89 e5                	mov    %esp,%ebp
    4049:	83 ec 28             	sub    $0x28,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    404c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    4053:	8d 45 0c             	lea    0xc(%ebp),%eax
    4056:	83 c0 04             	add    $0x4,%eax
    4059:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    405c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    4063:	e9 59 01 00 00       	jmp    41c1 <printf+0x17b>
    c = fmt[i] & 0xff;
    4068:	8b 55 0c             	mov    0xc(%ebp),%edx
    406b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    406e:	01 d0                	add    %edx,%eax
    4070:	0f b6 00             	movzbl (%eax),%eax
    4073:	0f be c0             	movsbl %al,%eax
    4076:	25 ff 00 00 00       	and    $0xff,%eax
    407b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    407e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4082:	75 2c                	jne    40b0 <printf+0x6a>
      if(c == '%'){
    4084:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4088:	75 0c                	jne    4096 <printf+0x50>
        state = '%';
    408a:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    4091:	e9 27 01 00 00       	jmp    41bd <printf+0x177>
      } else {
        putc(fd, c);
    4096:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4099:	0f be c0             	movsbl %al,%eax
    409c:	83 ec 08             	sub    $0x8,%esp
    409f:	50                   	push   %eax
    40a0:	ff 75 08             	push   0x8(%ebp)
    40a3:	e8 ca fe ff ff       	call   3f72 <putc>
    40a8:	83 c4 10             	add    $0x10,%esp
    40ab:	e9 0d 01 00 00       	jmp    41bd <printf+0x177>
      }
    } else if(state == '%'){
    40b0:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    40b4:	0f 85 03 01 00 00    	jne    41bd <printf+0x177>
      if(c == 'd'){
    40ba:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    40be:	75 1e                	jne    40de <printf+0x98>
        printint(fd, *ap, 10, 1);
    40c0:	8b 45 e8             	mov    -0x18(%ebp),%eax
    40c3:	8b 00                	mov    (%eax),%eax
    40c5:	6a 01                	push   $0x1
    40c7:	6a 0a                	push   $0xa
    40c9:	50                   	push   %eax
    40ca:	ff 75 08             	push   0x8(%ebp)
    40cd:	e8 c3 fe ff ff       	call   3f95 <printint>
    40d2:	83 c4 10             	add    $0x10,%esp
        ap++;
    40d5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    40d9:	e9 d8 00 00 00       	jmp    41b6 <printf+0x170>
      } else if(c == 'x' || c == 'p'){
    40de:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    40e2:	74 06                	je     40ea <printf+0xa4>
    40e4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    40e8:	75 1e                	jne    4108 <printf+0xc2>
        printint(fd, *ap, 16, 0);
    40ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
    40ed:	8b 00                	mov    (%eax),%eax
    40ef:	6a 00                	push   $0x0
    40f1:	6a 10                	push   $0x10
    40f3:	50                   	push   %eax
    40f4:	ff 75 08             	push   0x8(%ebp)
    40f7:	e8 99 fe ff ff       	call   3f95 <printint>
    40fc:	83 c4 10             	add    $0x10,%esp
        ap++;
    40ff:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4103:	e9 ae 00 00 00       	jmp    41b6 <printf+0x170>
      } else if(c == 's'){
    4108:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    410c:	75 43                	jne    4151 <printf+0x10b>
        s = (char*)*ap;
    410e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4111:	8b 00                	mov    (%eax),%eax
    4113:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    4116:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    411a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    411e:	75 25                	jne    4145 <printf+0xff>
          s = "(null)";
    4120:	c7 45 f4 ca 5b 00 00 	movl   $0x5bca,-0xc(%ebp)
        while(*s != 0){
    4127:	eb 1c                	jmp    4145 <printf+0xff>
          putc(fd, *s);
    4129:	8b 45 f4             	mov    -0xc(%ebp),%eax
    412c:	0f b6 00             	movzbl (%eax),%eax
    412f:	0f be c0             	movsbl %al,%eax
    4132:	83 ec 08             	sub    $0x8,%esp
    4135:	50                   	push   %eax
    4136:	ff 75 08             	push   0x8(%ebp)
    4139:	e8 34 fe ff ff       	call   3f72 <putc>
    413e:	83 c4 10             	add    $0x10,%esp
          s++;
    4141:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
        while(*s != 0){
    4145:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4148:	0f b6 00             	movzbl (%eax),%eax
    414b:	84 c0                	test   %al,%al
    414d:	75 da                	jne    4129 <printf+0xe3>
    414f:	eb 65                	jmp    41b6 <printf+0x170>
        }
      } else if(c == 'c'){
    4151:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    4155:	75 1d                	jne    4174 <printf+0x12e>
        putc(fd, *ap);
    4157:	8b 45 e8             	mov    -0x18(%ebp),%eax
    415a:	8b 00                	mov    (%eax),%eax
    415c:	0f be c0             	movsbl %al,%eax
    415f:	83 ec 08             	sub    $0x8,%esp
    4162:	50                   	push   %eax
    4163:	ff 75 08             	push   0x8(%ebp)
    4166:	e8 07 fe ff ff       	call   3f72 <putc>
    416b:	83 c4 10             	add    $0x10,%esp
        ap++;
    416e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    4172:	eb 42                	jmp    41b6 <printf+0x170>
      } else if(c == '%'){
    4174:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    4178:	75 17                	jne    4191 <printf+0x14b>
        putc(fd, c);
    417a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    417d:	0f be c0             	movsbl %al,%eax
    4180:	83 ec 08             	sub    $0x8,%esp
    4183:	50                   	push   %eax
    4184:	ff 75 08             	push   0x8(%ebp)
    4187:	e8 e6 fd ff ff       	call   3f72 <putc>
    418c:	83 c4 10             	add    $0x10,%esp
    418f:	eb 25                	jmp    41b6 <printf+0x170>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    4191:	83 ec 08             	sub    $0x8,%esp
    4194:	6a 25                	push   $0x25
    4196:	ff 75 08             	push   0x8(%ebp)
    4199:	e8 d4 fd ff ff       	call   3f72 <putc>
    419e:	83 c4 10             	add    $0x10,%esp
        putc(fd, c);
    41a1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    41a4:	0f be c0             	movsbl %al,%eax
    41a7:	83 ec 08             	sub    $0x8,%esp
    41aa:	50                   	push   %eax
    41ab:	ff 75 08             	push   0x8(%ebp)
    41ae:	e8 bf fd ff ff       	call   3f72 <putc>
    41b3:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
    41b6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  for(i = 0; fmt[i]; i++){
    41bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    41c1:	8b 55 0c             	mov    0xc(%ebp),%edx
    41c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    41c7:	01 d0                	add    %edx,%eax
    41c9:	0f b6 00             	movzbl (%eax),%eax
    41cc:	84 c0                	test   %al,%al
    41ce:	0f 85 94 fe ff ff    	jne    4068 <printf+0x22>
    }
  }
}
    41d4:	90                   	nop
    41d5:	90                   	nop
    41d6:	c9                   	leave
    41d7:	c3                   	ret

000041d8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    41d8:	55                   	push   %ebp
    41d9:	89 e5                	mov    %esp,%ebp
    41db:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    41de:	8b 45 08             	mov    0x8(%ebp),%eax
    41e1:	83 e8 08             	sub    $0x8,%eax
    41e4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    41e7:	a1 a8 aa 00 00       	mov    0xaaa8,%eax
    41ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
    41ef:	eb 24                	jmp    4215 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    41f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    41f4:	8b 00                	mov    (%eax),%eax
    41f6:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    41f9:	72 12                	jb     420d <free+0x35>
    41fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    41fe:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    4201:	72 24                	jb     4227 <free+0x4f>
    4203:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4206:	8b 00                	mov    (%eax),%eax
    4208:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    420b:	72 1a                	jb     4227 <free+0x4f>
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    420d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4210:	8b 00                	mov    (%eax),%eax
    4212:	89 45 fc             	mov    %eax,-0x4(%ebp)
    4215:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4218:	39 45 fc             	cmp    %eax,-0x4(%ebp)
    421b:	73 d4                	jae    41f1 <free+0x19>
    421d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4220:	8b 00                	mov    (%eax),%eax
    4222:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    4225:	73 ca                	jae    41f1 <free+0x19>
      break;
  if(bp + bp->s.size == p->s.ptr){
    4227:	8b 45 f8             	mov    -0x8(%ebp),%eax
    422a:	8b 40 04             	mov    0x4(%eax),%eax
    422d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4234:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4237:	01 c2                	add    %eax,%edx
    4239:	8b 45 fc             	mov    -0x4(%ebp),%eax
    423c:	8b 00                	mov    (%eax),%eax
    423e:	39 c2                	cmp    %eax,%edx
    4240:	75 24                	jne    4266 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    4242:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4245:	8b 50 04             	mov    0x4(%eax),%edx
    4248:	8b 45 fc             	mov    -0x4(%ebp),%eax
    424b:	8b 00                	mov    (%eax),%eax
    424d:	8b 40 04             	mov    0x4(%eax),%eax
    4250:	01 c2                	add    %eax,%edx
    4252:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4255:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4258:	8b 45 fc             	mov    -0x4(%ebp),%eax
    425b:	8b 00                	mov    (%eax),%eax
    425d:	8b 10                	mov    (%eax),%edx
    425f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4262:	89 10                	mov    %edx,(%eax)
    4264:	eb 0a                	jmp    4270 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4266:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4269:	8b 10                	mov    (%eax),%edx
    426b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    426e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    4270:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4273:	8b 40 04             	mov    0x4(%eax),%eax
    4276:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    427d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4280:	01 d0                	add    %edx,%eax
    4282:	39 45 f8             	cmp    %eax,-0x8(%ebp)
    4285:	75 20                	jne    42a7 <free+0xcf>
    p->s.size += bp->s.size;
    4287:	8b 45 fc             	mov    -0x4(%ebp),%eax
    428a:	8b 50 04             	mov    0x4(%eax),%edx
    428d:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4290:	8b 40 04             	mov    0x4(%eax),%eax
    4293:	01 c2                	add    %eax,%edx
    4295:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4298:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    429b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    429e:	8b 10                	mov    (%eax),%edx
    42a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42a3:	89 10                	mov    %edx,(%eax)
    42a5:	eb 08                	jmp    42af <free+0xd7>
  } else
    p->s.ptr = bp;
    42a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42aa:	8b 55 f8             	mov    -0x8(%ebp),%edx
    42ad:	89 10                	mov    %edx,(%eax)
  freep = p;
    42af:	8b 45 fc             	mov    -0x4(%ebp),%eax
    42b2:	a3 a8 aa 00 00       	mov    %eax,0xaaa8
}
    42b7:	90                   	nop
    42b8:	c9                   	leave
    42b9:	c3                   	ret

000042ba <morecore>:

static Header*
morecore(uint nu)
{
    42ba:	55                   	push   %ebp
    42bb:	89 e5                	mov    %esp,%ebp
    42bd:	83 ec 18             	sub    $0x18,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    42c0:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    42c7:	77 07                	ja     42d0 <morecore+0x16>
    nu = 4096;
    42c9:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    42d0:	8b 45 08             	mov    0x8(%ebp),%eax
    42d3:	c1 e0 03             	shl    $0x3,%eax
    42d6:	83 ec 0c             	sub    $0xc,%esp
    42d9:	50                   	push   %eax
    42da:	e8 7b fc ff ff       	call   3f5a <sbrk>
    42df:	83 c4 10             	add    $0x10,%esp
    42e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    42e5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    42e9:	75 07                	jne    42f2 <morecore+0x38>
    return 0;
    42eb:	b8 00 00 00 00       	mov    $0x0,%eax
    42f0:	eb 26                	jmp    4318 <morecore+0x5e>
  hp = (Header*)p;
    42f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    42f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
    42fb:	8b 55 08             	mov    0x8(%ebp),%edx
    42fe:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4301:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4304:	83 c0 08             	add    $0x8,%eax
    4307:	83 ec 0c             	sub    $0xc,%esp
    430a:	50                   	push   %eax
    430b:	e8 c8 fe ff ff       	call   41d8 <free>
    4310:	83 c4 10             	add    $0x10,%esp
  return freep;
    4313:	a1 a8 aa 00 00       	mov    0xaaa8,%eax
}
    4318:	c9                   	leave
    4319:	c3                   	ret

0000431a <malloc>:

void*
malloc(uint nbytes)
{
    431a:	55                   	push   %ebp
    431b:	89 e5                	mov    %esp,%ebp
    431d:	83 ec 18             	sub    $0x18,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    4320:	8b 45 08             	mov    0x8(%ebp),%eax
    4323:	83 c0 07             	add    $0x7,%eax
    4326:	c1 e8 03             	shr    $0x3,%eax
    4329:	83 c0 01             	add    $0x1,%eax
    432c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    432f:	a1 a8 aa 00 00       	mov    0xaaa8,%eax
    4334:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4337:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    433b:	75 23                	jne    4360 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    433d:	c7 45 f0 a0 aa 00 00 	movl   $0xaaa0,-0x10(%ebp)
    4344:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4347:	a3 a8 aa 00 00       	mov    %eax,0xaaa8
    434c:	a1 a8 aa 00 00       	mov    0xaaa8,%eax
    4351:	a3 a0 aa 00 00       	mov    %eax,0xaaa0
    base.s.size = 0;
    4356:	c7 05 a4 aa 00 00 00 	movl   $0x0,0xaaa4
    435d:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4360:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4363:	8b 00                	mov    (%eax),%eax
    4365:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    4368:	8b 45 f4             	mov    -0xc(%ebp),%eax
    436b:	8b 40 04             	mov    0x4(%eax),%eax
    436e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4371:	72 4d                	jb     43c0 <malloc+0xa6>
      if(p->s.size == nunits)
    4373:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4376:	8b 40 04             	mov    0x4(%eax),%eax
    4379:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    437c:	75 0c                	jne    438a <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    437e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4381:	8b 10                	mov    (%eax),%edx
    4383:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4386:	89 10                	mov    %edx,(%eax)
    4388:	eb 26                	jmp    43b0 <malloc+0x96>
      else {
        p->s.size -= nunits;
    438a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    438d:	8b 40 04             	mov    0x4(%eax),%eax
    4390:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4393:	89 c2                	mov    %eax,%edx
    4395:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4398:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    439b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    439e:	8b 40 04             	mov    0x4(%eax),%eax
    43a1:	c1 e0 03             	shl    $0x3,%eax
    43a4:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    43a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43aa:	8b 55 ec             	mov    -0x14(%ebp),%edx
    43ad:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    43b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    43b3:	a3 a8 aa 00 00       	mov    %eax,0xaaa8
      return (void*)(p + 1);
    43b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43bb:	83 c0 08             	add    $0x8,%eax
    43be:	eb 3b                	jmp    43fb <malloc+0xe1>
    }
    if(p == freep)
    43c0:	a1 a8 aa 00 00       	mov    0xaaa8,%eax
    43c5:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    43c8:	75 1e                	jne    43e8 <malloc+0xce>
      if((p = morecore(nunits)) == 0)
    43ca:	83 ec 0c             	sub    $0xc,%esp
    43cd:	ff 75 ec             	push   -0x14(%ebp)
    43d0:	e8 e5 fe ff ff       	call   42ba <morecore>
    43d5:	83 c4 10             	add    $0x10,%esp
    43d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    43db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    43df:	75 07                	jne    43e8 <malloc+0xce>
        return 0;
    43e1:	b8 00 00 00 00       	mov    $0x0,%eax
    43e6:	eb 13                	jmp    43fb <malloc+0xe1>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    43e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    43ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43f1:	8b 00                	mov    (%eax),%eax
    43f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    43f6:	e9 6d ff ff ff       	jmp    4368 <malloc+0x4e>
  }
}
    43fb:	c9                   	leave
    43fc:	c3                   	ret
