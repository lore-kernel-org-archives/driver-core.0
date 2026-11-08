Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225833;
	b=xLmVgehzpbcT9FSW3IUZfHVkbOF7MsbAAbrApkH2GVoZmMGMFneYcMXK76qJ4EOhanNo
	 8Q0F7L+36Kg++Ht9f+Tvey5NR56TNWJXIDIJBuWdCvTSA3yWWsnwHNOg7lWngmXKJkUr7
	 wBoGG9nqTztesC8MQSpFUsaMJDHj5h/ugAytxwKPvhVpYqXJo1+/bUSIg/aaT0unxIw6+
	 ApOsMtPS33LEX4wdjFA4yH3pC9qUrC7Zw3KLd0G05HSl9cvDIWFa8cf4nTQTazfxTaobK
	 rV48yozrwz6rJCGdSE1HrTHzDnjxj22kTDzBwPkXF0QnEeEwvmAUie85wfTLjGjUlJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225833;
	h=Received:DKIM-Signature:Received:From:To:Cc:In-Reply-To:References:
	 Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=wMtSYrvIc4h6USEC7xnaUKnHEtbCErLUvfEfWz0PR+o=;
	b=N8JirjvoGOFv383Jz0HwhLmjJb3IoLGeAuNudoRsZ50urjg0ZfEzk7rngcR1cEWw9q/z
	 y2nxvU76FjVC2MOwBwgV+Uy6mdHjyyrjKpbEV4vBb5dxsUORtSTeRINSjMPq8gWqjTv72
	 FkJZ7KoXVQ7uufZuIeIMBJl7VHtvx2bSzNXQITIAinB6nYv7GCKZs6SYaTkQyazJEIOQP
	 UoOAXpyOWpC6xBfMLqLpA4x6tw7iPwIUlikUiaTVPNo9ZvIfGw36XOnV6fDxlT91KrulB
	 GcGyc5aIA2xGtBIsm1I2FvCWk2wFhST9ss9c1+Wc4lynuj1xK7u+jRujuKZPJpI2lSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L70ClGoV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8E606A322;
	Mon,  9 Nov 2026 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L70ClGoV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB461F008A1;
	Mon,  9 Nov 2026 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225833;
	bh=wMtSYrvIc4h6USEC7xnaUKnHEtbCErLUvfEfWz0PR+o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L70ClGoVofngmEXKMSxA5TIWaEqCyQfwyRt4NsM06gjrYYqPuDZzJQpg6ULpzyrJl
	 g7Y884d6CMPwzAJMEx07ShAulnx5SKf7ONsnzUbuJikmSRgArLj0Dl5EX98CfywkLz
	 HGdrrt4OZhNZN6UBWsDvIhW9Wq1L99VLLT4qW+YVjpxTSjHHsrReFhPJN9eWNL3YgI
	 MD/Y1a6kNoVSiVJZHMsIJsBpX68O7oGQ1Z009mnXT5wYxsAoOlObW0K0dFtenobA4A
	 KVS3tayXrhn1cQbawILDy9CuDU01/sWfnH8vhOG/5QsOz4u6M4g99YDqgIbVOFxpn1
	 QZlsD0XHvhoDg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 993CD2D3F7F6;
	Mon, 09 Nov 2026 12:03:50 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Victor Chernyakin <chernyakin.victor.j@outlook.com>
In-Reply-To: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
References: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Message-Id: <179414263152.3630016.3105370657040522784.b4-ty@b4>
Date: Sun, 08 Nov 2026 12:57:11 +0000
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jKSZJDE6GqUtCks2pcewI8YqyDLOdEI2/I/ufXaxSzA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+blsWX1men9aWI/eoU8BVq+t+62W2BLm88/wH5c7sO
 nC79rZqRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACZipcbwV0is6PIsnfgHRWqP
 cg0mJTlw6b6LbY4t67DY+25lV2CBKMP/6F8ifmxhnkkHTl1Jnb03/e02Vgfz7mUZ6l/vmCS+kpr
 KCgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 05 Nov 2026 11:34:54 +0100, Andy Shevchenko wrote:
> regmap: Add REG_FIELD_GENMASK() helper macro

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/1] regmap: Add REG_FIELD_GENMASK() helper macro
      https://git.kernel.org/broonie/regmap/c/cbd74ec34c06

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

