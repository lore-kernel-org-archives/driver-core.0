Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8938BF93;
	Thu,  5 Feb 2026 13:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770297318; cv=none; b=YbjAk8LrFf+gPfO/ys/M0FUXx2/CQz996wZ3zx75CBdDrrU4JZCKHtt5aV7+4+gBIsVRWP/SC77YvGrIUT5hcwC7Dqc1K/yAwTUwKCMVOl8VsH2CQgbYUE9RX1wwbPAEp9yulYY9LhVc2W8aImG7SjTvfra8zShsEJJ/bO5ep3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770297318; c=relaxed/simple;
	bh=3yuh2Mq/O09M4qYXQb3pScPopK3ZEvBAm7JoN9GinJU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=b1XCe1K85yIFPNib1pKNJmRtm33SX2ZPXC9HpCUHvDQzU2IrwI3ylPPR3I+VhMGu5/JOw5kTpTXJhFyWEEBUYnSu2fQ5M05lETunmbwDsE4p0O6nZc0t4UNnEh6wvZNBJNh9fTEwZUD6UNA4cfeUq+mfQph7QnSVMTqc08De9+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4L+s5ux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4L+s5ux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8D1C4CEF7;
	Thu,  5 Feb 2026 13:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770297318;
	bh=3yuh2Mq/O09M4qYXQb3pScPopK3ZEvBAm7JoN9GinJU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=R4L+s5ux57r0+4r0OJ7yT0wjE55hP/Un70OFF/6OsFKbdfAtU/aJFi4ymFKCLD974
	 w72UT1MujtwmZvVyPwGuSckFIylWkGkVEpV5ggiJ9H95IN1M5IWKVUduZy9KnAuWfa
	 HyooZV3ZFgD6YkpsigRjiyd0S8QXpWKGl4rnB/3cCRE/QPFjtv1ii2wmPR08ore7KK
	 XTs8GN4DhdWuIUrAkBvsZANI5jGAB+jliw3e1Hkaxkh1aRUTjvRUfnq7ZRac0lXdsG
	 YH7aYMjxfCgfYFR/yOkiCGIQqxalBYfS7jO9p/vvdSlwndPQ1/jWJ1OTm4XY03F6AV
	 +mlZXExS/dHrw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 14:15:15 +0100
Message-Id: <DG720VHFTHU8.1LCZHVE8KN2IW@kernel.org>
Subject: Re: [PATCH 1/2] sysfs: remove exports of sysfs_*change_owner()
Cc: <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
To: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <2026020541-energize-graduate-981a@gregkh>
In-Reply-To: <2026020541-energize-graduate-981a@gregkh>

On Thu Feb 5, 2026 at 2:09 PM CET, Greg Kroah-Hartman wrote:
> Both sysfs_change_owner() and sysfs_file_change_owner() are exported to
> modules, but there are no in-kernel module users, so remove the exports
> so that crazy out-of-tree drivers don't get the impression that it is
> safe to call these functions at all.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
