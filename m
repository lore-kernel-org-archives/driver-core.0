Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E902EFDA4;
	Fri, 23 Jan 2026 10:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769165308; cv=none; b=SbJjeZXNSjE77oJ1oOqRsvPF81wUud70YZdKUR1KoVjAzfG9BugmYO3bQuEaWxd5BhhGanHn54PvszLU/djYKxh/8vpcy+y3xZlpMXS/3dHEh0XFOr5pfwVix3QvmM7qUFZOqLqt00EDJAefY7wyQhTNgwaYeAA+v0PlkdBbdA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769165308; c=relaxed/simple;
	bh=+DOa4z65K5OWCRDlx1EP7PPZTz/EVsald6c5wTD1L+w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AoMjCNBl4QZYbgad4jQ6LRljTOVSkb1ctpCliO7Gb8TRjPoQo3AlPylsJPv7LQfdPnhOGgOwYYKnzm0EoY+VErk4ZhOWATjwDh4g0896m123n3+DX+TSpC55vYyuRXwfeCsOmAw3ni14RggsK8uEluoNZVkmpi7v9eELN3O/9tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/6KZKoK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/6KZKoK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40B9EC4CEF1;
	Fri, 23 Jan 2026 10:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769165308;
	bh=+DOa4z65K5OWCRDlx1EP7PPZTz/EVsald6c5wTD1L+w=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=A/6KZKoKvT5DxiFf+eGxa3jN3zreT1lxLgZ7mQ/zNu1VcbnMUU2bLnA7n1QM0C0o5
	 sF941bSs0i6xikMDL74uTZCHV3e70kWNVlHQyWH7xu/Ew89m7xCOMKuT0PmdkhFyuk
	 3VtYkU1OSyiu3MRwEDrVa4HDtNyOshoXrXOTQtq5DcLMRTWTcBCDcyw15tbp/lfHXk
	 46HCzefQYli6+kFwKlJGUpkguZr3yd5dLUDncGbUuplHfSZ9KYPdEN2ueyFL9MszaX
	 4uEqpHXNOl3GWUZrmQr+H99E3A9mKbHAYelIVfE2G0wPKVrnuPBKFSqW8/gNeLJUWu
	 Hdq4a8fCQZZbw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 Jan 2026 11:48:25 +0100
Message-Id: <DFVWRD987H08.JG64OAFXPL9R@kernel.org>
Subject: Re: [PATCH] driver-core: move devres_for_each_res() to base.h
Cc: <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260119162920.77189-1-dakr@kernel.org>
In-Reply-To: <20260119162920.77189-1-dakr@kernel.org>

On Mon Jan 19, 2026 at 5:27 PM CET, Danilo Krummrich wrote:
> devres_for_each_res() is only used by .../firmware_loader/main.c, which
> already includes base.h.
>
> The usage of devres_for_each_res() by code outside of driver-core is
> questionable, hence move it to base.h.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-testing, thanks!
