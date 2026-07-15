Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F1148C409;
	Wed, 15 Jul 2026 17:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784136217; cv=none; b=E0eD49vqqIVDPCguPkbZATh7L9OnGwb1iX5x9jzsqB2G7xNgGvepSxMxy0Ci8TLbWVQmIOmmjTVgUXZTbj7GBaW2/RsNn8vn4XHIxw/nhiGM2laoU7z0KeUSJ03Bk+BTQtMWrWoVmTCNyoVs7myAE0u1brMz0NoQovZ09q2gRRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784136217; c=relaxed/simple;
	bh=L0wkqo4KUYcHS6VZ5fRQYES8pttt+S9Qc9kHjKeNR1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=R1hxvsmz+WL/ceiinWeegbyusiawVTvv52fTJrh9emsgKaNeZ9owEWKC8+LlHRpvF95ZxNYWk3cqqLqhJRt5u/tuIQK0w4y4jgguprIJ5FUjj57Hbk2hpMcpZ0PTUY8J8ZcBlU/l+J+ufdbTyWEzqQw95hVKI081Sg0GhjP0gyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPCfzYoC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPCfzYoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F5F1F000E9;
	Wed, 15 Jul 2026 17:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784136208;
	bh=ujP1MX1m0F7lY0EVxoTxuksu+kJ0FJohzc6DKlIxI7A=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=oPCfzYoCxbGZ8CE387ANje0YnTXuMG+yyMQs8NR2Pew4L3J9USgr46EzJB+6YEemz
	 55tJbdrXfSZ/5P8+k+xsA+Bo4PsaAnchN82YYYTYTnhs739yWzxk3FfncukbCe3CHb
	 dGcUyQPWC6L0PE9dgk3TlA9D4LycAggonSJDOZj4OvhrLJGV2XaI/k07o6hHGW/Aoy
	 jNgByT/zcqWhtfIB9nKX3If938faJXjqWbAmKYwCyIRN5BjdVlm+8TFPMyIchV703Z
	 F1ILKZEiZLUhS3awcMw70IOYvVfwJ0aFmXTbN7tv3JPivckWs5rBGdmOxmRMzvEqDu
	 8Vy5pqCZg2biQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 19:23:25 +0200
Message-Id: <DJZBI1NIB539.2WG8TLYV4ZXDV@kernel.org>
Subject: Re: [PATCH] firmware: maintain a firmware list
Cc: <gregkh@linuxfoundation.org>, <mcgrof@kernel.org>, <rafael@kernel.org>,
 <russ.weight@linux.dev>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
To: "Corentin Labbe" <clabbe@baylibre.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260715131325.26099-1-clabbe@baylibre.com>
In-Reply-To: <20260715131325.26099-1-clabbe@baylibre.com>

(Cc: driver-core; please make sure to Cc all relevant mailing lists)

On Wed Jul 15, 2026 at 3:13 PM CEST, Corentin Labbe wrote:
> From: Corentin LABBE <clabbe@baylibre.com>
>
> Checking if some firmware is missing need to check dmesg for error messag=
e,
> and on some machine this information could be lost since dmesg uses a rin=
g buffer.
> Having the list of all firmware requests is useful in many situations,
> like selecting the minimal list when doing some buildroot config
> or reducing the size of linux-firmware on gentoo via saveconfig.

The proposed implementation aside, I don't see why this needs a new kernel
interface.

  - Why can't you use 'modinfo -F firmware' for all compiled modules?

  - Don't you have a journal persisting the dmesg logs?

  - Why can't you use kprobe_event on the kernel command line if you really=
 need
    a runtime trace?

Untested, but something like

	kprobe_event=3Dp:fw_req,_request_firmware,name=3D+0(%si):string

should work I think.

Thanks,
Danilo
