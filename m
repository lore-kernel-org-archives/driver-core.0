Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E22B38F653
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 10:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772532015; cv=none; b=ne/ap6y2Ip9vhAzz1gxFwOI5S+x2RgTkHkEqz0yo8qOJimEE81IgkTF9fsk1vtp86ywstBFnQEn/WnMlWxrG6RanHa9Oa3KOWHdcIgLZvcLiW0LZ2RYeAOO30cA7AAZ7CdHgnmqZkPMm+0drzMHr6krCTW+u1OVVbmAAmnudRxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772532015; c=relaxed/simple;
	bh=J5WjIu0sURHNHqDPSVC5IKDCRXyhe6CQb6d57zt3/Jk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W8C0Nq5Yk5VGW6yHDCQ6Bfry3BA6pRPj9CEndbJ/fxPfioeNOYbI1J4cmF4BDas35uWRN2qwILtzYa8w1utvQ78r12O1JEVzDvnqQsc0s0e7R1QbCJct/l2RYDwjcE38/cuxAFFnUSaGZwisnD88M9bQYiIaoUWQ/dlUIFXEii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UY2bRqLx; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UY2bRqLx"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48378df3469so37119015e9.1
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 02:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772532013; x=1773136813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5WjIu0sURHNHqDPSVC5IKDCRXyhe6CQb6d57zt3/Jk=;
        b=UY2bRqLxIkR4cFO+Ad5V350sdmgjKQ9OqyU3FO0xNsejZjRhzbZsLBmZxOnZmghFa5
         roGv8HuZSAJ/vtFX3T1TNFz71sLmH5GYWymf9MaBkjTNuTn6I3FedJn93vYIrfxYLNEf
         sd/fDC1T3ma+CVQDNK7fXp7YPo9t3U0MmjbQr0ub5OJ+iFUD9kyXnkw7HkZUIoP0RIC0
         Bg6cPXXUQbKBBNsIXNrtGxfxnoQWPpJFK00JtCspe78NhIrCwv+zeiUSkOfNnd6Exuoe
         OUOoIc4Rp0r47aoEAU7CDleLBwTht5eAZDEWf1cGsm3blB7KnuIzkV364NAegIZkncrs
         khug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532013; x=1773136813;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J5WjIu0sURHNHqDPSVC5IKDCRXyhe6CQb6d57zt3/Jk=;
        b=ikY8Jc6Qh+ZxpItVrjMZJ5Hh1tzZVVFGrN8ySbvPzGkEH91omuDBPYRA3Mj1DdzTvY
         exvRcfFsW08KzRJyuavjLVRuyUZVOW9e4f4EbN97njDh5QYP04tB82Wd37u4od8tOo+4
         WiIqB/0LowESvPm8whX90ihqBUvwx7op1V8SxtJ5jJ6rVZXh0z8pZHNJauGjxPeIytBm
         iOZQV8RZ/sUKWqbD1PU0biHH0vX5J7hyScWd56zb8Un4zFz7uQmtUi72dVAxRnFgMvtn
         O4Jk8vxuFqdoBft/m0kiB4WCz0Kjnh4BeGW7EQhe+AyBMO/4k8u6w+RG/VBCqQUw2lTA
         B2Yw==
X-Forwarded-Encrypted: i=1; AJvYcCULoqt2wkDxMkS5B5UC0rH9Z3hJeQk3A0+PJyt38d4gV8POsA8lMTroXySjIocOEd3gZ+phlyFHyGXOyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJoqTpTv5PFz3FUErDBzZBTctU3+2z73AxLQcS+J3Mr9LArwJK
	EiNI3dqBsjyou78oaIYkgZHcooskgOe5JOsm52geeiX+6NAERUZGm3hQJHQ9dktmhm6jYjzbFBU
	HeJkgTBY7lTLxpizChA==
X-Received: from wmdd1.prod.google.com ([2002:a05:600c:a201:b0:480:3227:a124])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba0:b0:483:4b37:8620 with SMTP id 5b1f17b1804b1-48513a74e6amr28399965e9.10.1772532012583;
 Tue, 03 Mar 2026 02:00:12 -0800 (PST)
Date: Tue, 3 Mar 2026 10:00:11 +0000
In-Reply-To: <a5e8670e-1b39-4b83-bd65-2584fa382d5e@davidgow.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aaRH-aXYKntYyjRS@google.com> <aaWtcMpwHUt9E5bD@google.com> <a5e8670e-1b39-4b83-bd65-2584fa382d5e@davidgow.net>
Message-ID: <aaaxK5gFWN70WmMn@google.com>
Subject: Re: [CRASH] kunit failures in platform-device-devm
From: Alice Ryhl <aliceryhl@google.com>
To: David Gow <david@davidgow.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Waiman Long <longman@redhat.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2026 at 08:45:42AM +0800, David Gow wrote:
> Le 02/03/2026 =C3=A0 11:32 PM, Alice Ryhl a =C3=A9crit=C2=A0:
> > On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> > > Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
> > >=20
> > > I've experienced a fair number of different crashes when running kuni=
t
> > > locally. I just ran this command on v7.0-rc1 or upstream/master:
> > >=20
> > > ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch x86=
_64 --kconfig_add CONFIG_RUST=3Dy --kconfig_add CONFIG_PCI=3Dy
> >=20
> > Bisection has been carried out!
> >=20
> > The culprit is commit 5564c12385b7 ("kthread: Include unbound kthreads
> > in the managed affinity list"). Cc'ing everyone from this commit.
> >=20
> > On this commit, kunit (executed using above command) crashes for me 70%
> > of the time (14 out of 20 runs) with kernel crashes (Oops) and
> > refcount_t use-after-free warnings in pm_runtime_test_cases and
> > platform-device-devm. On the parent commit, I was able to run kunit 24
> > times in a row with zero kunit failures.
> >=20
> > The same crashes occur on tag v7.0-rc2, so this issue is not fixed.
> >=20
>=20
> Hmm... I've not been able to reproduce any crashes with stacktraces which
> look similar to yours, but given the bisection, could this be the kthread
> exit use-after-free?
>=20
> Could you try the patch here, and see if that fixes it:
> https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@bra=
uner/

Yes, that seems to fix it. Applying that patch on v7.0-rc2 results in no
crashes for me. (16/16 success)

Alice
