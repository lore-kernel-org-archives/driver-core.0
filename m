Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32E244E052
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 06:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578302; cv=none; b=JOVsX8EYvXCNI/wJGWA6I5tsL1U03t9OMa5oYCXdmXe+M9sDDKdPUTxjzngcksXXnJBrWD+WRkiPGYmJgD5fCC1o0qgpKTHqypw9FSExqPB/AQdetO9oe2oozelIR2qcx4FT/7nXPfSGFWJgVYCzPOzCpRAYx7PkvCe5V0LbOcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578302; c=relaxed/simple;
	bh=g7HnC8uqTbvUXOf7grJy5hvESCLtvv+JmLFCJtRKpUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dFBSLGnA15taG7ufywOz22DNkP04QCdFt1ia0vRfhUHw4lCZnCfY2Ze1OUF1K6fhHlKUNT8O841dQue0Kgve1QU0M/ez+UD2u9QEoqCTDelQ6lY64u3guDaKZdtKMPJZdImuTAn8blGAtdekSuNa63nWf22eKAVHZpoc1g6Atzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=DHi9qyRu; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="DHi9qyRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=jB
	tlJDFKscNKWnzPzGWEgbYNeA/nKaim8x499cdrdZA=; b=DHi9qyRur8Y+DzgPTr
	dzEYfVv36KLnfN8bx6UhBu60sJO0fS0JuyUnDGI57T/mX2FE6412pLyfh4+pqvb9
	kAgpISUkP+SWJ9EdlEbcHlI2+wxfP0b+uLi+3CsFPl/jALKk7AAgCCMKwijOHc5C
	5gaG+kldfuGDIdh83mnqglRWI=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD338lcDrpqNj3_BA--.62282S2;
	Mon, 28 Sep 2026 14:51:09 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Ian Bridges <icb@fastmail.org>
Cc: Quchaosheng <quchaosheng000406@163.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	syzbot+3942dc5563ea8b96bbbe@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>
Subject: Re: [RFC PATCH] firmware_loader: fix use-after-free in fw_load_sysfs_fallback()
Date: Mon, 28 Sep 2026 14:50:51 +0800
Message-ID: <20260928065053.1750765-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ajSGzHwRxkT2rVMZ@dev>
References: 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD338lcDrpqNj3_BA--.62282S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJFyUKr1DXr1DWrW7Gw4UJwb_yoWrJw13pF
	WSqFnxKr4DuryrWrykZr4UZFyrZws3CayrGr1rG3WI9an8Zr9IqryxKw4q9F15urs3C3WY
	yFWjgwn7JryDX3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JU_UUUUUUUU=
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbDAB3jWWq6Dl2JVQAA34

Hello Ian,

I went through the two syzbot reports this targets (kernfs_get and
__kernfs_new_node) and I agree with your analysis.  device_add() is not
serialized against the removal of the requesting device, and
get_device() in request_firmware_nowait() keeps only the struct device
alive, not the kernfs nodes behind dev->kobj.sd.  The window is real.

Unfortunately I think the patch as posted cannot go in as-is:
device_lock(parent) around device_add() deadlocks for any driver that
requests firmware from its probe function, which is the common case
rather than an edge case.

Why: ->probe() already runs with the device mutex held.

  __device_attach()
      device_lock(dev);                     <- device mutex taken
      bus_for_each_drv(... __device_attach_driver)
          driver_probe_device() -> really_probe()
              drv->probe(dev)               <- driver probe

A driver that calls request_firmware() from there reaches

  _request_firmware()
      firmware_fallback_sysfs()
          fw_load_from_user_helper()
              fw_load_sysfs_fallback()
                  device_lock(parent)       <- parent == that same dev

and takes the mutex it is already holding.  Linux mutexes are not
recursive (see the semantics list in include/linux/mutex_types.h), so it
self-deadlocks.  Both the synchronous and the nowait path end up in
fw_load_sysfs_fallback(), so both are affected.

I measured this rather than reasoning about it.  Two kernels, same
config (CONFIG_PROVE_LOCKING + CONFIG_DEBUG_MUTEXES), same initramfs.  I
wrote a scratch platform driver whose ->probe() has the same shape as
softing_pdev_probe() -> softing_card_boot() -> softing_load_fw() ->
request_firmware() (drivers/net/can/softing/softing_fw.c:153), and made
it print mutex_is_locked(&dev->mutex) before requesting firmware.

Without the patch, the probe reports the mutex is held and then completes:

  fwlockdep-test: probe: mutex_is_locked(&dev->mutex) = 1
  fwlockdep-test: Falling back to sysfs fallback for: fwlockdep/does-not-exist.bin
  fwlockdep-test: probe: request_firmware returned -110      <- returned

With your RFC applied verbatim, the same probe reaches the fallback and
never comes back:

  fwlockdep-test: probe: mutex_is_locked(&dev->mutex) = 1
  fwlockdep-test: Falling back to sysfs fallback for: fwlockdep/does-not-exist.bin
  (no further output; guest had to be killed after 320s)

The host run timed out (qemu exit 124) and the guest never reached the
"request_firmware returned" line, so the 60s firmware timeout never even
expires - the task is stuck on the mutex, not waiting for userspace.

Some directions that might work instead:

a) Keep a reference on the parent's kernfs node / directory rather than
   on the struct device, so the node cannot be freed while device_add()
   uses it.  The fallback device currently holds the parent device, and
   device_del() tears the kobject hierarchy down independently of that
   reference, which is the asymmetry to close.

b) Have device_del()-side teardown and the fallback device_add()
   synchronize on something that is not the device mutex, since the
   mutex is already held by every probe-context caller.

c) Detect the teardown after device_add() and unwind, which would stop
   the crash without mutual exclusion, though it leaves the kernfs node
   lifetime question open.

I have not written a patch for this.  I would rather help get yours into
shape than file a competing one.  Raising the deadlock now seems better
than having a maintainer spend a review cycle on the RFC and hit it.

If you still have the dummy_hcd + Raw Gadget harness you mentioned, that
would be very useful for validating whichever direction we pick against
the actual crash.  Happy to dig into one of these with you.

Thanks,
Quchaosheng

