Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A33B42E6;
	Mon, 12 Oct 2026 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791844634; cv=none; b=EizfeDrUJwFm7dPhMeZeUMr6cD7YPYREm/6rprw3Xj7Zp0Xi3lXlL/XrxjbhGabJrwRWec2wcn/rKcQXDCLvaPWtHgadsRSa/Z6C0R7MxK8vZIj1BytWc5E7d5sIq4LWJ0wDQtJ9q5NygFNLOULuEZLcLPxyOlby6Bfe0Kc8SNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791844634; c=relaxed/simple;
	bh=FdwbozunUCc7zuPRwq9GYUfaTcQ565a3OSXnMSsVAbI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=T6RoSINZkUs2FpPaAlaLL/qS0wOd99GAHg5Ry5VhjhU7rU853GZdffvK1O/cKDn+rjznpJNhMOK0jPZ3EyhSSddcOrCr7hFGaxz5QclINBxl4egXb2WNOiqOKhuXnYLT1tNwBF1W+Ld3SMlFtnWJcOfzHRDRurYPl4CjkCwgRqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhTjnUtB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhTjnUtB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96441F0089B;
	Mon, 12 Oct 2026 22:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791844633;
	bh=oUGbcqLCEbhdugpJCrgg19ejdVgr04nu9YdlTnXgGEQ=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=EhTjnUtBMlBY9vB+/mNO/C3HMLjZJkXGicJvnUxDon0cM+ECRf2X0M0Etl/ejTyLG
	 CZRi+26dBISL4Njxidz63wzMsLEr8O+4piRbc7urBrXyizxvIuCC42W8yAspELTUvg
	 /CefZYPngjm01mwZ368ZtR2y3HPKq8Hh9Sa1/3E2Uo2Xqcp0i5W6DtE5+jnnhwUyJx
	 jMkuc6VatwUyWRODXYpRcwoP+AaKC1EAp+eCHcO4+LX3DO9WeJMaQ87tIQ7Ol/MZTj
	 AV2zQXdFSXriGQtsBOszLcP3tSLTF4Nps3x+yB4C12EfwxptY9vywyHhLRbwAvvoQQ
	 KzUNkh23YrHBQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 00:37:10 +0200
Message-Id: <DM37WR9GUVEO.1ZJWESPXVQ8X5@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] debugfs: clarify return values when disabled
Cc: <linux-kernel@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 <driver-core@lists.linux.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>, <linux-doc@vger.kernel.org>, "Johan
 Hovold" <johan@kernel.org>
To: "Randy Dunlap" <rdunlap@infradead.org>
References: <20261008171547.3084466-1-rdunlap@infradead.org>
In-Reply-To: <20261008171547.3084466-1-rdunlap@infradead.org>

On Thu Oct 8, 2026 at 7:15 PM CEST, Randy Dunlap wrote:
> @@ -820,6 +826,10 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_rem
>   *
>   * If debugfs is not enabled in the kernel, the value -%ENODEV will be
>   * returned.
> + * If debugfs is not enabled in the kernel build, the value %-ENODEV
> + * will be returned. If debugfs is enabled in the kernel build but is di=
sabled
> + * by using "debugfs=3Doff" on the kernel command line, the value %-EPER=
M
> + * will be returned.

This keeps the old *and* the new text.

Besides that, when debugfs is disabled via kernel command line
debugfs_change_name() checks

	if (IS_ERR_OR_NULL(dentry))
		return 0;

and if disabled via kernel command line dentry would have been an ERR_PTR a=
nd
hence it would just return 0.

(There may be more functions of this sort, I didn't check all of them.)

Thanks,
Danilo
