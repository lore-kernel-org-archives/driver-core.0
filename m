Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D3F3AD50F
	for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 05:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785303635; cv=none; b=doFd8G7sBVVz7U1qMYQh0ojyXL6twq/J2lnIkkE3Vm/W9gza7E3kK6ka2kK7EcOI+PrVvQM8roLOhZ3C6MiYhEdN0VEGjYqQ98VaKtNKliTSOPV8PWSEYtP2fjMOtJbp1YVqDvJJkx8Ea9vhgdU+R0b3oIg7zlclgY/9tIvDeN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785303635; c=relaxed/simple;
	bh=jL0RiLOugXkaYKuBva15zd1DJur+LW1Pqs6+Liy3JIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TR9S2AgRRfoCHcCvx7Vm7xzKu9sCjPNCBflEIKBUgW4gYclohvIWUfa93eP1w5HlUYIYrRm4OTHahBf7Ep6eEi40gBH0T7njzB6JLufoRnZcUgaX8+/frHKbXXB7OruQclh300lru/m0REfHbNKAMMrRM9Nz1545xiCwk/gYThM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNY8HxOr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNY8HxOr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so643652a91.3
        for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 22:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785303633; x=1785908433; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rkOHM5geNPJAHsEz68m3kayrwcdycw0DphXnanl0CQc=;
        b=RNY8HxOr7bRjDNBAzGAYYXHEYxZTq/Y3ewKmCVRlG4bwFG8/q5ua1bZKTkDeFH6nqy
         g9SJKoXv1QgsvWhUmWBQG4SzyGc7gQrgx1KLz5SIHFCGWZE+zzky50Q0DnMgbt4BKfYZ
         oZBg1Wv1vibzy8HMjwq1TkU+wQ7HLkxE53datrlmxR0u8i6EV4FpyIFNCbJv25hRCGUP
         3sQgeAs1cUvVE2wT/JPtg5o178hRVSOTV2zgDL3FTzXkdtWWClXiort5sDcMvEL9qwQ+
         dSL4Rzv+y0haM//agEQCRHPbQQKwdcXAKBkn2NLUJVcBoAVCvZvg+NQHdttl1sU/7OJt
         kNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785303633; x=1785908433;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkOHM5geNPJAHsEz68m3kayrwcdycw0DphXnanl0CQc=;
        b=Kttb1/p7KH7C18jQzRBy6GNcce9emZ+phL7iIU1D95942PGoqjHhN30fSegn0VCbvw
         6+H1yy29yj8uHvMsGGGt4CrPM9kB2onIaz8KNX0I9T7WSLTney8qcckU9rMW0Ma4W+96
         twuAsYruoaCtBfw+trm301iJCVcueIU7C0QDZaTzDK+0ZIF6lj8tvz7B2GEel3DZwdao
         nHIpuNslnk6jG4rBISmtTEkObFwVkbuLmQEjxfS/EJsuzTcQRFTBQEjBOrsugX4BfXXd
         1hqtVpFe8FZEcHxzscSINWKDItLa2x4lSTNQLhnuwXoZjcvgRFLYMn5VxYrEB+JniZGj
         sdCg==
X-Forwarded-Encrypted: i=1; AHgh+RrkTlUvVrz1MlfA4GZOiBsmRrmlKYdUFjfkNm0sKsbRNCJRpGdZVDuDrbR17Fgr6dhCKVrIcLzp0uMB0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/+RpOyFo8bxVtLrwuTufOy1gH50Oz0Wye7GJHsMF2YdcTPGmv
	anw06psK7zZoo39lCMqksi4tUiMessrLE8YEGTHU6Ad1TCns1wKljb8h
X-Gm-Gg: AR+sD12lvxt9NnlSV3eisjJfDxRzKYImG1ZiX+0fWrlE4n2PEa+TDcdBZDV9I5CbXnk
	yY9c13HKGPBG32nwZ5BwIK5Gecm4lREck73K0wSoUjNvriI0rlZoMozS1LNJEbb2bmcEQ1R+gVx
	ODUL6zPDuadYMxfMrKnzTZtABR8pHjCSPg2CAtX9sletKSBkUJewjo2+R75qFoyaRvR4AfT4vUh
	ghGYr0X8qvlWR0fJGTKOdW1skyjq8bUuYlxq9UaYQFZ/3NdK8kPo7BJlEC9u8rFHDOlLv8oaWm6
	QXBq/sIRex7EhDhODD7u94KeEeHjrhF3huI1KiObwz5jPY9mNGZFEuFqRDSy0YB1kAsdmkbz1Jh
	xjDV0YozjvSK8cnIed2LQLOzQxlCXIijHAUvQ7HKAdYS1rERY0nUQNLScu5hH00FAPIgPvHGyPU
	pJE2EejOIAZaQHVWCsgzSymwmUOXgi1CmeASlh1Eff6Vm0ukQ4EsKSx54hQubk3huPgOtM6EOcb
	I1cH3xfJBT+rvNmVNIe1ukwqRLsZw==
X-Received: by 2002:a17:90b:584f:b0:38f:1e1a:5141 with SMTP id 98e67ed59e1d1-38f6a45f896mr5868893a91.28.1785303633084;
        Tue, 28 Jul 2026 22:40:33 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:3062:3727:f62a:314c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm8093503c88.5.2026.07.28.22.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:40:32 -0700 (PDT)
Date: Tue, 28 Jul 2026 22:40:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: introduce PROBE_FORCE_ASYNCHRONOUS
Message-ID: <ammQvUcOF4S_VrgO@google.com>
References: <ambsuv_6mCK8U9IP@google.com>
 <2026072729-driller-leggings-e530@gregkh>
 <ambyXEGt8-f44dJD@google.com>
 <2026072717-amicably-tray-4a8b@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072717-amicably-tray-4a8b@gregkh>

On Mon, Jul 27, 2026 at 08:25:51AM +0200, Greg Kroah-Hartman wrote:
> On Sun, Jul 26, 2026 at 10:54:54PM -0700, Dmitry Torokhov wrote:
> > On Mon, Jul 27, 2026 at 07:40:57AM +0200, Greg Kroah-Hartman wrote:
> > > On Sun, Jul 26, 2026 at 10:31:41PM -0700, Dmitry Torokhov wrote:
> > > > Add PROBE_FORCE_ASYNCHRONOUS probe type enum and update
> > > > driver_allows_async_probing() to allow asynchronous probing for drivers
> > > > marked with this type.
> > > > 
> > > > While PROBE_PREFER_ASYNCHRONOUS exists, it represents a temporary opt-in
> > > > preference. Subsystems that require asynchronous probing (such as slow
> > > > legacy buses) need a dedicated probe type to guarantee asynchronous
> > > > execution.
> > > > 
> > > > Assisted-by: Antigravity:gemini-3.5-flash
> > > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > > ---
> > > > 
> > > > I am planning to rework serio and gameport subsystems to rely on
> > > > asynchronous probing instead of rolling their own implementations.
> > > 
> > > What do you mean?  Why doesn't the PROBE_PREFER_ASYNCHRONOUS work for
> > > you for those subsystems?
> > 
> > It shows the intent. It is not "preference" anymore, it is a "must". If
> > we ever introduce switch to make probing synchronous for some reason it
> > should not affect drivers that must be probed asynchronously.
> 
> I'm sorry, but I don't understand.

PROBE_PREFER_ASYNCHRONOUS says that the driver prefers to be probe
asynchronously but it can also be probed synchronously if needed.

PROBE_FORCE_ASYNCHRONOUS indicates that the driver *must* be probed
asynchronously, or the kernel will break.

Currently there is no difference in behavior, but it documents the
intent.

> And as there's no users for this, we
> really can't take it until we see those users at the same time :)

I am planning to use it in serio and gameport bus implementations that
currently roll their own asynchronous registration which is quite ugly.
Because we have nested serio ports probing *must* be done asynchronously
or it will deadlock.

I would like to merge the new constant early so that I do not have
dependency when I am ready to merge input changes.

Below is how it will look like (just a small part of a WIP series).

Thanks.

-- 
Dmitry


Input: serio - use PROBE_FORCE_ASYNCHRONOUS and make port registration synchronous

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Mark serio drivers as using PROBE_FORCE_ASYNCHRONOUS instead of
PROBE_PREFER_ASYNCHRONOUS during registration.

At the same time, rework __serio_register_port() to run synchronously
under serio_mutex instead of queuing a SERIO_REGISTER_PORT event to
kseriod. This ensures port registration happens synchronously while
driver probing is handled asynchronously by the driver core.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/serio/serio.c |   46 +++++--------------------------------------
 1 file changed, 5 insertions(+), 41 deletions(-)

diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
index dd53c2b7a39d..f47d90f0507b 100644
--- a/drivers/input/serio/serio.c
+++ b/drivers/input/serio/serio.c
@@ -124,7 +124,6 @@ enum serio_event_type {
 	SERIO_RESCAN_PORT,
 	SERIO_RECONNECT_PORT,
 	SERIO_RECONNECT_SUBTREE,
-	SERIO_REGISTER_PORT,
 };
 
 struct serio_event {
@@ -190,11 +189,6 @@ static void serio_handle_event(struct work_struct *work)
 	while ((event = serio_get_event())) {
 
 		switch (event->type) {
-
-		case SERIO_REGISTER_PORT:
-			serio_add_port(event->object);
-			break;
-
 		case SERIO_RECONNECT_PORT:
 			serio_reconnect_port(event->object);
 			break;
@@ -279,30 +273,6 @@ static void serio_remove_pending_events(void *object)
 	}
 }
 
-/*
- * Locate child serio port (if any) that has not been fully registered yet.
- *
- * Children are registered by driver's connect() handler so there can't be a
- * grandchild pending registration together with a child.
- */
-static struct serio *serio_get_pending_child(struct serio *parent)
-{
-	struct serio_event *event;
-	struct serio *serio;
-
-	guard(spinlock_irqsave)(&serio_event_lock);
-
-	list_for_each_entry(event, &serio_event_list, node) {
-		if (event->type == SERIO_REGISTER_PORT) {
-			serio = event->object;
-			if (serio->parent == parent)
-				return serio;
-		}
-	}
-
-	return NULL;
-}
-
 /*
  * Serio port operations
  */
@@ -516,13 +486,6 @@ static void serio_add_port(struct serio *serio)
  */
 static void serio_destroy_port(struct serio *serio)
 {
-	struct serio *child;
-
-	while ((child = serio_get_pending_child(serio)) != NULL) {
-		serio_remove_pending_events(child);
-		put_device(&child->dev);
-	}
-
 	if (serio->stop)
 		serio->stop(serio);
 
@@ -653,13 +616,14 @@ void serio_reconnect(struct serio *serio)
 EXPORT_SYMBOL(serio_reconnect);
 
 /*
- * Submits register request to kseriod for subsequent execution.
- * Note that port registration is always asynchronous.
+ * Synchronously registers serio port.
  */
 int __serio_register_port(struct serio *serio, struct module *owner)
 {
 	serio_init_port(serio);
-	serio_queue_event(serio, owner, SERIO_REGISTER_PORT);
+
+	guard(mutex)(&serio_mutex);
+	serio_add_port(serio);
 
 	return 0;
 }
@@ -778,7 +742,7 @@ int __serio_register_driver(struct serio_driver *drv, struct module *owner, cons
 	 * Mark all serio drivers as using asynchronous probe because serio
 	 * devices are slow and their probing takes long time.
 	 */
-	drv->driver.probe_type = PROBE_PREFER_ASYNCHRONOUS;
+	drv->driver.probe_type = PROBE_FORCE_ASYNCHRONOUS;
 
 	error = driver_register(&drv->driver);
 	if (error) {
