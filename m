Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAA2319847;
	Thu, 28 May 2026 05:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946995; cv=none; b=Q0O9NFA6hUMddStmrMlrHs9VrTzWbLRQTmx7piCYCY6to6h3lnsPQIZAlPoEwHeXND8jhR0EbU0vfUOTNJju2lwzPtR+Kw4zPLxXNLXZGeTGqkb7aJjGDWqFaOFGVSqOX8tRB4Qn8JLeIyDtV1+b1MABarEZ/uvB3kNlzkteu7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946995; c=relaxed/simple;
	bh=1hO7YbCI7cn2s5Yhvi5q4x52MhOSqUWDfi7xYaDBrt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig6m38Mu0OuXXT51jwz5ZazxHgxZxIysGHee0yLnTF8NritGdw9CYkIBCDohKw1S4hgL9jUpEpXZ2hWzJsMy/qwE0wi+Q3bJdL8VcflTLHyfTG0Lddk2fCBO74aW6Bhl1vGR0SPkRbXZry7xIm4TxOJ4hppiGvF1jaQBIPaspm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I0bx2SUU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I0bx2SUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A953E1F000E9;
	Thu, 28 May 2026 05:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779946994;
	bh=U103N01Mrbya1EvC+vH0QxEPE2wDkHe8/cTHBT9FkBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I0bx2SUUuupkA1hKKv4f3uVwFfjrSsQFNLOvVyMHylUkQIUW+D6A1axKaYD8dTQIb
	 Er7OKOIdHdxyfecfTLcXiIqHWvr41rigPHqs01LiQsP61lFjQLL1DM8q4rU+w+2Jxw
	 UbxmRwRQid1gbxUUqGm7LdV4aqMaaFGGYPZhVcQc=
Date: Thu, 28 May 2026 07:42:22 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regmap: reject volatile update_bits() in cache-only mode
Message-ID: <2026052841-task-surgical-1342@gregkh>
References: <20260528053204.46783-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528053204.46783-1-phucduc.bui@gmail.com>

On Thu, May 28, 2026 at 12:32:04PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Prevent _regmap_update_bits() from accessing hardware when the register
> map is in cache-only mode.
> 
> Unlike regmap_raw_read() and _regmap_read(), the volatile
> _regmap_update_bits() fast path bypasses the cache_only check. This can
> result in unexpected hardware accesses while the device is suspended.
> 
> Return -EBUSY to ensure behavior is consistent with other cache-only
> access paths.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
> 
> Compile-tested only.

So this isn't a real bug that you have found and tested this fix
resolves?  How was this "found"?

Please submit stuff that actually is verified to resolve a real issue.

thanks,

greg k-h
