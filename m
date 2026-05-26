Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97CB3655F5;
	Tue, 26 May 2026 15:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809546; cv=none; b=MlRpi8QHYBTzywDuZCQDXQ5fGYvjLWXMbpuOrbYa5V5KVV9KgD3AHHSGK+JF96gk1X+Z6w6hG9hBfSsGQuzrhh+XzlDqlwMcUixNXqEBPFaYPbRr6vkTF3lLjc1yGGX2pCMzKLZ6Vrhxrzb8MqDrBdIb5yH9CI6S8DqygoD5aSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809546; c=relaxed/simple;
	bh=W/BWCxEGFa/xiGYh6ip3PQ0KqVLRUR+2hnbEju7n7C0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=m9oUW3euNXpWdFay1GraTwYjBJxuhIjr9zB/vOC5UHZV1lZyRkf+UqEe1EClUpADW9H9TaD4R/yah7VLBk1DXY58XdVDo2Uu3Jjpe2IJaD8qHIoi2JSLd/TqhrC2LB+ad4RsMrqwERTzc+44e0FiLl9kUPSSas+VI0sjDQvQOck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBssM+Dl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBssM+Dl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D94F1F00A3A;
	Tue, 26 May 2026 15:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779809545;
	bh=W/BWCxEGFa/xiGYh6ip3PQ0KqVLRUR+2hnbEju7n7C0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=jBssM+DlkErDLLfdYbQ/jqAWneRkdjn7qbseVTisq4hMxJA2ANMK2ewoMe6ngbGzX
	 +nPPLIL0jKv+xxVoI7rPSzAYmcSyhoJpAVug+prTZwOx0320sNc2zwOm0dvOdiU1Cx
	 g8JAz69L628kaVy9qG7PIUGllGXl7rP9PuPwKFMfA85S6XQNvylMegN9ZKsB5PdkTU
	 TTZgksJo3hUqMxsx+QihH1WGkOWTw73ZKg5IWp46RyVt9hILO5kDAI2/gzZVJbINEX
	 JWc1kwxz4XVcV3TGdbMZuHZLZfLW/6vFoV8DjyiN2HkoPuXkgC/oqSRZHPtE+wWgWu
	 ylhIi54hEzpDA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 26 May 2026 17:32:22 +0200
Message-Id: <DISPTSBBTHC8.2TJ91B1731ZS7@kernel.org>
Subject: Re: [PATCH v3 4/5] driver core: Allow the constification of device
 attributes
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>, "Zhang Yuwei" <zhangyuwei20@huawei.com>
To: "Mark Brown" <broonie@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net> <20260512-sysfs-const-attr-device_attr-prep-v3-4-cb7c17b34d52@weissschuh.net> <42a1555b-5d98-4601-8699-eab86aeb115a@sirena.org.uk> <874d9889-1a2c-49b9-8d7c-f963fc21dae4@sirena.org.uk>
In-Reply-To: <874d9889-1a2c-49b9-8d7c-f963fc21dae4@sirena.org.uk>

On Tue May 26, 2026 at 5:25 PM CEST, Mark Brown wrote:
> I've now got another bisect which comes out to another driver core
> commit 1137838865bf (driver core: Use mod_delayed_work to prevent lost
> deferred probe work), I don't know that that is an accurate result
> either but it does look like there's something fishy in this area.

When I saw your first mail I did already suspect that it might be this one,=
 as
it is a race that might or might not trigger.

I applied [1] to driver-core-next today, so it should hopefully be fixed fo=
r
tomorrow's linux-next release.

[1] https://lore.kernel.org/driver-core/20260526145824.501263-1-dakr@kernel=
.org/T/#u
