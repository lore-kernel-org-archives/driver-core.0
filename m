Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C001DF261
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772465524; cv=none; b=Mg6E3bin9rSXTlMpyrNCEfdLk2aE8faHnZOS4XgxAQOM+W/5Oom+oge/H/JYciypn6GvTzOpeWeWxjQtEgmVFkgzg4USdDJpcN2rB16ccMseqMHpaJTBvvYte339o1Ln7F3JFCIuD3MF3Qr5N0/+nnhK/m+YNJ/9Vm2C5rWZZjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772465524; c=relaxed/simple;
	bh=Q1XeXOHSN5foHMlKxY6LGOCCkJslEsgcVVtkZPljV6A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=AcJy5vR5FyoX0By1oMLt9eY4FHVGlWbvU/J4wd/YUvtTfivT/vDDBQmtFgysWH+mKG8tVCv1KxQhYEU3eFlon7Vq1J/M/Rt6d95giwdqSXDp2EMeAFV+9gvXmYoUfpGcVjFjFU9TeOq8KcjigD8b01LhiVtq2Vre9xpmUBbwjYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FxkSmWpX; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FxkSmWpX"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65fbe7734e7so178042a12.1
        for <driver-core@lists.linux.dev>; Mon, 02 Mar 2026 07:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772465521; x=1773070321; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JCMweb9hlRg+8+20ghRvH2/c00sb3Ca5NclY/h1apTQ=;
        b=FxkSmWpXCU8QVFmPEWeBgQjFSLNAuS9fyLjAEP5eEYLf8fGRAhg7G6zHyCyaV1TPg3
         nPw+aWDCuQaMGwelqxfkZpD2kVOnIMLdkNEA0blmQwyAgen/S0C8LboWO0tmNBhVCoLM
         AcPBqTzP9wrRK9kirIM0Osr5JJ1oCPAh+OedNTbBRWYdA27EMYIxyvt5sk5tYoKfnrPe
         GV4+gNM4UdZICWvQo7EqZylaIFBJwlekClM+oRm1SB9w7zHPaoCskFrhhAn0iQF0Cjji
         3TOYNHAPBTJRodtYD19WwTNrwuch1R8Rjybq0+KIola29omUbfdikVkHTINcNwyehL8D
         EkjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465521; x=1773070321;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JCMweb9hlRg+8+20ghRvH2/c00sb3Ca5NclY/h1apTQ=;
        b=nAbI1CFcxdkt0TIP8a00DzRRPalscgV4XhN0DLusEBNGZ+5bh2oOREtQk5KwBr1xJI
         Wyqk6INKM8IN61489GNRd5E5CTa0BX9kD/B0NPo35b3LvhnOK0KDBwKLiRqeDRYmAEOc
         wRDAGjIInV1RlcX0Rc5LyWQdsjilvtg6x3um9LKH4bwTYU7+40a5wiZsbIhLv2TNpT19
         HEjXW+eK2TqNeWewaUKIh8J6FjWfdpL/gLfyltSjzS7f5JYCkO/RSvzZ/eWeV/2laMtB
         h+eSqSVOai5GMaWXb6rAkVv0NAxe49qnxiLLOKSfBQOYUCZm1jZFwnAHp0+6BoL1goJN
         yHNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvuAoQFgJmq9P3Br/psAnFgLVRhQsUdB1D2FI1zjEDfkBi3kL6V1J0uF+TjZmIN6e10l0NbkZuZQRRNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5dMWv4x5+b/2bUXOX4u0e3/6FpCKkZg/q8AEh6O2fs5zG5Q06
	Lrx+7SAnlnh5r6f9PipW/66aHWdrnKQL33y4SxvB9yg7Pry/K3rjdoEcURlaBQY4B0N22f+EBBV
	ElVanF1UG+EK4kEnVsw==
X-Received: from eddb16.prod.google.com ([2002:a05:6402:3510:b0:658:b02b:9437])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:274e:b0:65f:ade0:f8a5 with SMTP id 4fb4d7f45d1cf-65fde4bb445mr7682024a12.24.1772465521130;
 Mon, 02 Mar 2026 07:32:01 -0800 (PST)
Date: Mon, 2 Mar 2026 15:32:00 +0000
In-Reply-To: <aaRH-aXYKntYyjRS@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aaRH-aXYKntYyjRS@google.com>
Message-ID: <aaWtcMpwHUt9E5bD@google.com>
Subject: Re: [CRASH] kunit failures in platform-device-devm
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Weisbecker <frederic@kernel.org>, 
	Waiman Long <longman@redhat.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Michal Hocko <mhocko@suse.com>, Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
> 
> I've experienced a fair number of different crashes when running kunit
> locally. I just ran this command on v7.0-rc1 or upstream/master:
> 
> ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_PCI=y

Bisection has been carried out!

The culprit is commit 5564c12385b7 ("kthread: Include unbound kthreads
in the managed affinity list"). Cc'ing everyone from this commit.

On this commit, kunit (executed using above command) crashes for me 70%
of the time (14 out of 20 runs) with kernel crashes (Oops) and
refcount_t use-after-free warnings in pm_runtime_test_cases and
platform-device-devm. On the parent commit, I was able to run kunit 24
times in a row with zero kunit failures.

The same crashes occur on tag v7.0-rc2, so this issue is not fixed.

Alice
