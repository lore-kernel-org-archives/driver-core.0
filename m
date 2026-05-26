Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BEA403E97;
	Tue, 26 May 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807513; cv=none; b=bfHBZnk97AqHpZSMc8V68rUu4o4OoeCXkb2BHAjBqiPt2VoSnHbVWURHyvtjXShSorXP8YEQdhKuG9uPQvtEy0IdoqX6kvO7fVdsk0Vm/UJxC1KzjD0rGLVhDo+sNF9Jr6XL7yFuUPqb/WxgSwi+Kx0aJEICHM/JdGCeqGa4p4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807513; c=relaxed/simple;
	bh=SYoMKwyZ4JU5uGT+YFe2y6ssnEoaq0Bt7CQvvtsuZdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YZu1YW+6+Ar/ujmzXs00hDCLLqc/tvqNLvUkMUN5s52Bbd0a2yD6Yf4H/tJHutCwAZBMKzBXOtNafJmOkcU8GTljaleLftA3PFQDCFYRdmYHPneEmg93qw156tR65e+L0E2apD7c0MLAaswI6pdxAOwh2Gr7od4DDb9b/qmGIPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IrQOa5UK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IrQOa5UK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD471F000E9;
	Tue, 26 May 2026 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779807509;
	bh=4AQL4fzCYPZILqiMdYcdFgLfssQE04xv6zh53DDjRmA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=IrQOa5UKxHdMwvGV4xBjJ6Gnufs8d2Ow+XcyStHkwV8AKHg7qmu+OgpCZQhebEbNU
	 NNHirEF8wR1ezekkxgoFGXjtem6QnysecuvJXQ61jDIm+ySyThsq182pFNEJy+Zxhk
	 f1wYJWZOkoLpYPXYYbmUpXDiF+jbMxAYkwyy7bkJvZQpDq0o+v8OWsFoztwcm51uW/
	 SmgSTYvEpQx8J8Mm4IPlfpMClzyK9BmMTsLRHT6BynMLSoINls8MBCy7FPSBwRiN8a
	 7lCoI09qqrzd6q+6B8IMj6ao87NZFX+/9euY/YX9Ryl6xRS5JDRacDr5Jr1DaP3Mam
	 /bQFaJLAADJzw==
From: Danilo Krummrich <dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()
Date: Tue, 26 May 2026 16:58:24 +0200
Message-ID: <20260526145824.501263-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525012340.3860581-1-dakr@kernel.org>
References: <20260525012340.3860581-1-dakr@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 25 May 2026 03:23:21 +0200, Danilo Krummrich wrote:
> [PATCH 1/2] driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()

Applied, thanks!

  Branch: driver-core-next
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/2] driver core: Fix missing jiffies conversion in deferred_probe_extend_timeout()
      commit: f9e6da99fe49
[2/2] driver core: Guard deferred probe timeout extension with delayed_work_pending()
      commit: 557495bc8790

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
