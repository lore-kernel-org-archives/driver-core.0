Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472EA359A99;
	Tue,  2 Jun 2026 13:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408106; cv=none; b=cY3u1szusyVrQVbuXoZG9D7T/BQM7u05LV7+YfRxTQxZUHxWcR6wEJ16XMsGMDj6BUbA5FHJUkaqGH69K/nosewiCdvDfHldUobSAOrXMrLUa++bxqM+hGXPt8LA5/yp7fkPT7A0PJV4ZNM3hbe6KG1EgYdQNX8+yuqzXOrZMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408106; c=relaxed/simple;
	bh=TvAZHB6UyDn1Lwn4HlTmgb8/CJD3ZZHSgpwf+PVwiCA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=FRlL/FTbz/Zo9COQBRK335RfeMUUM47wivG9+j8zEHrempTzMYAMDVfwGVi4Rtv7oIfj5z/LX5zoiIPiA2cio0mctivCUCSmpGoPpVPmlDLN67e1Jjf1rsUE8q/q+BaQlkjmB+Gaw2GnLeDAJP+whLDGvFzJ59itIeqOK9Z2UxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j0rh4kF9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j0rh4kF9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920A31F00893;
	Tue,  2 Jun 2026 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408105;
	bh=ZmpcISSr3cZ4Nx3aoJe/HA9UFAGB4r3+L8/EkiCFtIc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=j0rh4kF9jVFGZ5s5rkwRJP1dyBwG2xYfjHTCzKH2zBwd7Y5zqcmtnEHUZmd4jb+re
	 hc0rDrxVlHqXCQlRu2NRcBAY9ayEtsf0UIso2UrksM/MzEPpdcn5XlRGz7cA63qUmN
	 h0zvPn+OFFGHjzMUhXArNC4NDW66rzZrJ2bfILVzKHn+PAiTpBg+1T3GKHK42Zho/A
	 odWTEY9uoTjrgSmCk6YfXh8fEVu5kEOpa4QCkHzkW/0A0K7WhS7H4YjxdS5azcMSpp
	 xWeccjAJR2gX26YA/irfFXTx8p6lHaXJmYreFwXbNiM3tul4zjsm77WD4vDmLGmxjp
	 EwfXXHtROSAKw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 15:48:21 +0200
Message-Id: <DIYLZYLC90KZ.4RUH3GPWPA1J@kernel.org>
Subject: Re: [PATCH] driver core: Use system_percpu_wq instead of system_wq
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Yuwei" <zhangyuwei20@huawei.com>, "Marco
 Crivellari" <marco.crivellari@suse.com>, "Tejun Heo" <tj@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>
In-Reply-To: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>

On Tue Jun 2, 2026 at 5:56 AM CEST, Nathan Chancellor wrote:
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index a8ca2092905e..60c005223844 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -324,7 +324,7 @@ void deferred_probe_extend_timeout(void)
>  	 * start a new one.
>  	 */
>  	if (delayed_work_pending(&deferred_probe_timeout_work) &&
> -	    mod_delayed_work(system_wq, &deferred_probe_timeout_work,
> +	    mod_delayed_work(system_percpu_wq, &deferred_probe_timeout_work,

Thanks for catching this!

I think this does not actually require per-CPU affinity, but that's indepen=
dent
of this patch of course.

Thanks,
Danilo
