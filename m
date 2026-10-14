Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC1B4AA1EB;
	Wed, 14 Oct 2026 23:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792019570; cv=none; b=agcYdJi9jIt5VnsHGaIFdJ7gkoCthJLVBcqPI9lZrrQNjo6v7KgW+vFmUdN5f6S5ujAi2nu0liYQAAZIuFTgbrYaauLV+fPcxu+gpSy4PfCVMB52QgxyLR6SvS3xPo0I+voFERJQeq2xw1FJ05DEU0IV+VwQW+uQ03VJEJwZkhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792019570; c=relaxed/simple;
	bh=kMafyjduaP1lUae/4WI1XQzW0RPWpwTuPodGwUCrnPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mjwW8HQBX+XOeBPHicWznjmau1fq+NiC+rTt/7IYAvip0pYwnGOxfW0mTyBOkxYUmr3GT27j8F3F2IXTktgJm7NDrR3tYl5J40sKK2MGKii+Ba6rGKIJxI9Lz9ciybMhBuEhcaeaNNadzcbjuQGnijnNMBbx/euLBiQgYHLI97M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgch2ncL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgch2ncL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 750541F000C4;
	Wed, 14 Oct 2026 23:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792019568;
	bh=07jZ1V0Z1+isVVyQM8bA8/GKrnr3SvshesGTrCgvRho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Fgch2ncLIzpykEIEsE6E5sTHrkq8kpaZkCZ+kHtis5IWwo8o3HCBHink8y3K1QjOg
	 dWpDnKt/C8uYbHBVYa7g5PIGeqssPI7M1BlkQrSlwhlHWf2lbKcPPLb3BAuXwWk6tL
	 9e1ALhM+2GQypVZgYT4ggjb9b2wWkB6hrU4VshHQaWcTiw/nwxa9Cc3ec4dZsj9LVO
	 8VWVESrZLpkaLZz5EA7jSKKLQ4BQ5/WsKWxgc2xyw2OljD+OFQCbCM1epxxvyvGGjb
	 kiDGFpjd+l0MR9lFitbVOLZ/MlUeC9HhrU7Ex63jLxjzHGkVXEiswddPQBEZGAIWy2
	 Bue3zta5TssFw==
From: Danilo Krummrich <dakr@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Mario Peter <mario.peter@leica-geosystems.com>,
	driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] driver core: parent lock fixes
Date: Thu, 15 Oct 2026 01:12:11 +0200
Message-ID: <20261014231210.2346737-2-dakr@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014133109.1392265-1-johan@kernel.org>
References: <20261014133109.1392265-1-johan@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 14 Oct 2026 15:31:06 +0200, Johan Hovold wrote:=0D
> [PATCH v2 0/3] driver core: parent lock fixes=0D
=0D
Applied, thanks!=0D
=0D
  Branch: driver-core-testing=0D
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-=
core.git=0D
=0D
[1/3] driver core: fix parent lock use-after-free on USB disconnect=0D
      commit: af61396a992b=0D
=0D
      [ Fix mention of bus vs. device type in __device_driver_{un}lock().=0D
        - Danilo ]=0D
=0D
[2/3] driver core: take parent lock on deferred probe=0D
      commit: 277d13e909dc=0D
[3/3] driver core: take parent lock in async device attach=0D
      commit: 20dacc0138e3=0D
=0D
      [ Fold the nested conditions into a single if statement; correct comm=
it=0D
        message to mention "device types" rather than "buses" for=0D
        "need_parent_lock". - Danilo ]=0D
=0D
The patches will appear in the next linux-next integration (typically withi=
n 24=0D
hours on weekdays).=0D
=0D
The patches are in the driver-core-testing branch and will be promoted to=0D
driver-core-next after validation.=0D
