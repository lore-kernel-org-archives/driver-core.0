Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030811A680C;
	Tue,  3 Mar 2026 00:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772499034; cv=none; b=SaCbTljr5VPWGtMNFoLtYGAy8dsWrbP+dIsNdSy4CDytGwiMEIrjoBvTdGjcvaom+43L9pfsKtuCdgEY8S0wo+Zc2ZqOpph39Wxt/fCGDL6u/v99cLPlt68ugt/KbOOLwfkbMm5CEgKXl2TVeRTwmyr2b0mrW2icBDpXWsVGCdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772499034; c=relaxed/simple;
	bh=h+78EiHyB0I5nisIBybBPnwcYzEdq1t7W4p2/UIF1tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NVl5xf6ufXmOh1WrftDbFzR57w9RoudYR2zcDEpr/vp4aTxzvSPUApSxirfP69kGDC+bjKBxc4a1oOr346t2zhRVFToO8NkqyA2Tjattbk+BzxIUfdb1kR3bFticgG2kCirc1jOXObmxjf/aaPT9iMR926h5knCUboIBpn6qnZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqDwjzCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqDwjzCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21530C19423;
	Tue,  3 Mar 2026 00:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772499033;
	bh=h+78EiHyB0I5nisIBybBPnwcYzEdq1t7W4p2/UIF1tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lqDwjzCgCtsw1q/ZRRSp4stYrNI3LRN9QKxzvwlQ83HnsbgExBxsg3zRkyC5Xupxy
	 pvRGBwnB2CsDg4kvd25Kk67KIXUkhz5KOKPDCjmwXNzQdn1jfaJ+TSQgg4VefH2uQ5
	 IypU90CssEFgLCaGvNB9aG/6zGK7OZNzJ7y8HuZ32b6PvP+aGIfDUREorBYbxNEFIQ
	 Y1BugHlQtJQf2nzgRKc1pumV4IDjLrPgIsogmtXwyq5FXE9sxzOx2uO7BYBZKUa0xA
	 oEm0E0CEifE2aRKnZ019u/CLZr8doZ2xBVxMW/Muau9Ub3Nd3u7OTPMjqRgjPqKAgr
	 UU8KxEHjVHiOA==
Date: Tue, 3 Mar 2026 01:50:30 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Message-ID: <aaYwVseQBPiJDA0M@pavilion.home>
References: <aaRH-aXYKntYyjRS@google.com>
 <aaWtcMpwHUt9E5bD@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaWtcMpwHUt9E5bD@google.com>

Le Mon, Mar 02, 2026 at 03:32:00PM +0000, Alice Ryhl a écrit :
> On Sun, Mar 01, 2026 at 02:06:49PM +0000, Alice Ryhl wrote:
> > Hi DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS,
> > 
> > I've experienced a fair number of different crashes when running kunit
> > locally. I just ran this command on v7.0-rc1 or upstream/master:
> > 
> > ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_PCI=y
> 
> Bisection has been carried out!
> 
> The culprit is commit 5564c12385b7 ("kthread: Include unbound kthreads
> in the managed affinity list"). Cc'ing everyone from this commit.
> 
> On this commit, kunit (executed using above command) crashes for me 70%
> of the time (14 out of 20 runs) with kernel crashes (Oops) and
> refcount_t use-after-free warnings in pm_runtime_test_cases and
> platform-device-devm. On the parent commit, I was able to run kunit 24
> times in a row with zero kunit failures.
> 
> The same crashes occur on tag v7.0-rc2, so this issue is not fixed.

I can reproduce (though rather 10% of the time). Investigating...

-- 
Frederic Weisbecker
SUSE Labs
