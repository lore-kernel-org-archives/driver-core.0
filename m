Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19283A1D07;
	Mon, 30 Mar 2026 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774878905; cv=none; b=CoEroz8CbnR36Z88lJqa6kPb853wBojLkLfRamn9RUjaqDFXH+U3U0Z7Yh+AwoPlqDURIKQRG2dlIyHmFE97OQ2AP2QiEVVNZP59ELXgUsfajz/5a98fx//i13S0rSAhjl7NrnL6GBGLWHJNlC9iflxiqE5rHonkjXbuEAXH1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774878905; c=relaxed/simple;
	bh=eVzwfd06+I1HcyvWYtKIaICD0iPD3le1DxEE7RSWuE8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=f7Zee2iUKqg0aIuZjPM06ebU/M/3DXFiqdIzam5XrBOZs///i9mSlq8MpSrrUNe2FXMT7UkYCCyDYcL8Y9rV2hzhMLAP/LTMSd+QwIomf0q3JW0YrcsCXCsyXIRj76eZxgMnp3KAcpjXKRKIuOapYqMdlbcNegpzwO6iqhgNEq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXZQFrpc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXZQFrpc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03138C4CEF7;
	Mon, 30 Mar 2026 13:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774878904;
	bh=eVzwfd06+I1HcyvWYtKIaICD0iPD3le1DxEE7RSWuE8=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=LXZQFrpcuSm91Cp9GlB0m/hHwAYMLKbUlQaFuPgOi+Ok2Ab0UnY3B/j7B4DLGG0lY
	 c9oZ94cQzRlPfPvqMOy0gbkYLLLf8k08HgVpPeI0xctCavhNbOc74HsEVn6WOUp8Tk
	 9RapvLjE140eBokHsWgLkMHk5A3T+uFf6XdKInwW47/vm5GUrQ9g38Of8TC3KV/Z7a
	 2ovPJXSWioUdNZ9eWZZgPoxpyB/OvRBQ8yrxodpOq1/j67vMjhTJPyt77K5GGnMjjO
	 Swq7hKkUn0B0QJcPg+ljsh6idHY1bPdaboZrmuFsZMkm/VzHRoMj3dKZvmjuFM8ka8
	 pZK/qYsyM/r2A==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 15:55:01 +0200
Message-Id: <DHG627388EQG.3B3ZMSK2FQHUM@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] driver core: simplify __device_set_driver_override()
 clearing logic
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <akaieurus@qq.com>, "Geert Uytterhoeven" <geert@linux-m68k.org>
To: "Gui-Dong Han" <hanguidong02@gmail.com>
References: <20260325090905.169000-1-hanguidong02@gmail.com>
In-Reply-To: <20260325090905.169000-1-hanguidong02@gmail.com>

On Wed Mar 25, 2026 at 10:09 AM CET, Gui-Dong Han wrote:
> Currently, __device_set_driver_override() handles clearing the override
> via empty string ("") and newline ("\n") in two separate paths. The "\n"
> case also performs an unnecessary memory allocation and immediate free.
>
> Simplify the logic by initializing 'new' to NULL and only allocating
> memory if the string length remains non-zero after stripping the
> trailing newline.
>
> Reduce code size, improve readability, and avoid unnecessary memory
> operations.
>
> No functional change intended.
>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/driver-core/DGS82WWLXPJ0.2EH4VJSF30UR5@kern=
el.org/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied to driver-core-testing, thanks!

    [ Narrow cp's scope to the newline handling block; use scoped_guard().
      - Danilo ]
