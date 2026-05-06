Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3FA3DC4C9;
	Wed,  6 May 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060084; cv=none; b=fpkQg+l+Lw/EuG/25j09x0bJvrkGabZKU1VhnmxR0mUTX3MD/rLKuy6ceH2zIR9JH7PADH3x7K7NmRosONzkaqSgHkNLYMPE6ojaN6d5mzisK2vPYftRQkJQP9XCFWdsfiMvaO6R6+c+mP5qMVkkb+NEmwcG8WbrsJiD60exzts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060084; c=relaxed/simple;
	bh=WZ6JxE0NUFREJzUiSy3sA/H5nRl3edihesTlnyUr5NU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=rEoLpGUClw1SR6HGcm2DpeMp4ZuH7ep2L3y/PpWIU0tXLISU/uY8RjhfeApU6nC3a9XA9JGI7uVkngPfRhQXFtaQ8+/T3XxHsuT9bWNTuiEDZcisFwKwaa6nZvtWv7zJDPLKY8Hi5UKk9IN8kFPBpWf4aiyKbceKwb81OsVhS5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJCJ73jU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJCJ73jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E39AC2BCB8;
	Wed,  6 May 2026 09:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778060084;
	bh=WZ6JxE0NUFREJzUiSy3sA/H5nRl3edihesTlnyUr5NU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=uJCJ73jU2ZZnuZTW3QKWixyJ2iQY2wgJGiEmapdpnDQAZOEkDx6n4uYGtf/9sXnHj
	 rIs+C/xnB0RyZTRzxtj4H4Rqqzxj/fBh9/vOiSp7YK0tZIwPLQVKg/lJRnPAmfL7rg
	 D8AU1MuSjWiM0YBm2oeQCgr9YEIgYll6iYwrAhz1Lf1wz8+MA9yvPpFtfKdzDCf0y8
	 NgQSfojMvKj4bhbcPjVdp4Ap4LuWAnSYIKjcMNbN7V3vEibT/VYKYOXnOHnzIXxpJE
	 hh1sy+qA/unaXbhYn7iATcWf7ISHPCCMtDzOmCrhC0QYqTzkSHbjlPT9vE5mc8kHiW
	 b/3EfgUXhYeAw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 11:34:39 +0200
Message-Id: <DIBHP03H2703.3GVN744LMKNQ1@kernel.org>
Subject: Re: [PATCH v4 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware
 teardown
Cc: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Takashi Iwai" <tiwai@suse.com>, "Shenghao Ding"
 <shenghao-ding@ti.com>, "Kevin Lu" <kevin-lu@ti.com>, "Baojun Xu"
 <baojun.xu@ti.com>, "Jaroslav Kysela" <perex@perex.cz>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <stable@vger.kernel.org>
To: "Takashi Iwai" <tiwai@suse.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com> <874iklt12t.wl-tiwai@suse.de>
In-Reply-To: <874iklt12t.wl-tiwai@suse.de>

On Wed May 6, 2026 at 10:05 AM CEST, Takashi Iwai wrote:
> On Tue, 05 May 2026 13:18:15 +0200,
> C=C3=A1ssio Gabriel wrote:
>> C=C3=A1ssio Gabriel (2):
>>       firmware_loader: Add cancel helper for async requests
>>       ALSA: hda/tas2781: Cancel async firmware request at unbind

Looks good to me now.

> I guess this could go via driver tree?  Or I can take both if I get an
> ack, too.

Sure, I can pick it up via the driver-core tree, but please also feel free =
to
take it through the sounds tree.

Acked-by: Danilo Krummrich <dakr@kernel.org>

> In anyway, for the series:
>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
