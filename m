Received: from outbound.st.icloud.com (st-2002l-snip4-11.eps.apple.com [57.103.78.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F3383985
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 16:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788451265; cv=none; b=S9WJ3P13I0q0Df/BZoywLfzxixsnzU3JrW4lmVfNyluVXUtvS5YPby81dqMePXMx6IhElvMjJlbU9fGSeiYXnERhJNMOK/Tx6e7gAUg9If4tlo16tQzYjHDsTR7rIdv3oqmsQPZtKhxT/16UyGz8KsVLz04rxBRQax9av10Xkco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788451265; c=relaxed/simple;
	bh=k5Ge8HcmDCd+FWu0Lrs6QScjxxx+69yqtwILtEcklzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a488HscgcIVdDKUly99wKTQZSrO6lOF/wp+O0OCqMKj1s0AE15SnDVHWYjHk7/vL4tU1DYA5StmRzCmA756XWZRXfZQbkinDpvO4XwN3AZqmJ71UBd0KYUbKZHCAuj9U3tPnHPHYfd8uKFTf6vXyEAeDNtqTRWSdD9VOqqgURLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net; spf=pass smtp.mailfrom=y-koj.net; dkim=fail (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b=bVq9vJdq reason="key not found in DNS"; arc=none smtp.client-ip=57.103.78.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=y-koj.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=y-koj.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=y-koj.net header.i=@y-koj.net header.b="bVq9vJdq"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-3 (Postfix) with ESMTPS id 61AF31801255;
	Thu, 03 Sep 2026 16:00:59 +0000 (UTC)
X-ICL-RepId: 01a06800-83b0-7de5-8d5a-7cb31bd4fea1
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhJA0MBXBxHCVYCXAdLVxQEAVgtTkZZH1NWXQhDS1QUBAEeBlgBHB5cDBMfVFYEUFEdXwIKBEcEWxdGA1NFQQQXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PCRQTXAcZBVcEGRVaCQpXUwBUIkcBZw9jRHVIdwhREXIUXAtYGVgbHAkUE1wHGQVXBAdYRxRHDg8TTAtHAlo0Vh9UGVoD
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=y-koj.net; s=sig1; t=1788451262; x=1791043262; bh=Jj8UCgrJdUszNK3jbXxz4NAlHwQcjk4oFjg06Vcl0Io=; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=bVq9vJdqJzMjP9UpvifMUAk0atntCQAFtwb5XbZStwZuzyZlCeyjrfVOekD8oxKUDb91Lx6a6z/stBHm6PWR0hMJJNsr0Ssal0493C1tq7JQ8ZyTRlQ4cMAcLED3CQIwhwPEay8gg5h5AJzHNZN2Wr83lsTR44vSh3JQhuLghW289nl3AqMBvaApT6nOcsEe9tBkzLTknbPGH+MzkuVXMv6oyH6qmF4zQ2hThSKX9lbw7i4p8/HbF9Huvj9tdA5xz4ZM1if7Xbsy4s2M2rP5XXk4gbXo1zjcxtVEEpAZD6ivS6xXfDDDbss2ilotAZIjOLIXr4z4ihx2CWDHtKjsww==
mail-alias-created-date: 1719758601013
Received: from desktop.y-koj.net (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-3 (Postfix) with ESMTPSA id 917FC18015DC;
	Thu, 03 Sep 2026 16:00:57 +0000 (UTC)
Date: Fri, 4 Sep 2026 01:00:54 +0900
From: Yohei Kojima <yk@y-koj.net>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs: don't warn about uninitialized debugfs for an
 error parent
Message-ID: <apmZtlPdQ4L0Defz@desktop.y-koj.net>
References: <20260903115135.63210-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903115135.63210-1-mikhail.v.gavrilov@gmail.com>
X-Proofpoint-ORIG-GUID: yyiFFSsPbiTjWl8gw63iqguqpP02uVOm
X-Proofpoint-GUID: yyiFFSsPbiTjWl8gw63iqguqpP02uVOm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEzOSBTYWx0ZWRfX4O1Bao4k5SI4
 +grjJ9wsb4tKMz7z6MbIz/HdHKic1pG8joO3gTB6FtKptrsNG0NUQLkSCrMmI9xTGviGwtHYakn
 Ps7wfqJOajxPmwgDJ/fNtXW4pkcsgQoSE4JD07Cm+syYeqerhXBJo47oXaRxUFIBSssn581hu6W
 7Se12sdTZDMOLF67sUQimDQizNl87NqGVu3BOc2Q45k6Xn67sLZ5p7WJpiyht1NoRFUv9CKdXoZ
 Jd4wXtZ5CfffiVtUqGkqQ8uo68gTC0DzZmrbCxTItGohOYOYI/CN1RSxAHtKtGH2m3JEg/U37m+
 DPzNyIeZ5OKnBoi/PHqgm0SY/ia/zjsbAcYVGOKpz7/n+7lWKNgI5dfOzeUwYE=
X-Authority-Info-Out: v=2.4 cv=Gp1PO01C c=1 sm=1 tr=0 ts=6a9999bb
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=jnl5ZKOAAAAA:8 a=pGLkceISAAAA:8
 a=YoNfM1Gq81bKbWdwTwgA:9 a=CjuIK1q_8ugA:10 a=RNrZ5ZR47oNZP8zBN2PD:22
X-JNJ: AAAAAAABcvRuuPgrT2fBK/7sW09FN8wF5Q/IE+orH8L3c2RVKYdnAphX9QhXbPT+6IIU2paJV406Zv4kniSzgSY3CMLELY8qolru2FGUgUeBHgvEmbY7/xbD5/O4VcGrq9fnc6TTH0ltoHGrnQDpuGfhh54wuXli8csCbdLTIEYsZBbnMF9qoCwK+lG+8jc7UWnAMZcGLq+yXgPJlpT4z/MARaOV+TpNy5v+GJUxyZ9vMeMGAP0C22eaMTpHknMiTaTgOkdoTAQHjBw3M4/FOdAysG0THuhY8dqEmeUGOsVqJDum2dLVDjymevzaq6fplTnw/t/sVwIRJWbex0XSga91/iR+IYiMfMTDr1/ta8pEIdUgfHwHunNl6QiwGxooUhWiDSDF6W1THbRdwuaNv1V/wftqZ3TOQ95jTT31greldIEy7g9jnLmWUa0iNMFyWAa1/hvT0C6qgJrNmQiIDWLtSLEG0XNqQIrAaQjUfXj7tSvn2YAYpvr493HzkT/ypbxhm4btJrK8nJoJnhbj5s5Yc5882I24Fhht16wdPIM59ERXXgykaiSQ0IM/i4nw9Kl4kE1mRPPpOZqjBr6Q4r+/kASf3cwi1smyjMnhM81kLP18TjZhSTOgio4283KrZDpOTESBZ2+Gngjkq27wGRpOF1qqenG4vIy60Y2C80VOvoC5j0HCCCxDctAX4KuTIceZJSJf9eGbJ7en1pwQp9q6WXtVh7eRXkFcslzVca7WnbiBVpcuiHGKylyUU5rOZJB/z2WxWeZriP1HeUTw6vlQGB/7JNl1NxtDLLrkBSW5McmE7gW4s+xTvYZO0rfGhgo8z/LX11gY8wRCW7ENB6ixW8AUGono4+xEqZuNoCmGXvMYn8bmuQUhkhdSe25+FaG+zlqN7L2QEcVcn2VPQodxnxAkdhiZUGFE4oPTGjETjFYz58GxvLyBRDYGaXKSn5LQRN5+UlqILKAXn5ipXUU+e3G/epN
 F8uGghs3rKjDpqsDAvsEIj1XInRlnCj65ivQiy8egZfcg1v/r2cieOK1SovpnKR4TSlnXncwMf/lGJReDb5gv5HUgmjU+ve6yGsSb2K2jOzGjWzDx0fU2G5wAZB1dDLjdXqHe/7Nlbx077mj55C2JRn+T7Qd9qrv8hfpkoG1ir38RfkyetGxpicNMkX43PO5fT5dIQQq6HwOw8dA+qh2R32/vdu31qABgBkCWpclE+PrIItjItJhV9M4zPybYPy4pC9mI7ESd6poyDFlyHJFQL84kcRlxCotG8JNnnPav3w==

On Thu, Sep 03, 2026 at 04:51:35PM +0500, Mikhail Gavrilov wrote:
> Since commit c3a280ff728a
> ("debugfs: warn if file creation failed due to uninitialized debugfs")
> every boot with CONFIG_REF_TRACKER=y and CONFIG_DEBUG_FS=y prints two
> errors before the root filesystem is mounted:
> 
>   debugfs: Unable to create file 'net_refcnt@(____ptrval____)',
>     debugfs is not initialized yet
>   debugfs: Unable to create file 'net_notrefcnt@(____ptrval____)',
>     debugfs is not initialized yet

Ugh... I should've noticed this...

> Move the IS_ERR(parent) check above the debugfs_initialized() test.  A
> caller passing an error parent is propagating an earlier failure, which is
> the pattern debugfs documents and which the warning is not aimed at.  A
> caller passing a valid or NULL parent too early - the case the warning was
> added for - still gets it.
> 
> One behaviour change: an early caller with an error parent now gets
> PTR_ERR(parent) back instead of -ENOENT.  All callers of these interfaces
> are documented to ignore the return value.

The new behavior looks better than the old one as it used to ignore
parent's errno and just returned ERR_PTR(-ENOENT).

> 
> Fixes: c3a280ff728a ("debugfs: warn if file creation failed due to uninitialized debugfs")
> Link: https://lore.kernel.org/all/6d1dc775f7d5e754d734907514534054f682bac5.1781171918.git.yk@y-koj.net/
> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

I tested this patch on x86_64 (Intel Core i7-14700K), Gentoo, v7.3-rc1
(940de590b839), CONFIG_REF_TRACKER=y, CONFIG_DEBUG_FS=y, with KASAN and
lockdep enabled.

  $ diff -u before_patch after_patch 
  --- before_patch        2026-09-03 23:46:02.856774818 +0900
  +++ after_patch 2026-09-03 23:46:09.990259686 +0900
  @@ -1,8 +1,6 @@
   Yama: becoming mindful.
   SELinux:  Initializing.
  -debugfs: Unable to create file 'net_refcnt@(____ptrval____)', debugfs is not initialized yet
   stackdepot: allocating hash table of 131072 entries via kvcalloc
   stackdepot: allocating space for 8192 stack pools via kvcalloc
  -debugfs: Unable to create file 'net_notrefcnt@(____ptrval____)', debugfs is not initialized yet
   Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
   Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)

Tested-by: Yohei Kojima <yk@y-koj.net>

Thank you for reporting and fixing this during rc!

Yohei

