Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B951CFBA;
	Tue, 14 Apr 2026 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776207891; cv=none; b=u4R5k5l+9P38tFUqeWFZFc0P0nOrp/0BfiQ1Par29SutB52EnHIGXXGjj61vuSWyTFH6iBGaQV69Xp/7qpz8Wwez9CbSgS2rqPCMmq18zbWCHWMprg/1LYuE/ZZWOTfWUOosmTgntO6R33C+0U3KPG78qM8Jzi3D4q6DUJfTu0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776207891; c=relaxed/simple;
	bh=hC682nQN+CcbmJrw+KUOh4ImjzEAB967Mk7NLp4VsQk=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=isP9a7PlX1z9KEKMw9LlSQnCyL+0pG23UAGtjMC3BPgjDYuBI0j1yU2Hn33rXGSg/gjKEMHdg8bxejJH3XQpB/Px0LGYKQ7sbqsZ5OhXUP0OG/QR+wNpg9NXmQSvkAOCC0Mw2a8zB16FbwWxaopVzP+w+aMQjNpdO4UV4KQSCmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/ucWaiO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/ucWaiO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D2CC19425;
	Tue, 14 Apr 2026 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776207890;
	bh=hC682nQN+CcbmJrw+KUOh4ImjzEAB967Mk7NLp4VsQk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=I/ucWaiO4tdmPJPEBZHAP3OnVS1GMacvr86+0iu9/4cxdlOQ/EWjlaNkWL0SDyJZq
	 gW1103M/3UTY/jaBnM4zVRIb9wHltfu3lmHHgm7J2npGF7WFawD5vpWinl5rr3gQYG
	 4iut+hLjcNyPCj4Kfe+ODN3W5eOCuGEmxc3EYGbBdOafZjnH6LqxhZHUz83TxXzC57
	 tUUFVz3NT4JH3xnnt+0dscuDooUeBUqEpXcZBokGasuFr7iE+mN2IDu4HNEy1T/1g2
	 GaZLbEwI9zC4in5ga7OqbGpUTBBVsizv7IGjM8GUq15NXXqUxqV2J7iArhK5pY5L9w
	 KXO2FZohPq9sQ==
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 01:04:47 +0200
Message-Id: <DHT95ARBC9W8.37Z54YM70UCT2@kernel.org>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Saravana Kannan" <saravanak@kernel.org>, "Andrew Morton"
 <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <ad6IJwpp5AA0-fAW@monoceros>
In-Reply-To: <ad6IJwpp5AA0-fAW@monoceros>

On Tue Apr 14, 2026 at 8:39 PM CEST, Uwe Kleine-K=C3=B6nig wrote:
> does that mean that there is a driver involved that somehow violates driv=
er
> core assumptions and should be fixed even without the consistent locking?

Most likely. There are two known cases where interactions with this commit =
are
expected.

  (1) One of the drivers probed on your machine gets stuck within probe() (=
or
      any other place where the device lock is held, e.g. bus callbacks) fo=
r
      some reason, e.g. due to a deadlock.  In this case this commit would
      potentially cause other tasks to get stuck in driver_attach() when th=
ey
      attempt to register a driver for the same bus the bad one sits on.

      This is also the main reason why we eventually reverted this commit, =
i.e.
      despite not being the root cause of an issue, it makes an already bad
      situation worse.

  (2) If there is a driver probed on your machine that registers another dr=
iver
      from within its probe() function for the same bus it results in a
      deadlock.  Note that this is transitive -- if a driver is probed on b=
us A,
      which e.g. deploys devices on bus B that are subsequently probed, and=
 then
      in one of the probe() calls on bus B a driver is registered for bus A=
,
      that is a deadlock as well.

      For instance, this could happen when a platform driver that runs a PC=
Ie
      root complex deploys the corresponding PCI devices and one of the
      corresponding PCI drivers registers a platform driver from probe().

      Anyways, for the underlying problem this reveals, the exact constella=
tion
      doesn't matter.  The anti-pattern it reveals is that drivers shouldn'=
t be
      registered from another driver's probe() function in the first place.

      I fixed a few drivers having this anti-pattern and all of them had ot=
her
      (lifetime) issues due to this and I think there are other potential
      deadlock scenarios as well.

> Hints about how to approach the issue (if there is any) welcome.

For (1) I think it's obvious, and I think it wouldn't have gone unnoticed i=
f any
of the drivers were bad to the point that they're getting stuck in probe() =
or
any other place where the device lock is held.

As for (2) I think the best way to catch it is lockdep. Unfortunately, lock=
dep
won't be very helpful without some additional tricks, since the driver core
calls lockdep_set_novalidate_class() for the device lock to avoid false
positives.

However, we can work around this by registering a dynamic lock class key fo=
r
every struct device individually [1] and fake taking the device lock with
mutex_acquire() and mutex_release() in __driver_attach().

This way your box should still boot properly, and in case it got stuck due =
to
(2), print a proper lockdep splat.

I hope this helps!

- Danilo

[1]

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 763e17e9f148..6770eba83fbd 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2555,6 +2555,7 @@ static void device_release(struct kobject *kobj)
         */
        devres_release_all(dev);

+       lockdep_unregister_key(&dev->mutex_key);
        kfree(dev->dma_range_map);
        kfree(dev->driver_override.name);

@@ -3160,9 +3161,9 @@ void device_initialize(struct device *dev)
        dev->kobj.kset =3D devices_kset;
        kobject_init(&dev->kobj, &device_ktype);
        INIT_LIST_HEAD(&dev->dma_pools);
-       mutex_init(&dev->mutex);
+       lockdep_register_key(&dev->mutex_key);
+       __mutex_init(&dev->mutex, "dev->mutex", &dev->mutex_key);
        spin_lock_init(&dev->driver_override.lock);
-       lockdep_set_novalidate_class(&dev->mutex);
        spin_lock_init(&dev->devres_lock);
        INIT_LIST_HEAD(&dev->devres_head);
        device_pm_init(dev);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index cb5046f0634d..a81a4ec2284c 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1228,7 +1228,9 @@ static int __driver_attach(struct device *dev, void *=
data)
         * is an error.
         */

+       mutex_acquire(&dev->mutex.dep_map, 0, 0, _THIS_IP_);
        ret =3D driver_match_device(drv, dev);
+       mutex_release(&dev->mutex.dep_map, _THIS_IP_);
        if (ret =3D=3D 0) {
                /* no match */
                return 0;
diff --git a/include/linux/device.h b/include/linux/device.h
index f0d52e1a6e07..2185d50f1c1d 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -585,6 +585,7 @@ struct device {
        struct mutex            mutex;  /* mutex to synchronize calls to
                                         * its driver.
                                         */
+       struct lock_class_key   mutex_key;

        struct dev_links_info   links;
        struct dev_pm_info      power;
