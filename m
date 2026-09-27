Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E627E3BED46
	for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790540980; cv=none; b=Ux2xB21tnaaEuuv68fy8bBHSzADLntRvEZKvR70b03evKV/22YfZReWV9UolwalrL2e9voT4NeTxgNc4PQMp8hSGYVhtJJTOxbvcjPW6Eu9Ijo0fnM5UgzulSjEi7qMTSIq4hX5pkRLrvWTanHBWsxRYYA7SJbmVU3c8OXz5ZRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790540980; c=relaxed/simple;
	bh=CCSZzO/knQUMn7bP6cifPp5sPoP3MnpUcM2KLsQ4hTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6Y0xfbdoY+evGX8GalfO0Gxfa1J0ltuleAZg8QdsWqvlud9muGo5+irMS+cq6fE79ntw+JW5KIkOp/Azcjd2dYs/u+IV80APpkPlWukUrsheER6V3rhy/LbyYTfcidfT4K8KLjraL335RCPR6hSAMPyZUaI7uy0CtWB1wBSFYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQlvAwW9; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQlvAwW9"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-786c3d55c99so598722137.0
        for <driver-core@lists.linux.dev>; Sun, 27 Sep 2026 13:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790540978; x=1791145778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nl+pDpZ/zHEX5u9H3JLRFmOZ4xMUKm7NbKCyuVe6wcs=;
        b=IQlvAwW9dM/uJmnfTbs53ikAMJXX9iUHwDi1NiqgAzDeChY/AW06/yP5LtboWqvuAk
         12rZJop4TckohUfkupmFQIY5lRtGbIQYpPYClpigL4e10VDzb3SUBEn9repTmYFkUIJl
         DagM/PCrraVAHd1w6XaNxsh9ddl4hy7aDPlTJfllprBjJv7TsfbpXUJNY+vBb6S/2MKN
         YCZQ/jLcrmRZqY0D7rU6UFgJWuag/c+DNi2c2urW87I67bQp6EYcYGYSu2mwchlVv5pv
         zrwBrW9Dywn1tM0JmLYeei6Y7zYZff8Se/NzduQEDZFgJE7ncrb9zGNeWBh5dsOrVAdu
         Kn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790540978; x=1791145778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nl+pDpZ/zHEX5u9H3JLRFmOZ4xMUKm7NbKCyuVe6wcs=;
        b=oADi54Ec5i4VJAodpv37JsJP51NVltsa5vMpeKm/kQHiowRXRwpgaitm1qlTEA48j8
         LSjXxWh2yDK0I1khrLMLO7AgFXYCkZpBLhnhCtxquRPc2lZ951YeQclvPo1FkRfKw3qP
         RChAvzMMICX3qzIO2YpjwKzHBoYMzSqw5wKUgvntWw391GhpSU0ru90M/JcHkUZJZuqW
         MAJHTUGesex1ciLhMnr6yBdqUvN0OJyfdxTNA63hjIL4btMlQ0LfmBzbzy6jIdVHscsJ
         k+N5RrcmGHmivpClWdNMF2vn5lCW4t5+2wNA69ksmGMzkYpuf3mHLIV+vqRWZtAhqtfe
         KlzA==
X-Forwarded-Encrypted: i=1; AKwUvBwKB6Qs8CZQ/i5kHvcQDPPjdikxyKEOL8yjYGztGTUGgub9a1ktiD0NofrRYpOraBXF07/UGVBxaDjBEw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLt2m5UdzMf+YoxVZZp2zlrF1y8LhFb9uvA7baLDyx3p4fanVjf
	C6xD0VBs/BhtlH+UtQRnmWYP2GRE2N0KhLe0ckobCZ852/aOa0DaVVSG
X-Gm-Gg: AYBFou1PbwzXga3bEw9LL2N7wnQQWGiIFeUdbzFMm68QdFqh2Hh51vWWdifgLFFTiZh
	OhHbH97FSEPpgz4KrpP+T9otQgKlgiyW1jWfOECTrThKqXqbHkXOYYg8vW1x3QV34wymDIM/u2K
	H/zAF5THFiQRANd8wmwLyqRUd9BW1HSXkb6PQ8sXG9ZV1fvUDdTme03LI0lLBMbFImEoiG2uWHv
	Z9dZcCqes6B5ZJkddA0ZmDzFxpy/xHD4Gm3bFm/9JPHzykpwdmEP5kjoAbzDgNDHYWtsvfjJ3WP
	2vn0ehnWf95S1AKoTzpvKCXhZNbW1Es70N4Hg/Qy33XPxQ+SOV7geHFhp2G0TiUhprhk689jZY5
	jmyzYd2UwEANmYTfMhL5m5wRxCxMLdDciMYU9uGRn2k+7Bk3WwP5rNHkQRA01Uo6HMaRm6ZYY1z
	VljrWMBYfaEndzrnpDE5RImKma6LK4ZsDdIQVvyDx+U9+JjfqzEoc+9Uh92cOvOl8=
X-Received: by 2002:a05:6102:3f47:b0:798:24e8:23f4 with SMTP id ada2fe7eead31-7af1cfa46e2mr3382979137.7.1790540977704;
        Sun, 27 Sep 2026 13:29:37 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9af306sm6791391137.9.2026.09.27.13.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 13:29:37 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: Re: [PATCH v2 0/2] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Sun, 27 Sep 2026 17:29:27 -0300
Message-ID: <20260927202927.2059816-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092726-posh-handyman-43a0@gregkh>
References: <2026092726-posh-handyman-43a0@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Sep 27, 2026 at 06:34:44PM +0200, Greg Kroah-Hartman wrote:
> No LLM was used to generate the patch?
> Again, no LLM for all of this?

I did use Claude Code during the process, but I want to be precise
about how. It did not find the bug, produce the analysis, or generate
the patch for me. sashiko.dev originally pointed out the missing RCU
protection on the read side. I then manually traced the pointer
lifetime and the write path, where I found the concurrent-writer double-free.
I used Claude Code only as an additional reviewer for spelling and grammar,
minor rewording, formatting, and as a sanity check for obvious mistakes.
I wrote the patch and changelog myself, and the technical analysis,
implementation, KASAN testing, reproducer, and verification were all done by me.
Given that limited use, would you still prefer that I add an Assisted-by
tag for the LLM in the next revision? I want to make sure I disclose the
tooling correctly without attributing technical work that it did not actually contribute.

My background is security research -- I spend most of my time auditing
code for memory safety issues and race conditions, among other things,
which is how I ended up looking at this code after sashiko flagged the
missing RCU protection.

> I'd like to see the userspace test scripts for this...

Sure. Below is the reproducer I used.

Result without fix: ~3900 "BUG: KASAN: double-free in
debugfs_write_file_str" on 7.3-rc4.
Result with fix: 0 reports.

In-tree callers of debugfs_create_str() with writable files
(vulnerable to the double-free):

  drivers/interconnect/debugfs-client.c:165  src_node (0600)
  drivers/interconnect/debugfs-client.c:166  dst_node (0600)
  drivers/soundwire/debugfs.c:361            firmware_file (0200)

Read-only callers (drivers/opp, sound/soc/sof, arm_scmi, i915) are
exposed to the read-path UAF but not the double-free.

== debugfs_race.c (kernel module) ==

// SPDX-License-Identifier: GPL-2.0
#include <linux/module.h>
#include <linux/debugfs.h>
#include <linux/slab.h>

static struct dentry *dir;
static char *test_str;

static int __init race_init(void)
{
	test_str = kstrdup("initial_value_1234567890", GFP_KERNEL);
	if (!test_str)
		return -ENOMEM;
	dir = debugfs_create_dir("str_race", NULL);
	debugfs_create_str("test", 0666, dir, &test_str);
	pr_info("debugfs_race: /sys/kernel/debug/str_race/test created\n");
	return 0;
}

static void __exit race_exit(void)
{
	debugfs_remove_recursive(dir);
	kfree(test_str);
}

module_init(race_init);
module_exit(race_exit);
MODULE_LICENSE("GPL");

== poc.c (userspace reproducer, gcc -O2 -pthread -o poc poc.c) ==

#define _GNU_SOURCE
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <pthread.h>
#include <sched.h>

#define PATH "/sys/kernel/debug/str_race/test"
#define ITERS 5000

static volatile int go;

static void *reader_fn(void *arg)
{
	char buf[512];
	int fd = open(PATH, O_RDONLY);
	if (fd < 0) return NULL;
	while (!go) sched_yield();
	for (int i = 0; i < ITERS; i++) {
		lseek(fd, 0, SEEK_SET);
		read(fd, buf, sizeof(buf));
	}
	close(fd);
	return NULL;
}

static void *writer_fn(void *arg)
{
	int fd = open(PATH, O_WRONLY);
	if (fd < 0) return NULL;
	while (!go) sched_yield();
	for (int i = 0; i < ITERS; i++) {
		lseek(fd, 0, SEEK_SET);
		write(fd, "AAAAAAAAAAAAAAAA", 16);
	}
	close(fd);
	return NULL;
}

int main(void)
{
	pthread_t t[16];
	int i, n;

	if (access(PATH, F_OK) != 0) {
		fprintf(stderr, "Load debugfs_race.ko first.\n");
		return 1;
	}

	/* readers vs writers */
	go = 0; n = 0;
	for (i = 0; i < 4; i++) pthread_create(&t[n++], NULL, reader_fn, NULL);
	for (i = 0; i < 4; i++) pthread_create(&t[n++], NULL, writer_fn, NULL);
	go = 1;
	for (i = 0; i < n; i++) pthread_join(t[i], NULL);

	/* writers vs writers */
	go = 0; n = 0;
	for (i = 0; i < 8; i++) pthread_create(&t[n++], NULL, writer_fn, NULL);
	go = 1;
	for (i = 0; i < n; i++) pthread_join(t[i], NULL);

	printf("Done. Check: dmesg | grep KASAN\n");
	return 0;
}

== Makefile ==

KDIR ?= /lib/modules/$(shell uname -r)/build
obj-m += debugfs_race.o
all: modules poc
modules:
	$(MAKE) -C $(KDIR) M=$(CURDIR) modules
poc: poc.c
	gcc -O2 -pthread -o poc poc.c
clean:
	$(MAKE) -C $(KDIR) M=$(CURDIR) clean
	rm -f poc

thanks,
Aldo
