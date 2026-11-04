Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830074;
	b=0rCQ8JruYxQ36s9d6ilOmOcRFUUWqG+vFTISAbNz70myaJw8qleltXjmIuIPF/jaCqfj
	 vXaEmYXMSexTvMMYMrihl9Tk0y4JtsKmdccXqTc/0BKOWdBjEFfiJqNFkRwB72p5KPfm9
	 Y3BfFH77nxtg0doys2sn83oXCM+yC5TeKr1uueKVruwIT41pRhqWvBqfJ0C+if4apuFSE
	 eFsLOuyRA0mjdgFY3bSqy5tYEmcgNimREhOkfHZO4BNwJpg/TFCcw6l/Naetkml8sWl92
	 8iDo4di7ftUZR/xuGlSirJCPinhvlhuLX9yxFMOgWzD4yM0vor+3PyOA3TdLHGnVm8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830074;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=O/IT5ea1TA/ia5Q4Lx4AEa3ZripMAx4uDfLdMDe4DOA=;
	b=OKiwILamJf+Vv6baU/IRJMu5mdZLY90iGQy8DIIWO+UJw7hx1UuCGoux4k6jbmuF6Ry9
	 rAH/LYm+ufEe5Md6bEhaBlSqWbjNgg7l822V93HdnpyksXNVFzCw+PWRZ7wbynlc2+5Tz
	 m94Q/4aku0BInu6OKc2FH6p7lSOVWu72gAzD/SHYoEubJG5zSOv2aMrgYbR9sAKWIIfFl
	 EDtxFqUEuhiGPiXQn7m2aesQMcE8+8SD8MJ4k9duGGYZ0lzqTXh0s6R9w8vZzlG3BVIvY
	 9c/eHc3EgTnVrsilsPPiFs4h96igIJVtD4DMFjMPagoc4vJZFx3m5Z0y5zMI5TEKOVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=AIMEKbtm;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC14606D824
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 22:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC14606D824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=AIMEKbtm
Received: from killaraus.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6AA8A4DC;
	Wed,  4 Nov 2026 23:05:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793829932;
	bh=VsQbt41fXOSapnTdVwtRZ3JINszuqwA4hU6clBhdmuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIMEKbtm20BUbEoUXyY6OV4BR4JVvpQfnRX1Bqy5nWkGpYEUGkXUCHwXYjKZ0LJku
	 6pUuETM1WKlWgnMNypC3c94I0BNOx73CwxmqmySYIY/mZ3XigcBMoDEFhibUC7UOND
	 epjNrjHMG7bnd+3lfY1lXTrX3Sx4FqFBGCcTKn/U=
Date: Thu, 5 Nov 2026 00:07:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chad Aldreda <ca@modelmiser.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	driver-core@lists.linux.dev, linux-media@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nick Faro <yux50000@hotmail.com>
Subject: Re: [RFC PATCH 0/4] devres: warn about managed memory still held by
 open files at unbind
Message-ID: <20261104220749.GA3976471@killaraus.ideasonboard.com>
References: <20261104215546.3990950-1-ca@modelmiser.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104215546.3990950-1-ca@modelmiser.com>

On Wed, Nov 04, 2026 at 09:55:50PM +0000, Chad Aldreda wrote:
> Driver state that an open file can reach, such as a struct cdev,
> video_device or miscdevice embedded in it, must not be devm memory: the
> file outlives the unbind, and the next operation on it, typically close(),
> is a use-after-free. This keeps being fixed one driver at a time: commit
> 44f3468a0aef ("gpio: sloppy-logic-analyzer: fix use-after-free via debugfs
> trigger on unbind") this summer, a debugfs write racing unbind on devm
> private data; commit 7d6358ab0286 ("media: cx231xx: fix devres lifetime")
> in March, one of a sweep of the related wrong-device lifetime. In 7.4-rc1
> cx231xx still has the shape: its state, with four video_devices and its
> mutex embedded, is devm_kzalloc()'d against the USB interface, and
> disconnect defers release to close() while devres frees the state at
> unbind; a fix is under review ("[PATCH 0/6] media: cx231xx: make USB
> disconnect teardown safe", Nick Faro, linux-media, 2026-08-27, changes
> requested). xilinx_hwicap embeds its struct cdev in devm memory the same
> way.
> 
> This series adds CONFIG_DEBUG_DEVRES_REFS, a runtime debug check rather
> than a static rule. From device_unbind_cleanup(), before
> devres_release_all(), it snapshots the device's managed allocations, walks
> every task's fd table once, and WARNs when an open file still points into
> an allocation about to be freed, through file->private_data, the inode's
> i_private, the inode's cdev for a character device, or an object a
> subsystem names through a small hook. Such a pointer dangles once release
> runs; it is a use-after-free if anything dereferences it afterwards, which
> for private_data is any operation, for a cdev its release on close, and
> for a debugfs file a new open or an unguarded release. A hit on a live
> debugfs file is decided after release instead, because many drivers remove
> their debugfs files through a devres action; debugfs_file_revoked() and
> debugfs_file_release_safe() (patch 1, inert until patch 2 adds the Kconfig
> symbol) tell the check whether debugfs has cut the file off and whether
> its release can still reach the data.
> 
> The walks run on a kernel thread the unbinding task waits for, and no file
> reference is kept across release. A reference the walk holds becomes the
> last one if the owner closes the file meanwhile; dropped from a user task
> its release would be queued behind unbind, where a devres action that
> waits for the close (snd_card_free()) deadlocks; dropped from a kernel
> thread it goes to the delayed-fput work. What remains, and I would like
> your view on it (question 5): that work drains one global list
> last-in-first-out with all its runs serialized, so a release there that
> needs a lock unbind holds (a usbfs close takes the USB parent lock a USB
> interface unbind holds) stalls every later delayed close, including one
> such an action is waiting for; without this option that close would have
> run from its owner's task work. The cross-vendor review this went through
> found the first of these.
> 
> Subsystems whose files do not reach the driver object through those
> pointers register the hook, keyed on their file_operations; V4L2 is the
> first (patch 3), naming the video_device; its drvdata is not named, since
> reaching it means dereferencing a video_device that may already be freed.
> The hook is a workaround. The cdev route catches a struct cdev embedded in
> managed memory (an open file pins the cdev's kobject, so inode->i_cdev is
> still there at unbind) but not these: V4L2's cdev is a separate
> cdev_alloc() with no kobject parent, and misc's is one shared cdev, so
> neither leads to the driver's allocation. Parenting V4L2's cdev to the
> video device, as mc-devnode and cec do with cdev_device_add(), would make
> the cdev hold the device whose release deletes the cdev; that is a
> media-core change with regression risk, not something a debug option
> should carry. A DRM hook is deferred: devm_drm_dev_alloc() memory is
> kzalloc()'d, so the expected yield is low.
> 
> Testing, one boot of an x86 KVM guest with KASAN, on the development
> branch (identical to this series except for two extra test vehicles): the
> test driver in patch 4 (a devm-backed misc node, a devm-embedded cdev
> node, a refcounted control node and a devres-removed debugfs file) and a
> cx231xx-shaped V4L2 vehicle WARN once per dangling allocation before the
> unbind returns (two for the test driver, one for the V4L2 vehicle), after
> which KASAN reports use-after-frees on close of the misc and cdev nodes
> and, for the V4L2 vehicle, 38 reports across a read, an ioctl and close;
> the gpio sloppy logic analyzer, instantiated through a fake-gpiochip glue
> module and unbound with four debugfs files held open, produces four info
> lines and no WARN, its reads return -EIO and nothing fires on close;
> vivid, as a negative control, is silent. The V4L2 vehicle and the glue are
> in the branch below, not in the series. Also compiled: the option off;
> DEBUG_FS=n; VIDEO_DEV=m with DEVM_REFS_TEST=m (videodev.ko and the test
> module through modpost); W=1 clean on devres.o, dd.o, v4l2-dev.o,
> debugfs/file.o and the test driver. Only the all-builtin configuration was
> booted. Not exercised: the two phase-2 WARN branches (a removed but
> unguarded, or a still-live, debugfs file) and the no-memory fallback.
> 
> Limitations, also in the Kconfig help: only files in task fd tables are
> seen; the check finds pointers that are dangling at that moment, not
> teardown races, nor whether a debugfs removal action ran before or after
> the free; a managed allocation whose release waits for its files to close
> first (an ALSA card) is not about to be freed, so a hit on it is a false
> positive; and the walk is linear in threads times fd tables and costs
> every unbind and failed probe (not deferral).
> 
> Questions for review:
>  1. Is driver core the right home for this, or should it be
>     per-subsystem (misc, V4L2) with no generic walk?
>  2. Is a hook keyed on file_operations acceptable, or should the
>     answer for V4L2 be the cdev_device_add() conversion despite its
>     risk?
>  3. Is the info/WARN split for removed-and-guarded versus unguarded
>     debugfs files the right call?
>  4. Should the test be a module plus a tools/testing/selftests script
>     rather than a module alone? The check needs fds held in a task fd
>     table across the unbind, which KUnit cannot do naturally.
>  5. The walk must hold a reference on each file it inspects, so a
>     racing close can make it the last holder; routing that release
>     through the delayed-fput worker avoids the task-work deadlock but
>     leaves the serialized-worker case above. Is that acceptable for a
>     debug option, or is there a way to look at a file's pointers
>     without the walk ever owning the last reference?
> 
> Per Documentation/process/generated-content.rst: the code, the test
> vehicles and the first drafts of these messages were written with Claude
> (Anthropic) under my direction, from prompts that specified the mechanism,
> the call site, the lock context and the debugfs handling; the series was
> then revised through repeated model-assisted review passes against the
> kernel source, including one by reviewers from three other model families,
> with the fixes mine to judge. I have read and can answer for every line.
> Where I most expect to be wrong is in the Kconfig's list of limitations
> and in the choice to put the hook in driver core at all.

Are you really expecting anyone to read all that ?

If you feel this is an important issue, ditch your LLM and try again,
this time understanding what you're doing.

> This series: https://github.com/modelmiser/linux/tree/devres-refs-v1
> Development history (incl. the two extra vehicles and the review fix
> batches): https://github.com/modelmiser/linux/tree/devres-refs-dev
> Guest harness, its logs, and the review record:
> https://github.com/modelmiser/devres-refs-support
> 
> linux-media is Cc'd on the whole series because the hook API exists
> for V4L2; linux-doc on patch 2 for devres.rst.
> 
>  .../driver-api/driver-model/devres.rst        |  18 +
>  drivers/base/Kconfig                          |  64 ++
>  drivers/base/base.h                           |  38 +
>  drivers/base/dd.c                             |  14 +-
>  drivers/base/devres.c                         | 667 ++++++++++++++++++
>  drivers/base/test/Kconfig                     |  15 +
>  drivers/base/test/Makefile                    |   2 +
>  drivers/base/test/devm_refs_test.c            | 323 +++++++++
>  drivers/media/v4l2-core/v4l2-dev.c            |  31 +
>  fs/debugfs/file.c                             | 112 +++
>  include/linux/debugfs.h                       |  29 +
>  include/linux/device/devres.h                 |  58 ++
>  12 files changed, 1367 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/base/test/devm_refs_test.c

-- 
Regards,

Laurent Pinchart
