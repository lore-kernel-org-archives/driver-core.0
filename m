Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422947;
	b=TFgkgRpCNhpjgbhYoCuZ9Ef4yg/IzfMW0zIhd/4zGrvjT1YmLKVJQPHhAVdFiIzfVNrI
	 wjoec8mKssaCpw4/1EdQiwC0z5atLmGyb2Gf3Rsh3EL94pV7IQYvzPMfp7tooSKCvgwAt
	 6iq34TzysBIJ4XAzufRoes3veGziRrLAG79REWj1OHl4ny2DBrO6boXyvt6ZKXAb/Nj3I
	 5mLPZnaK7wlhwt2lBcicz7PdJ/5cjXdyjZwDAVMruE7fpKF+C6nHDLn8H6nprB6B+gDxa
	 FkW+yUJRC8k1dbfMpONira5jfk3gWsBtXYzvWzUP6Fwf2IPCOwUdgrcuybUGUPB6DlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422947;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=VGWIKmWswB1Q4yLhLzgHlNgrt70vFwanu4l3eS4A5Zw=;
	b=SQyQgeotbu2UMHY1VdwKp5gkNECCJS7UWTTRTKab7CdD5lPMSUQYeafizFO5h7WbLggw
	 +QumSeUNNd2/fTDk6D3Bxg9TCOJvdDtfwws+XvSmVQSFJ9BwNsaKY5w/Xvgueb37sqv1M
	 hwi+V+TQpfIBTjqmwpHW1I7gAUihQsDScwrj8/MreM3H3eJ+JfCb1Kv6adn75teZlZvbM
	 9YomupCM7Us0m2tue+4z6een4XIyKpT/9xCwuoAnN20SMkexW/NDZbwG0OVgTfs53AbQc
	 3WtM65U02ZlWHM3vZBEh3BkqrdMw5i0pz1M3u7btn6phnU/FhrNjchTjjcxV8hnMZzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mRspQmnU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CE4606A324;
	Wed, 11 Nov 2026 18:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mRspQmnU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B07621F00A05;
	Wed, 11 Nov 2026 18:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794422947;
	bh=VGWIKmWswB1Q4yLhLzgHlNgrt70vFwanu4l3eS4A5Zw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mRspQmnUxGUW2s9BQfRJ73ezempym8k8dZnXylohsEGVdeecQ73TuAPvLqLS4obgJ
	 J5tfYJXf6Iy4yUu03HmCGhgqvTZmSG9KDCCyTaZSKUaIw380YvOvTqmIZU5FEcv8D9
	 jgXnYMqpjrirsnlWkCVEZZcPCp41AB4wED1nPbvo5Rel6+lFE39PEzfw//paD7DD0V
	 nXUkCP5CKqJLgoD+uAch5F8O/vKZyklwAhvuqlDx+pR5OVrvdOvtOFFYr6Sde1XUO2
	 C7XiQkWBySl7aidUOcsE4wEcaaL8fIkoBKUnMZSjZj0RlB940e8boHZtGR72ZEnX66
	 XwbR/H+OQ1w9w==
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
Subject: Re: [PATCH v1 2/4] regmap: Drop never used devm_regmap_*_free()
 APIs
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>
In-Reply-To: <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
 <20261110093820.454682-3-andriy.shevchenko@linux.intel.com>
Date: Wed, 11 Nov 2026 18:49:02 +0000
Message-Id: <179442294226.513646.6459407661987242086.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=484; i=broonie@kernel.org;
 h=from:subject:message-id; bh=trXHNXa8gImhO/vuHbTFfq4yvnJ/7p2SAmQ47qaoRQI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+7Jh/qYDD0SH0ZbBtdtaRwCmiPm6Fv7j/r3q7fCZPX
 Y61L3NQRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACbispOR4WnmvInZXG/73H6V
 Wwve9Jqqs1n1L5cGE9+KIDvZqN8HDBj+p/XxiC1R0lPdVVbBcY7lchaDwslWvWlzphuIN1R8V/j
 FBQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> devm_regmap_field_free() was introduced in 2013 and was never ever used.
> devm_regmap_field_bulk_free() was introduced in 2020 and the same story.
> 
> Drop never used APIs.

I tend to think that if we have allocation functions we should have
matching release functions, this avoids cross tree annoyances and bugs
due to people using inappropriate release functions which actually
exist rather than adding the ones they should use.

-- 
Mark Brown <broonie@kernel.org>
