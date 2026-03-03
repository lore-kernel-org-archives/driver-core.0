Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD5377025;
	Tue,  3 Mar 2026 10:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772533969; cv=none; b=rBkW2vQHz9m26detg7Nz6wAeJKl9Hc0g/TFqfAzaHkZCHccFO8o1SGG8xjdKuhb1SJ9xuqYc0OBQcPOuzAAQrlMlQG1XpCxd1Wo0wEjjRK0b2NoeooZGJm7GMpEovKJTrAqU4u+NB+yqXO77tqzh0/amhcfyh5gVYAAq7PneTOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772533969; c=relaxed/simple;
	bh=EDvMjE8DAEwwmRSfP1PM9PwrpEXL/gwHBXXohn8alyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pX1MboUGAcjFtzJQk30WQx36DbjDHZgITFFAWTFxuluLvR29X7kClhQhmopfshMqq/8PIoxyR4b5M26gQhJpupswjNDS4eufpTfP08rihD/7y2rXLDjAjDG8qdbukOJ31aIIMt58STztp3uuV2XH4I86+DV72moOF1qSRtBelp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrMl22AN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrMl22AN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68C7C116C6;
	Tue,  3 Mar 2026 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772533969;
	bh=EDvMjE8DAEwwmRSfP1PM9PwrpEXL/gwHBXXohn8alyU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrMl22ANFatlEUW+sgfR9vcfzLyOmJi91GT0qukpfaFe8OG7A6xGnj0Tk9TNotm75
	 Z2Dm0JR03UJs8Zx6IEsOMuARGjOLd1Xj57lg2x1NCm7UMpJnb9FYDKU/527HN2DsR9
	 NqAWWCX+WzlXcRjCYKX4Zun9UH8uK6WuGVzhMZ6hmT+wuCURTrG3KWxqeOPcrI71Gj
	 uWVAM02Zp/y0mH7vGbUtqLo5QcozV5JW6SZ5lxu301655xMU5+PqA0hHpfSwqShBLV
	 3NaeYRjg17+GNhveckBIa/TLDjcp+K7H79tURJSt+yKKZ4MGjsiQ+ZXY9ay/eENLZc
	 Pit+eoLXXa3XA==
Date: Tue, 3 Mar 2026 11:32:46 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: David Gow <david@davidgow.net>, Christian Brauner <brauner@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Waiman Long <longman@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [CRASH] kunit failures in platform-device-devm
Message-ID: <aaa4ztnTrK3CIbhS@pavilion.home>
References: <aaRH-aXYKntYyjRS@google.com>
 <aaWtcMpwHUt9E5bD@google.com>
 <a5e8670e-1b39-4b83-bd65-2584fa382d5e@davidgow.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5e8670e-1b39-4b83-bd65-2584fa382d5e@davidgow.net>

Le Tue, Mar 03, 2026 at 08:45:42AM +0800, David Gow a écrit :
> Le 02/03/2026 à 11:32 PM, Alice Ryhl a écrit :
> > On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> > > Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
> > > 
> > > I've experienced a fair number of different crashes when running kunit
> > > locally. I just ran this command on v7.0-rc1 or upstream/master:
> > > 
> > > ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_PCI=y
> > 
> > Bisection has been carried out!
> > 
> > The culprit is commit 5564c12385b7 ("kthread: Include unbound kthreads
> > in the managed affinity list"). Cc'ing everyone from this commit.
> > 
> > On this commit, kunit (executed using above command) crashes for me 70%
> > of the time (14 out of 20 runs) with kernel crashes (Oops) and
> > refcount_t use-after-free warnings in pm_runtime_test_cases and
> > platform-device-devm. On the parent commit, I was able to run kunit 24
> > times in a row with zero kunit failures.
> > 
> > The same crashes occur on tag v7.0-rc2, so this issue is not fixed.
> > 
> 
> Hmm... I've not been able to reproduce any crashes with stacktraces which
> look similar to yours, but given the bisection, could this be the kthread
> exit use-after-free?
> 
> Could you try the patch here, and see if that fixes it:
> https://lore.kernel.org/all/20260226-ungeziefer-erzfeind-13425179c7b2@brauner/

Urgh, I missed that one. Thanks a lot! Can someone bounce it to me for review as
it's not on LKML? Namely it would be nice to remove kthread_exit() on the
callsites (there aren't that many) and call do_exit() directly?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
