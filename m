Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3A745948;
	Tue,  3 Mar 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540322; cv=none; b=ATNaNBnib13xV7c2Rw1WuKWEaUuLrOWPrBFKunY0zClNF6o323gG5MDHXI/L3j+BdMJ6wTqsec9Y1JoLSXcFVttKnh7UqUYq5HkeVF2CnGlvPiJlx+6vap9/GhB0gMegifJxVyy/y2lHhMmVFFEPC2qRGqrhChgKb/r8xbpwaTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540322; c=relaxed/simple;
	bh=VJSnXNZY+oyHwGUsqZyGXTX401tyPg9lbIoOGGHJYps=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ddwPh8wVMdi7tItACq51z0PJCwxjalFbIUgyN6uqZkcvxvfjgpgbb+yri/lS8l2GdtqG4DSl5oSa3NNrCKItLyRRRiorQutzHTvxyrqWFUWtooB1jpP9YmLDxHfvlygAP7QTC0/BYZEqVTtZJyXj+sJNnwkgDt8HKY/guhFHqFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5gy1xnG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5gy1xnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C44FC116C6;
	Tue,  3 Mar 2026 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772540321;
	bh=VJSnXNZY+oyHwGUsqZyGXTX401tyPg9lbIoOGGHJYps=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=A5gy1xnGrzgkdvG9t4vVqRxHbN/Z1vWsbbIwK4s7FLXLtOAJyEtsUSotZCv9ltTYT
	 e3X+7vPFjlMFqQz+rvfVkPmnwsEzHPTbslL3VXeSZLW+XKpjQASVd5aG/sbWcScelI
	 Z+EvDj6MPg+oM6A1PUoxqYi5HwLuwxV8G6qIgOaiHTdmR+KAOTV9s6vSWN+QGvhaAZ
	 8rw6fng9HwgzNZF5AlQ3MiZlfTtsyFUWT9y8Y+JI/Tne7rcnE+AVEjxoG1l5cPQYi1
	 rQTzsl88mvavGkqTJvZtXN6TSoYRsylOwitO+1Mz0WKFhjjAmqQaW5VVwyOXThffOD
	 IIWglTcPMxnUg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 13:18:38 +0100
Message-Id: <DGT53OVWZLG0.18CKQOTW5FIU0@kernel.org>
Subject: Re: [PATCH] Revert "driver core: enforce device_lock for
 driver_match_device()"
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Linus Torvalds"
 <torvalds@linux-foundation.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260302002545.19389-1-dakr@kernel.org>
In-Reply-To: <20260302002545.19389-1-dakr@kernel.org>

On Mon Mar 2, 2026 at 1:25 AM CET, Danilo Krummrich wrote:
> This reverts commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and commit 289b14592cef ("driver core: fix
> inverted "locked" suffix of driver_match_device()").
>
> While technically correct, there is a major downside to this approach:
>
> When a device is already present in the system and a driver is
> registered on the same bus, we iterate over all devices registered on
> this bus to see if one of them matches. If we come across an already
> bound one where the corresponding driver crashed while holding the
> device lock (e.g. in probe()) we can't make any progress anymore.
>
> However, drivers are typically the least tested code in the kernel and
> hence it is a case that is likely to happen regularly. Besides hurting
> developer ergonomics, it potentially decreases chances of shutting
> things down cleanly and obtaining logs in production environments as
> well. [1]
>
> This came up in the context of a firewire bug, which only in combination
> with the reverted commit, caused the machine to hang. [2]
>
> Thus, revert commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and add a brief note clarifying that an
> implementer of struct bus_type must not expect match() to be called with
> the device lock held.
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Link: https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@da=
vidgow.net/ [2]
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/driver-core/CAHk-=3DwgJ_L1C=3DHjcYJotg_zr=
ZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to driver-core-linus, thanks!

    [ Add additional Link: reference. - Danilo ]
