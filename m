Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8098420E71;
	Mon, 20 Jul 2026 13:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552623; cv=none; b=e9Xs8Ctw93yvJ5HQdP/IyavmMUFJHIfqi72vKtNQsa52ooeL4uS13vHSu+b2pViit9UnepdCnIir3g7zzZrMKkOVAPzLvBLIkTIDGN94UaGHmrSVkSsN9X800HCagGLPXFcsz2IoVIme0kOQeQKY/Pg91/W/UkmDHJPsC9hHQDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552623; c=relaxed/simple;
	bh=XqehXsYx1xez5Thd8BNV6gox9AbNciwSvOfv5lfcOu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GAupu3DJBHQG7oWn5ZUGK/rcn3ypNmgnq4jAy+6+plaXnzZpHRZ7w0hb2ZGjciiZt+y/PwOxRoE5wWHx6CbVHDInOPgdLofv9JsY4Of0fPQe/Jd3ZGIwFeH+eI9cXjGyfQ09Z0wGThgSoeB5GemBg1VQQYohYBeiPfAPBWAaFB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mVgiNQhU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mVgiNQhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0691F00A3A;
	Mon, 20 Jul 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784552622;
	bh=SC4pHGyX86tPulat9NkqXaOcNvHWAbDRMJNZ5S6HGX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mVgiNQhU/mftgHIIK60bUfaWgoZvMMz8dNB81n90dh/XpbangOQa82EWKO4yY6/0h
	 Z0uI1KCc79HLM3+wGY8p2uWSzOgHL1/DcM/Hum0zIxy6Os9XTb4+HYF0rJcgVhNC5t
	 P2KLpkq2UCXBH3R0wzXr9pqKvBm5FNS/yA7SNfsI=
Date: Mon, 20 Jul 2026 14:55:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: johannes@sipsolutions.net, rafael@kernel.org, dakr@kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	13667453960@163.com
Subject: Re: [PATCH] base: devcoredump: Replace simple_strtol with kstrtol
Message-ID: <2026072024-eggbeater-strewn-87ed@gregkh>
References: <20260720125035.891018-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720125035.891018-1-yijiangshan@kylinos.cn>

On Mon, Jul 20, 2026 at 08:50:35PM +0800, Jiangshan Yi wrote:
> The disabled_store() function uses simple_strtol(), which is marked
> obsolete. simple_strtol() does not provide error handling on invalid
> input - it silently returns a partial parse result or 0, which the
> 'if (tmp != 1) return -EINVAL' check then accepts as a legitimate
> non-1 value.
> 
> Replace simple_strtol(buf, NULL, 10) with kstrtol(buf, 10, &tmp),
> which returns an error code on invalid input. This makes the write-once
> lockdown attribute stricter: malformed input (e.g. trailing garbage)
> now returns -EINVAL instead of being silently treated as a non-1 value
> that the caller wanted to reject anyway.

Be careful, we are rejecting ABI changes like this as there is no real
reason to change this at this point in time, right?

thanks,

greg k-h
